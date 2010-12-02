<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.tape.model.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功注册</title>
<link href="CSS/css.css" rel="stylesheet" type="text/css">
</head>

<body class="body">    
   <div id="container">
       <div id="header">
           <img src="images/1/101.gif" width="57" height="38" align="absmiddle"/>
           &nbsp;中国胶带在线超大集群
       </div><br/><br/>
       <div id="cen"> 
           申请成功！你获得的号码为：<span id="numb"><%=request.getAttribute("sNumber") %> </span><br/>
           请记住你的号码和密码，非常感谢您的加入，祝你开心快乐！
       </div><br/><br/>
       <div class="cent">
           <a href="" class="tishi">本地保存号码</a><br/>
           <a href="" class="tishi">发送账号到邮箱</a><br/>
           <a href="main.jsp" class="tishi">立即登录聊天室</a><br/>
           <a href="leave.jsp" class="tishi">退出</a>
       </div>
   </div>
</body>
</html>
