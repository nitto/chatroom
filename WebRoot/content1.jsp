<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% 
  String numbwith=(String)application.getAttribute("message11"); 
  String str=(String)application.getAttribute(""+numbwith+"");  
  out.print(str);
%>
