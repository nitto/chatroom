<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% 
  //String str1=(String)session.getAttribute("message12");
  String str1=(String)application.getAttribute("message12");  
  String str2=(String)application.getAttribute(""+str1+"");  
  out.print(str2);
%>