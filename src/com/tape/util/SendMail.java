package com.tape.util;

public class SendMail {
	
	public static void sendMail(String serverHost, String serverPort, boolean auth, String userName, String password, String from, String toAdd, String sendType, String checkCode) {
		
		// 这个类主要是设置邮件
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost(serverHost);
		mailInfo.setMailServerPort(serverPort);
		mailInfo.setValidate(auth);
		mailInfo.setUserName(userName);
		mailInfo.setPassword(password);// 您的邮箱密码
		mailInfo.setFromAddress(from);
		mailInfo.setToAddress(toAdd);
		mailInfo.setSubject("请完成胶带集群邮箱注册");
		mailInfo.setContent("&nbsp;&nbsp;亲爱的"+toAdd+"，您好！<br><br>"+
				"&nbsp;&nbsp;&nbsp;&nbsp;胶带集群已经收到了您的注册信息。请点击以下确认链接，立即激活胶带集群通行证：<br><br>"+
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"http://localhost:8081/nittochatroom/sendEmailCallBack.jsp?a="+checkCode+"\">完成注册，立即体验胶带集群之旅</a><br><br>"+
				"&nbsp;&nbsp;&nbsp;&nbsp;如果不能点击该链接地址，请复制并粘贴到浏览器的地址输入框<br><br>"+
				"&nbsp;&nbsp;http://localhost:8081/nittochatroom/sendEmailCallBack.jsp?a="+checkCode+"<br><br>"+
				"&nbsp;&nbsp;胶带集群<br>"+ 
				"&nbsp;&nbsp;" + TimeUtil.getCurrDate());
		
		// 这个类主要来发送邮件
		SimpleMailSender sms = new SimpleMailSender();
		if ("text".equals(sendType)) {
			sms.sendTextMail(mailInfo);// 发送文体格式
		} else {
			sms.sendHtmlMail(mailInfo);// 发送html格式
		}
	}
}
