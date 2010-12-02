<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <title>胶带超大集群</title>
  <style type="text/css">
<!--
.body {
	text-align: center;
	background-color: #FFDFFF;
}
.size {
	height: 30px;
	width: 300px;
	background-color: #FFA;
}
.body #alert {
	font-size: 16px;
	color: #F00;
}
-->
  </style>
  </head>
  <body class="body"><br /><br />
             中国胶带在线超大集群管理员登录页面<br /><br /><br />
     <form name="form" method="post" action="managers?action=Login" >
     <div>                       
                       用户号码：<input name="strnumber" id="strnumber" type="text" class="size" /><br /><br />
                       密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="strpwd" id="strpwd" type="password" class="size" /><br /><br />
         <input name="" type="submit" value="提交" />
     </div>
     </form> 
     <div id="alert">
        <%
          String errorMsg = (String)request.getAttribute("result");
		  if (errorMsg != null) {
		      out.println("提示：登录失败，"+errorMsg);
          }
        %>
     </div>    
  </body>
</html>