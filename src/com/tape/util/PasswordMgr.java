package com.tape.util;

import java.io.File;

public class PasswordMgr {
	private static PasswordMgr instance = null;
	private String savePassword = null;
	protected File PWFile;

	/**
	 * @roseuid 4000D22D01F7
	 */
	private PasswordMgr() {

	}

	public static PasswordMgr getInstance() {
		if (null == instance) {
			instance = new PasswordMgr();

		}
		return instance;
	}

	/**
	 * @roseuid 4000B95000E6
	 */
	public void creat() {
	}

	/**
	 * @return boolean
	 * @roseuid 4000B962036D
	 */
	public boolean validPassword(String password) {
		boolean isPass = false;
		if (null == password) {
			return isPass;
		}

		byte[] newPwd = password.getBytes();
		String dbPwd = savePassword;
		String checkStr = MD5(newPwd);
		if (dbPwd.equals(checkStr)) {
			// Debug.println("相同");
			isPass = true;
		} else {
			// Debug.println("不相同");
			isPass = false;
		}
		return isPass;
	}

	public boolean validPassword(String password, String dbPwd) {
		boolean isPass = false;
		if (null == password) {
			return isPass;
		}
		if (null == dbPwd) {
			return isPass;
		}

		byte[] newPwd = password.getBytes();
		String checkStr = MD5(newPwd);
		if (dbPwd.equals(checkStr)) {
			// Debug.println("相同");
			isPass = true;
		} else {
			// Debug.println("不相同");
			isPass = false;
		}
		return isPass;
	}

	public String getPassword(String s) {
		String password = "";
		if (null != s) {
			byte[] newPwd = s.getBytes();
			password = MD5(newPwd);
		}
		return password;
	}

	/**
	 * @roseuid 4000B9770205
	 */
	@SuppressWarnings("unused")
	public void setPassword(String s) {
		boolean isPass = false;
		if (null == s) {
		}
		byte[] newPwd = s.getBytes();
		String password = MD5(newPwd);

		// 写进文件

	}

	/**
	 * @roseuid 4000B98102D1
	 */
	public void delete() {

	}

	/**
	 * @roseuid 4000B99702F1
	 */
	public void openFile() {

	}

	/**
	 * @roseuid 4000B9E00378
	 */
	public void closeFile() {

	}

	@SuppressWarnings("finally")
	private String MD5(byte[] str) {
		// md5 信息摘要, 不可逆
		String outStr = null;
		try {
			java.security.MessageDigest md = java.security.MessageDigest
					.getInstance("MD5");
			md.update(str);
			byte[] digestedBytes = md.digest();
			outStr = byte2hex(digestedBytes);
		} catch (Exception e) {
			Debug.println("<MD5 failure>");
		} finally {
			return outStr;
		}

	}

	private static String byte2hex(byte[] b) { // 二行制转字符串
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1) {
				hs = hs + "0" + stmp;
			} else {
				hs = hs + stmp;

			}
		}
		return hs.toUpperCase();
	}
	@SuppressWarnings("finally")
	private static String MD6(byte[] str) {
		// md5 信息摘要, 不可逆
		String outStr = null;
		try {
			java.security.MessageDigest md = java.security.MessageDigest
					.getInstance("MD5");
			md.update(str);
			byte[] digestedBytes = md.digest();
			outStr = byte2hex(digestedBytes);
		} catch (Exception e) {
			Debug.println("<MD5 failure>");
		} finally {
			return outStr;
		}

	}
	public static void main(String[] agrs) {
		Debug.println(MD6("admin".getBytes()));
		Debug.println("start=========");
		Debug.println("81DC9BDB52D04DC20036DBD8313ED055".toLowerCase());
		String originalPwd = "admin";
		byte[] newPwd = originalPwd.getBytes();
		Debug.println(originalPwd.toLowerCase());

//		String dbPwd = "698D51A19D8A121CE581499D7B701668";
		String dbPwd = "21232F297A57A5A743894A0E4A801FC3";
		Debug.println(dbPwd.length());

		try {

			// md5 信息摘要, 不可逆
			java.security.MessageDigest md = java.security.MessageDigest
					.getInstance("MD5");

			md.update(newPwd);
			byte[] digestedBytes = md.digest();

			String outStr = byte2hex(digestedBytes);

			if (dbPwd.equals(outStr)) {
				Debug.println("相同");
			} else {
				Debug.println("不相同");

			}
			Debug.println(outStr.toLowerCase());

		} catch (Exception e) {
			Debug.println("faile:");

		}
		Debug.println("end===========");

	}

}

