package com.tape.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tape.model.DbBean;
import com.tape.model.User;
import com.tape.model.UserInfo;

public class crectinfo extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	public crectinfo() {
		super();
	}

	//@SuppressWarnings({ "deprecation", "unchecked" })
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String result = "";
		int m=0;
		
		int sNumber=1;
		String strUserName = request.getParameter("oname").trim();//呢称
		String strPhoto = request.getParameter("photoinside");//头像
		if(strPhoto==""){strPhoto="1";}
		strPhoto = "<img src='images/2/"+strPhoto+".bmp' width='18' height='18' align='absmiddle'/>";
		String strGender = request.getParameter("RadioGroup1");//性别
		String strPasswordold = request.getParameter("passwold").trim();//旧密码
		String strPassword = request.getParameter("passw").trim();//新密码
		String strConfPassword = request.getParameter("passwo");//确认密码
		String strCheck = request.getParameter("yanzhenma");//验证码
		String sone = request.getParameter("sone");//提问1
		String strQuestiona = request.getParameter("protectone").trim();//密码保护1
		String stwo = request.getParameter("stwo");//提问2
		String strQuestionb = request.getParameter("protecttwo").trim();//密码保护2
		String sthree = request.getParameter("sthree");//提问3
		String strQuestionc = request.getParameter("protectthree").trim();//密码保护3
		String strEmail = request.getParameter("ema").trim();//Email
		
		String rand=(String)request.getSession().getAttribute("randomString"); 
		
		for(int i=0;i<1;i++){
		if ((strUserName == null) || (strUserName.equals(""))
				|| (strUserName.length() > 10)) {
			result = "请输入呢称";
			request.setAttribute("result", result);
			try {
				m=1;
				request.getRequestDispatcher("/crectinfo.jsp").forward(request,
						response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
			break;
		}
		
		if ((strPassword == null) || (strPassword.equals(""))
				|| (strPassword.length() > 20) ||(strPassword.length() < 6)) {
			result = "请输入密码（6-20位)";
			request.setAttribute("result", result);
			try {
				m=1;
				request.getRequestDispatcher("/crectinfo.jsp").forward(request,
						response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
			break;
		}		
		
		if ((strConfPassword == null) || (strConfPassword.equals(""))
				|| (strConfPassword.length() > 20) ||(strPassword.length() < 6)) {
			result = "请输入确认密码(6-20位)";
			request.setAttribute("result", result);
			try {
				m=1;
				request.getRequestDispatcher("/crectinfo.jsp").forward(request,
						response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
			break;
		}
		
		if (!strPassword.equals(strConfPassword)) {
			result = "密码与确认密码不匹配，请重新输入密码(不超过20字符)";
			request.setAttribute("result", result);
			try {
				m=1;
				request.getRequestDispatcher("/crectinfo.jsp").forward(request,
						response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
			break;
		}	
		
		if ((strCheck == null) || (strCheck.equals("")) || (strCheck.length() != 6)) {		
			result = "您未输入验证码或验证码位数输入错误！";
			request.setAttribute("result", result);
			try {
				m=1;
				request.getRequestDispatcher("/crectinfo.jsp").forward(request,
						response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
			break;
		}
			    
	    if(!rand.equals(strCheck)){
	    	result = "您输入了错误的验证码";
			request.setAttribute("result", result);
			try {
				m=1;
				request.getRequestDispatcher("/crectinfo.jsp").forward(request,
						response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
			break;
	    }
	    
	    if (strEmail.equals("")||strEmail == null) {
	    	result = "您的邮箱地址为空！请输入";
			request.setAttribute("result", result);
			try {
				m=1;
				request.getRequestDispatcher("/crectinfo.jsp").forward(request,
						response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
			break;
		}
		
		if (strQuestiona.equals("")){
			sone=null;strQuestiona=null;
		}else{
			if(sone.equals("请选择密保问题")){
				result = "您没有选择第一个密码问题，但却作了回答";
				request.setAttribute("result", result);
				try {
					m=1;
					request.getRequestDispatcher("/crectinfo.jsp").forward(request,
							response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
				break;
			}
		}
		
		if (strQuestionb.equals("")){
			stwo=null;strQuestionb=null;
		}else{
			if(stwo.equals("请选择密保问题")){
				result = "您没有选择第二个密码问题，但却作了回答";
				request.setAttribute("result", result);
				try {
					m=1;
					request.getRequestDispatcher("/crectinfo.jsp").forward(request,
							response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
				break;
			}
		}
		
		if (strQuestionc.equals("")){
			sthree=null;strQuestionc=null;
		}else{
			if(sthree.equals("请选择密保问题")){
				result = "您没有选择第三个密码问题，但作了回答";
				request.setAttribute("result", result);
				try {
					m=1;
					request.getRequestDispatcher("/crectinfo.jsp").forward(request,	response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
				break;
			}
		}
		}	
		
		int intGender = -1;
		// 转化变量：
		if (strGender.equals("1")) {
			intGender = 1;
		} else {
			intGender = 0;
		}
		
		User user = new User();
		List<User> users=new ArrayList<User>();
		HttpSession session = request.getSession();
		String str=(String)session.getAttribute("userwith");
		int j=str.indexOf("("); 
		String sNum=str.substring(j+1,j+6);
		sNumber=Integer.parseInt(sNum);
		DbBean dbBean=new DbBean();
		users=dbBean.getUsers(sNumber);	
		user=(User)users.get(0);
		String pwd=user.getUserPwd();      //数据库中用户密码					
		if(!strPasswordold.equals(pwd)){//用户密码不符
	    	m=1;
	    	result = "您输入了错误的旧密码！请重新输入。";
			request.setAttribute("result", result);
			try {
				request.getRequestDispatcher("/crectinfo.jsp").forward(request,response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
	    }
		
		if(m==0){			
			user.setUserNumber(sNumber);
			user.setUserName(strUserName);
			user.setPhoto(strPhoto);
			user.setGender(intGender);
			user.setUserPwd(strPassword);
			user.setQuestiona(sone);
			user.setProtectQuestiona(strQuestiona);
			user.setQuestionb(stwo);
			user.setProtectQuestionb(strQuestionb);
			user.setQuestionc(sthree);
			user.setProtectQuestionc(strQuestionc);
			user.setEmail(strEmail);
			int strClass=0;//非管理员
			user.setMclass(strClass);
			dbBean.updateUser(user);			
			int i=user.getNuma();
			if (i == 1) {
					// 更新成功
				    request.setAttribute("sNumber", sNumber);
					UserInfo usere=UserInfo.getInstance();
					UserListener ul=new UserListener();		//创建UserListener的对象
					String userwith=strPhoto+" "+strUserName+"("+sNum+")";					
					ul.setUser(userwith);					//添加用户
					usere.addUser(ul.getUser());				//添加用户到UserInfo类的对象中
					session.setAttribute("user",ul);		//将UserListener对象绑定到Session中
					session.setAttribute("userwith",userwith);	//保存当前登录的用户名
					try {
						request.getRequestDispatcher("/main.jsp").forward(request, response);
					} catch (Throwable t) {
						getServletContext().log(t.getMessage());
					}
			} else {
					// 注册失败：
				    String userwith=strPhoto+" "+strUserName+"("+sNum+")";
					System.out.println("更新用户" + userwith + "失败!");
					result = "可能你输入了极特别的字符，请重新注册，谢谢!";
					request.setAttribute("result", result);
					try {
						request.getRequestDispatcher("/crectinfo.jsp").forward(request,
								response);
					} catch (Throwable t) {
						getServletContext().log(t.getMessage());
					}
			}
		}
	}
}