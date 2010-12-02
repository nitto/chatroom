<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="safe.jsp"%>
<html>
<head>
<title>聊天室</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/AjaxRequest.js"></script>
<script language="javascript" src="JS/mainother.js"></script>
</head>
<body>
<table width="778" height="150" border="0" align="center" cellpadding="0" cellspacing="0" background="images/top.jpg">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="778" height="276" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="165" valign="top" bgcolor="#f6fded" id="online" style="padding:5px">在线人员列表</td>
    <td width="613"  height="200px" valign="top" background="images/main_bj.jpg" bgcolor="#FFFFFF" style="padding:5px; ">
	<div style="height:290px; overflow:hidden" id="content">聊天内容</div>
	</td>

  </tr>
</table>
<form action="" name="form1" method="post" >
<table width="778" height="95" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#D6D3CE" background="images/bottom.jpg">
  <tr>
    <td height="30" align="left">&nbsp;</td>
    <td height="37" align="left"><input name="from" type="hidden" value="${username}">[${username} ]对
      <input name="to" type="text" value="" size="35" readonly="readonly">
表情
<select name="face" class="wenbenkuang">
  <option  value="无表情的">无表情的</option>
  <option value="微笑着" selected>微笑着</option>
  <option value="笑呵呵地">笑呵呵地</option>
  <option value="热情的">热情的</option>
  <option value="温柔的">温柔的</option>
  <option value="红着脸">红着脸</option>
  <option value="幸福的">幸福的</option>
  <option value="嘟着嘴">嘟着嘴</option>
  <option value="热泪盈眶的">热泪盈眶的</option>
  <option value="依依不舍的">依依不舍的</option>
  <option value="得意的">得意的</option>
  <option value="神秘兮兮的">神秘兮兮的</option>
  <option value="恶狠狠的">恶狠狠的</option>
  <option value="大声的">大声的</option>
  <option value="生气的">生气的</option>
  <option value="幸灾乐祸的">幸灾乐祸的</option>
  <option value="同情的">同情的</option>
  <option value="遗憾的">遗憾的</option>
  <option value="正义凛然的">正义凛然的</option>
  <option value="严肃的">严肃的</option>
  <option value="慢条斯理的">慢条斯理的</option>
  <option value="无精打采的">无精打采的</option>
</select>
说：</td>
    <td width="189" align="left"> &nbsp;&nbsp;字体颜色：
      <select name="color" size="1" class="wenbenkuang" id="select">
        <option selected>默认颜色</option>
        <option style="color:#FF0000" value="FF0000">红色热情</option>
        <option style="color:#0000FF" value="0000ff">蓝色开朗</option>
        <option style="color:#ff00ff" value="ff00ff">桃色浪漫</option>
        <option style="color:#009900" value="009900">绿色青春</option>
        <option style="color:#009999" value="009999">青色清爽</option>
        <option style="color:#990099" value="990099">紫色拘谨</option>
        <option style="color:#990000" value="990000">暗夜兴奋</option>
        <option style="color:#000099" value="000099">深蓝忧郁</option>
        <option style="color:#999900" value="999900">卡其制服</option>
        <option style="color:#ff9900" value="ff9900">镏金岁月</option>
        <option style="color:#0099ff" value="0099ff">湖波荡漾</option>
        <option style="color:#9900ff" value="9900ff">发亮蓝紫</option>
        <option style="color:#ff0099" value="ff0099">爱的暗示</option>
        <option style="color:#006600" value="006600">墨绿深沉</option>
        <option style="color:#999999" value="999999">烟雨蒙蒙</option>
      </select></td>
    <td width="19" align="left">&nbsp;</td>
  </tr>
  <tr>
    <td width="21" height="30" align="left">&nbsp;</td>
    <td width="549" align="left">
      <input name="content1" type="text" size="70" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}">
      <input name="Submit2" type="button" class="btn_grey" value="发送" onClick="send()"></td>
    <td align="right"><input name="button_exit" type="button" class="btn_grey" value="退出聊天室" onClick="Exit()"></td>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td height="30" align="left">&nbsp;</td>
    <td colspan="2" align="center" class="word_dark">&nbsp;All CopyRights ? reserved 2009 吉林省XXXXXX有限公司</td>
    <td align="center">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>