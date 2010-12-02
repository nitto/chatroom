package com.tape.servlet;
import com.tape.model.UserInfo;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;

public class UserListener implements javax.servlet.http.HttpSessionBindingListener {
	
	private String user;
	
	private UserInfo container = UserInfo.getInstance();//获得UserInfo类的对象
	
	private UserInfo containerall = UserInfo.getInstanceall();

	public UserListener() {
		user="";
	}
	
	public void setUser(String user) {// 设置在线监听对象
		this.user = user;
	}
	
	public String getUser() {// 获取在线监听
		return this.user;
	}
	
	// 当Session有对象加入时执行的方法
	public void valueBound(HttpSessionBindingEvent arg0) {
		//Object str=arg0.;System.out.println("str=" + str );
		//String name=arg0.getName();
		//if(name.equals("user")){System.out.println("name=" + name );
			//UserInfo userwith=UserInfo.getInstance();
			//HttpSession session = arg0.getSession();//System.out.println("session=" + session.getId() );
			//session.removeAttribute("user");
		//}
		System.out.println("上线用户：" + this.user );
	}	

	// 当Session有对象移除时执行的方法
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		System.out.println("下线用户：" + this.user );
		if (user != "") {
			container.removeUser(user);
		}
		containerall.addUserall(user);
	}
}
