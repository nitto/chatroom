<%@page contentType="text/html" pageEncoding="utf-8" %>
<%if (null==session.getAttribute("mclass") || "".equals(session.getAttribute("mclass"))){
	out.println("<script language='javascript'>alert('进入超时或者非法进入，请重新登录!');window.location.href='managerlogin.jsp';</script>");
	return;
}%>