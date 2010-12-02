<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ include file="managersafe.jsp"%>
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
	width: 150px;
	background-color: #FFA;
}
.size2 {
	height: 30px;
	width: 343px;
	background-color: #FFA;
}
.body #alert {
	font-size: 16px;
	color: #F00;
}
-->
  </style>
  </head>
  <body class="body"><br />
             中国胶带在线超大集群管理员页面<br /><br /><br />
     <form name="form1" method="post" action="managers?action=Manager1" >
     <input name="sessid" id="sessid" type="hidden" value="<%=session.getId() %>" />
     <div>
                        删除成员表(注明：填写要删除的人员号码)<br />
         <input name="num1" id="num1" type="text" class="size" />
         <input name="num2" id="num2" type="text" class="size" />
         <input name="num3" id="num3" type="text" class="size" /><br />
         <input name="num4" id="num4" type="text" class="size" />
         <input name="num5" id="num5" type="text" class="size" />
         <input name="num6" id="num6" type="text" class="size" /><br />
         <input name="num7" id="num7" type="text" class="size" />
         <input name="num8" id="num8" type="text" class="size" />
         <input name="num9" id="num9" type="text" class="size" /><br />
         <input name="num10" id="num10" type="text" class="size" />
         <input name="num11" id="num11" type="text" class="size" />
         <input name="num12" id="num12" type="text" class="size" /><br />
         <input name="" type="submit" value="提交" />
     </div><br /><br /><br />
     </form>
     
     <div>
                       管理员管理：（注明：只有本群创建者方有权限）<br /><br />
         <form name="form2" method="post" action="managers?action=Manager2" > 
         <input name="sesid" id="sesid" type="hidden" value="<%=session.getId() %>" />            
                       号码<input name="numa" id="numa" type="text" class="size" />&nbsp;级别<input name="classa" id="classa" type="text" class="size" />
         <br /><input name="" type="submit" value="提交" /><br /><br />
         </form>
     </div> 
     <div id="alert">
        <%
          String errorMsg = (String)request.getAttribute("result");
		  if (errorMsg != null) {
		      out.println("提示："+errorMsg);
          }
        %>
     </div> 
  </body>
</html>
