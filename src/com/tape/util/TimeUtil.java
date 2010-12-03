package com.tape.util;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.lang.StringUtils;

/**
 * Title: TimeUtil 
 * Description: 时间、日期处理公共类 
 * Copyright: Copyright (c) 2008
 * @author Zhantao Feng
 * @version 1.0
 */
public class TimeUtil {

	protected Locale locale;
	private static final String Simple_Date_Format = "yyyy-MM-dd";
	private static final int Simple_Date_Format_Length = Simple_Date_Format
			.length();
	private static final String Simple_DateTime_Format = "yyyy-MM-dd HH:mm:ss";

	public TimeUtil() {
		this(Locale.getDefault());
	}

	public TimeUtil(Locale locale) {
		this.locale = locale;
	}

	/**
	 * 格式化时间格式
	 * 
	 * @param inDate
	 *            String 需要格式的字符串
	 * @return String 返回格式化好的日期字符串
	 */
	public static String formatDatetime(String inDate) {

		char day_sep = 0;
		if (inDate.indexOf("-") > 0) {
			day_sep = '-';
		} else if (inDate.indexOf("/") > 0) {
			day_sep = '/';
		} else if (inDate.indexOf(".") > 0) {
			day_sep = '.';
		}

		if (day_sep == 0) {
			return "";
		}

		String inYear = "", inMonth = "", inDay = "";
		String inHour = "", inMinute = "", inSecond = "";

		inYear = inDate.substring(0, inDate.indexOf(day_sep));
		inDate = inDate.substring(inDate.indexOf(day_sep) + 1);

		if (inDate.indexOf(day_sep) > 0) {
			inMonth = inDate.substring(0, inDate.indexOf(day_sep));
			inDate = inDate.substring(inDate.indexOf(day_sep) + 1);

			if (inDate.indexOf(" ") > 0) {
				inDay = inDate.substring(0, inDate.indexOf(" "));
				inDate = inDate.substring(inDate.indexOf(" ") + 1);
			} else {
				inDay = inDate;
				inDate = "";
			}
		}

		if (inDate.indexOf(":") > 0) {
			inHour = inDate.substring(0, inDate.indexOf(":"));
			inDate = inDate.substring(inDate.indexOf(":") + 1);

			if (inDate.indexOf(":") > 0) {
				inMinute = inDate.substring(0, inDate.indexOf(":"));
				inDate = inDate.substring(inDate.indexOf(":") + 1);

				inSecond = inDate;
			}
		}

		String result = inYear.trim() + "." + inMonth.trim() + "."
				+ inDay.trim();
		if (inHour.trim().length() > 0) {
			result += " " + inHour.trim() + ":" + inMinute.trim() + ":"
					+ inSecond.trim();
		} else {
			result += " 00:00:00";
		}

		return result;
	}

	/**
	 * 比较时间大小
	 * 
	 * @param datetime1
	 *            String 第一个日期字符串字符串
	 * @param datetime2
	 *            String 第一个日期字符串字符串
	 * @return boolean 若大于则返回true,否则返回false
	 */
	public static boolean compareDatetime(String datetime1, String datetime2) {

		long ldatetime1 = 0;
		long ldatetime2 = 0;

		if (datetime1 != "") {
			if (datetime1.length() == 10) { // 若为2005-03-31格式，则转换为2005-03-31
				// 00:00:00格式
				datetime1 = datetime1 + " 00:00:00";
			}
			ldatetime1 = Timestamp.valueOf(datetime1).getTime();
		}
		if (datetime2 != "") {
			if (datetime2.length() == 10) {
				datetime2 = datetime2 + " 00:00:00";
			}
			ldatetime2 = Timestamp.valueOf(datetime2).getTime();
		}
		if (datetime1 == "") {
			ldatetime1 = 0;
		}
		if (datetime2 == "") {
			ldatetime2 = 0;
		}
		if (ldatetime1 >= ldatetime2) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 字符串转换为普通的日期
	 */
	public static java.util.Date strToSysDate(String str) {
		if (null != str && str.length() > 0) {
			try {
				if (str.length() <= Simple_Date_Format_Length) { // 只包含日期。
					return (new SimpleDateFormat(Simple_Date_Format))
							.parse(str);
				} else { // 包含日期时间
					return (new SimpleDateFormat(Simple_DateTime_Format))
							.parse(str);
				}
			} catch (ParseException error) {
				return null;
			}
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public static Object convert(Class type, Object value) {
		if (value == null) {
			return null;
		} else if (type == Date.class) {
			return convertToDate(type, value);
		} else if (type == String.class) {
			return convertToString(type, value);
		} else if (type == Boolean.class) {
			return convertToBoolean(type, value);
		} else if (type == Object.class) {
			return convertToObject(type, value);
		}

		throw new ConversionException("Could not convert "
				+ value.getClass().getName() + " to " + type.getName());
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	protected static Object convertToString(Class type, Object value) {
		String str;
		java.sql.Timestamp dat;
		boolean ifdate;
		if (value instanceof Date) {
			try {
				dat = (java.sql.Timestamp) value;
				if ((dat.getHours() == 0) && (dat.getMinutes() == 0)
						&& (dat.getSeconds() == 0)) {
					ifdate = true;
				} else {
					ifdate = false;
				}
				str = (new SimpleDateFormat(Simple_DateTime_Format))
						.format(dat);
				if ((str.length() <= Simple_Date_Format_Length) || (ifdate)) { // 只包含日期。
					str = (new SimpleDateFormat(Simple_Date_Format))
							.format(dat);
				}
				return str;
			} catch (Exception e) {
				throw new ConversionException("Error converting Date to String");
			}
		}

		if (value instanceof Boolean) {
			try {
				// if (!Constants.ifBoolToStr)
				// return value;
				Boolean obj = (Boolean) value;
				if (obj.booleanValue()) {
					return "是";
				} else {
					return "否";
				}

			} catch (Exception e) {
				throw new ConversionException("Error converting Date to String");
			}
		}
		return value.toString();
	}

	@SuppressWarnings("unchecked")
	protected static Object convertToDate(Class type, Object value) {
		if (value instanceof Date) {
			return value;
		}

		if (value instanceof String) {
			try {
				if (StringUtils.isEmpty(value.toString())) {
					return null;
				}
				return new java.sql.Date(strToSysDate((String) value).getTime());
			} catch (Exception pe) {
				throw new ConversionException("Error converting String to Date");
			}
		}

		throw new ConversionException("Could not convert "
				+ value.getClass().getName() + " to " + type.getName());
	}

	@SuppressWarnings("unchecked")
	protected static Object convertToBoolean(Class type, Object value) {

		if (value instanceof String) {
			try {
				// if (!Constants.ifBoolToStr)
				// return value;
				@SuppressWarnings("unused")
				Boolean obj = null;
				if (value.equals("1")) {
					return Boolean.valueOf("true");
				} else {
					return Boolean.valueOf("false");
				}
				// return obj.valueOf((String)value);

			} catch (Exception pe) {
				throw new ConversionException("Error converting String to Date");
			}
		}

		return value;
	}
	
	/**
	 * 获得系统当前日期(2009-01-18)
	 * 
	 * @return String 返回日期（字符型）
	 */
	public static String getCurrDate() {
		long today = System.currentTimeMillis();
		java.sql.Timestamp DateCreated = new Timestamp(today);
		String now = DateCreated.toString();
		String year = now.substring(0, 4);
		String month = now.substring(5, 7);
		String day = now.substring(8, 10);
		return year + '-' + month + '-' + day;
	}

	@SuppressWarnings("unchecked")
	protected static Object convertToObject(Class type, Object value) {
		return value;
	}

	public static Timestamp getNowTime() throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date date = formatter.parse(formatter
				.format(new java.util.Date()));
		return new Timestamp(date.getTime());
	}

}
