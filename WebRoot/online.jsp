<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.tape.model.UserInfo"%>
<%@ page import="java.util.*"%>

<%
  UserInfo list=UserInfo.getInstance();
  Vector<String> vector=list.getList();
  
  UserInfo userall=UserInfo.getInstanceall();
  Vector<String> vectorall=userall.getListall();
  int amount,amountall,amo;
  if(vector!=null && vector.size()>0){
	 String str="";	 
	 amount=vector.size();
	 amountall=vectorall.size();	 
%>
 <div class="totalperson">群成员(<%=amount%>/<%=amountall+amount %>)</div>
 <div id="online2">
<%   
	 for(int i=0;i<amount;i++){
		 String userwith1=(String)vector.elementAt(i);
         str=userwith1.replaceAll("'","&");
		 str=str.replaceAll(">","#");
		 out.print("<span class='oncolor' ondblclick='singlechat(&quot;"+str+"&quot;)'>&nbsp;"+userwith1+"</span><br>");//在线人员列表		 
	 }
	 for(int i=0;i<amountall;i++){
		 str=(String)vectorall.elementAt(i);
		 String userwith2=str.replaceAll("/>"," style='filter:gray'/>"); 
		 str=str.replaceAll("'","&");
		 str=str.replaceAll(">","#");
		 out.print("<span class='upcolor' ondblclick='singlechat(&quot;"+str+"&quot;)'>&nbsp;"+userwith2+"</span><br>");//在线人员列表		 
	 }
%>
 </div >
<%
  }
%>