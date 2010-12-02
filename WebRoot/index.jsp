<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="com.tape.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>胶带超大集群</title>
<link href="CSS/tape.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="JS/mainn.js"></script>
<script language="javascript" src="JS/indext.js"></script>
</head>

<body class="oneColLiqCtrHdr">
<div id="container">
  <div id="header">   
   &nbsp;中国胶带在线超大集群
  <!-- end #header --></div>
  <div id="header2"></div>  
  <div id="mainContent">
    <div id="leftwin">
      <div id="leftwin1">交谈中请勿轻信汇款、中奖信息，勿轻易拨打中奖电话。 </div>
      <div id="content"></div>   
      <div id="leftwin3"></div>
      <div id="content11">
         <div id="alert">
             <%Object errorMsg = request.getAttribute("resultt");
		       //User user = (User) request.getAttribute("user");
		       if (errorMsg != null) {
		           out.println("提示："+errorMsg.toString());
               }
		     %>
         </div>
         <form name="form3" method="post" action="Messages?action=loginRoom" onsubmit="return check()">
                                用户名：<input type="text" name="usernumber" size="12" id="login"/>&nbsp;&nbsp;
                                密&nbsp;&nbsp;码：<input type="password" name="loginpass" size="13" />&nbsp;&nbsp;
             <input name="sub" type="submit" value="登    录" />&nbsp;&nbsp;
             <input name="reset" type="reset" value="重    置" />
         </form>
         <div>
             <a href="register.jsp"><img src="images/22.gif" class="btn_link" /></a>
             &nbsp;&nbsp;<a href=""><img src="images/23.gif" class="btn_link" /></a>
         </div>
      </div>
    <!-- end #leftwin --></div>    
    <div id="rigthwin">      
      <div id="rightwin1">群动态
      <!-- end #rigthwin1 --></div>
      <div id="rightwin2">         
        <img src="images/29.gif" onclick="log()" /><img src="images/30.gif" onclick="log()" /><img src="images/31.gif" onclick="log()" /><img src="images/32.gif" onclick="log()" />
      <!-- end #rigthwin2 --></div>
      <div id="rigthwin3">
        <div id="r31"></div> 
        <div id="r32"></div> 
        <div id="r33"></div> 
        <div id="r34"></div> 
      <!-- end #rigthwin3 --></div>
      <div id="online"></div>
    <!-- end #rightwin --></div>
  <!-- end #mainContent --></div>
  <div id="footer"></div>
<!-- end #container --></div>
</body>
</html>
