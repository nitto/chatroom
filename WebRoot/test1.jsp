<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="CSS/datePickerTheme.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="JS/testinsertface.js"></script>
	<script language="javascript" src="JS/jquery-1.4.2.js"></script>
	<script language="javascript" src="JS/jquery-ui-1.8.6.custom.js"></script>
    <script language="javascript" src="JS/jquery.ui.core.js"></script>    
    <script language="javascript" src="JS/jquery.ui.datepicker.js"></script>
    <script language="javascript">
            $(function(){
                $("#date".datepicker();
            });
        </script> 
  <style type="text/css">
<!--
#move {
	background-color: #9FF;
	height: 50px;
	width: 150px;
	color: #F00;
	border: thin solid #00F;
	position: absolute;
	left: 150px;
	top: 130px;
}
#myDiv {
	color: #808080;
	background-color: #FFF;
}
#openspan {
	display: block;
}
.singlechat {
	background-color: #FF3FFF;
	position: absolute;
	left: 20px;
	top: 20px;
}
-->
  </style>
  </head>
  
  <body>
      <form>
        <label>Enter a date:</label><input id="date">
        <script language="javascript">
            $(function(){
                $("#date".datepicker();
            });
        </script> 
        <br>
        <textarea name="txtContent" cols="50" rows="5" id="txtContent">先在本文框中点击鼠标。
        </textarea>
        <br>
        <div id="myDiv"><img src="images/1/30.gif" width="40" height="36" style="filter:gray">
        </div>
        <input type = "button" value = "插入字符串 {Good}" onClick="insertString('images/4/01.gif')"/>   
        <input type = "button" value = "插入字符串 {Bad}" onClick="Insertface('images/4/01.gif')"/>       
        <input type = "button" value = "获取选中的文本" onClick="openWindow('index.jsp')"/><br />
      </form>
      <span id="openspan" onDblClick="openspan('12345')">测试SPAN打开双击的JS</span>
      <div id="move" onMouseDown="move(1)" onMouseUp="move(2)">创建可以移动的区域试验      
      </div>
      <div id="container"></div>
  </body>
</html>
