package com.tape.util;

import java.net.*;
import java.security.*;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

/**
 * 
 * Title: UuidGet Description: 基于128 位唯一值产生算法生成16 进制数值 （编码后以长度32 的字符串表示）作为主键
 * Copyright: Copyright (c) 2008 Company:
 * 
 * @author Zhantao Feng
 * @version 1.0
 */

public class UuidGet {
	private int timeLow; // 32 bits
	private int node; // 32 bits
	private String hexInetAddress; // 32 bits
	private String thisHashCode; // 32 bits
	private String midValue;
	private SecureRandom seeder;

	/**
	 * 构造函数
	 */
	public UuidGet() {
		try {
			StringBuffer tmpBuffer = new StringBuffer();

			// initalise the secure random instance
			seeder = new SecureRandom();

			// get the inet address
			InetAddress inet = InetAddress.getLocalHost();
			byte[] bytes = inet.getAddress();
			hexInetAddress = hexFormat(getInt(bytes), 8);

			// get the hashcode
			thisHashCode = hexFormat(this.hashCode(), 8);

			/*
			 * set up a cached midValue as this is the same per method / call as
			 * is object specific and is the / ...-xxxx-xxxx-xxxx-xxxx.. mid
			 * part of the sequence
			 */
			tmpBuffer.append(hexInetAddress.substring(0, 4));
			tmpBuffer.append(hexInetAddress.substring(4));
			tmpBuffer.append(thisHashCode.substring(0, 4));
			tmpBuffer.append(thisHashCode.substring(4));
			midValue = tmpBuffer.toString();

			// load up the randomizer first value
			int node = seeder.nextInt();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private static String hexFormat(final int i, final int j) {
		String s = Integer.toHexString(i);
		return padHex(s, j) + s;
	}

	private static String padHex(final String str, final int i) {
		StringBuffer buf = new StringBuffer();
		if (str.length() < i) {
			for (int j = 0; j < i - str.length(); j++) {
				buf.append('0');
			}
		}
		return buf.toString();
	}

	private static int getInt(final byte[] abyte) {
		int i = 0;
		int j = 24;
		for (int k = 0; j >= 0; k++) {
			int l = abyte[k] & 0xff;
			i += l << j;
			j -= 8;
		}
		return i;
	}

	/**
	 * 生成外部主键
	 * 
	 * @return String 生成的主键
	 */
	public String getUUID() {
		long timeNow = System.currentTimeMillis();
		timeLow = (int) timeNow & 0xFFFFFFFF;
		int node = seeder.nextInt();
		return (hexFormat(timeLow, 8) + midValue + hexFormat(node, 8));
	}

	public static void main(String[] args) {
		UuidGet ug = new UuidGet();
		String id = ug.getUUID();
		System.out.println(id);
	}
}
