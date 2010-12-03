package com.tape.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.tape.util.Debug;
import com.tape.util.PasswordMgr;

/**
 * 通过JDBC连接MySql数据库公共类
 * @author Victor Von
 *
 */
public class DBUtil {

	/** 声明日志对象 */
	private static final Logger log = Logger.getLogger(DBUtil.class);
	
	private DataSource dataSource;
	/** 建立数据库连接 */
	private Connection conn = null;
	/** statement用来执行SQL语句 */
	private Statement statement = null;
	/**  结果集 */
	private ResultSet rs = null;

	public DBUtil() {
		try {
			
			Context initContext = new InitialContext();
            Context envContext = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/chatroom");
            conn = dataSource.getConnection();
            
		} catch (Exception e) {
			Debug.println("Sorry,can`t find the Driver!");
			log.error("Sorry,can`t find the Driver!" + e.getMessage());
		} 
	}
	
	/**
	 * 
	 * @param sql 要执行的SQL语句
	 */
	public void save(String sql) {
		try {
			statement = conn.createStatement();

			statement.executeUpdate(sql);
			
			conn.close();
		} catch (SQLException e) {
			Debug.println("DBUtil's save method Cause an Exception: " + e.getMessage());
			log.error("DBUtil's save method Cause an Exception: " + e.getMessage());
		}
	}
	
	/**
	 * 
	 * @param sql 要执行的SQL语句
	 * @return ResultSet  SQL返回的数据列表
	 */
	public ResultSet query(String sql) {
		try {
			statement = conn.createStatement();

			rs = statement.executeQuery(sql);
			
			rs.close();
			conn.close();
			return rs;
		} catch (SQLException e) {
			Debug.println("DBUtil's query method Cause an Exception: " + e.getMessage());
			log.error("DBUtil's query method Cause an Exception: " + e.getMessage());
			return rs;
		}
	}
	
	public static void main(String[] args) {
		DBUtil util = new DBUtil();
		String pwd = PasswordMgr.getInstance().getPassword("123");
		String sql = "insert into user(username, password, email, nick, sex) values('victor1', '"+pwd+"', 'aaa@yahoo.com', 'test', '1')";
		util.save(sql);
	}
	
}
