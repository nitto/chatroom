package com.tape.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class UserInfo {
	
	private static UserInfo user = new UserInfo();
	
	private static UserInfo userall = new UserInfo();
	
	private Vector<String> vector = null;//增加了<String>
	
	private Vector<String> vectorall = null;
	
	
	
	private UserInfo() {// 利用private调用构造函数，防止被外界产生新的instance对象
		this.vector = new Vector<String>();//增加了<String>
		this.vectorall = new Vector<String>();
		
		User useridd = new User();
		List<User> useral=new ArrayList<User>();
		DbBean dbBeanall=new DbBean();   
		useral=dbBeanall.getUserall();
		for(int i=0;i<useral.size();i++){					
		    useridd=(User)useral.get(i);
		    int usernumberall=useridd.getUserNumber();
		    //if(usernumberall==sNumber){continue;}
		    String usernameall=useridd.getUserName();
		    String userphoto=useridd.getPhoto();
		    usernameall=userphoto+" "+usernameall+"("+usernumberall+")";//System.out.println("usernameall="+usernameall);
		    vectorall.add(usernameall);
		}
	}	
	
	public static UserInfo getInstance() {// 外界使用的instance对象
		return user;
	}
	
	public static UserInfo getInstanceall() {// 外界使用的instance对象		
		return userall;
	}
	
	public boolean addUser(String user) {// 增加用户
		if (user != null) {
			this.vector.add(user);
			return true;
		} else {
			return false;
		}		
	}
	
	public boolean addUserall(String userall) {// 增加用户
		if (userall != null) {
			this.vectorall.add(userall);
			return true;
		} else {
			return false;
		}
	}
	
	public Vector<String> getList() {// 获取用户列表，增加了<String>
		return vector;
	}
	
	public Vector<String> getListall() {// 获取用户列表，增加了<String>		
		return vectorall;
	}
	
	public void removeUser(String user) {// 移除用户,将String改成了User
		if (user != null) {
			vector.removeElement(user);
		}
	}
	
	public void removeUserall(String userall) {// 移除用户,将String改成了User
		if (userall != null) {
			vectorall.removeElement(userall);
		}
	}
}

