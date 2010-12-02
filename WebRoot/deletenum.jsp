<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% 
  String str=(String)application.getAttribute("totalNumber"); 
  //System.out.println("prstr="+str);
  //response.setContentType("text/html;charset=UTF-8");
  //request.setCharacterEncoding("UTF-8");
  String extreall = request.getParameter("extreall");
  //System.out.println("extreall="+extreall);
  int startIn=str.indexOf(extreall);
  //System.out.println("startIn="+startIn);
  if(startIn !=-1){
      int endIn=str.indexOf("(",startIn);      
      String numberDelete=str.substring(startIn,endIn);
      //System.out.println("numberDelete="+numberDelete);
      
      String re="@"+numberDelete+"\\p{Punct}+\\d{5}+\\p{Punct}";
      str=str.replaceAll(re,"");
      //ServletContext application = getServletContext();
      application.setAttribute("totalNumber", str);
      //System.out.println("afterstr="+str);
      //System.out.println("afterstrr="+strrr);
  }
%>
