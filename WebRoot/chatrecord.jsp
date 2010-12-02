<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
  String str=(String)application.getAttribute("chatrecord");  
  out.print(str);
%>
