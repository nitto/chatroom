<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tape.db.DBUtil" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>胶带超大集群 - 邮箱验证</title>
</head>
<body>
<script language="javascript">
<%
	String checkCode = request.getParameter("a");
%>
<%
	if (checkCode == null || "".equals(checkCode)) {
%>
	alert("验证失败！");
<%
	} else {
		DBUtil dbUtil = new DBUtil();
		dbUtil.save("update user set isChecked=1 where checkCode='"+ checkCode + "'");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
%>
</script>
</body>
</html>