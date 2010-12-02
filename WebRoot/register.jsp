<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="com.tape.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link href="CSS/css.css" rel="stylesheet" type="text/css" /> 
<script language="javascript" src="JS/register.js"></script>
</head>

<body class="body">  
<div id="container">
  <div id="header">
    <img src="images/1/101.gif" width="57" height="38" align="absmiddle"/>&nbsp;中国胶带在线超大集群用户注册
  <!-- end #header --></div> 
  <div id="alert">
      <%
          Object errorMsg = request.getAttribute("result");
		  User user = (User) request.getAttribute("user");
		  if (errorMsg != null) {
		      out.println("提示：注册失败，"+errorMsg.toString());
          }
      %>
  </div>
  <div id="mainContent">     
     <form id="form4" name="form4" method="post" action="RegisterServlet" onsubmit="checke()">
        <table align="center" cellpadding="0" cellspacing="5" id="maintable">
           <tr>
               <td width="295" class="right">呢&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
               <td width="448" class="left">
                 <input name="oname" id="oname" type="text" class="tdwidth" value="<%=(user==null)?"":user.getUserName()%>"/>
          *</td>
           </tr>
           <tr>
               <td class="right">头&nbsp;&nbsp;&nbsp;&nbsp;像：</td>               
               <td class="left">
                  <div id="photoin">
                    <img src='images/2/1.bmp'/>
                  </div>
                  <div>
                     <input name="photobutton" id="photobutton" type="button" value="更多头像" onclick="photohide()"/>
                     <input name="photoinside" id="photoinside" type="hidden" value="" />
                  </div>
               </td>
          </tr>
           <tr>
               <td class="right">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
               <td  class="left">
                   <label>
                     <input name="RadioGroup1" type="radio" id="sex1" value="1" checked="checked"/>
                     男
                 </label>
                 <label>
                   <input type="radio" name="RadioGroup1" id="sex0" value="0"/>
                   女
                 </label>
               </td>
           </tr>
           <tr>
               <td class="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
               <td class="left" >
                 <input name="passw" id="passw" type="password" class="tdwidth"/> *
               </td>
           </tr>
            <tr>
               <td>&nbsp;</td>
               <td class="word">6-16个字符组成，区分大小写</td>
           </tr>
           <tr>
               <td class="right">确认密码：</td>
               <td  class="left">
                 <input name="passwo" id="passwo" type="password" class="tdwidth"/>
               *</td>
           </tr>
           <tr>
               <td class="right">您的邮箱：</td>
               <td  class="left">
                 <input name="ema" type="text" class="tdwidth" id="ema" value="<%=(user==null)?"":user.getEmail()%>"/>
               *</td>
           </tr> 
           <tr>
               <td class="right">验&nbsp;证&nbsp;码：</td>
               <td  class="left">
                 <input name="yanzhenma" type="text" class="tdwidth" id="yanzhenma" value="请输入你在下图中看到的验证码，区分大小写 <%=(user==null)?"":user.getYanZhenMa()%>" onclick="yanzhen()"/>
               *
               </td>
           </tr>
            <tr>
               <td class="right">验证图片：</td>
               <td  class="left">
                   <img src="IdentityServlet" id="identity" />
                     <input type=button value="换个验证图片 " onclick="reloadImage()" id="btn"/>
                     <input name="rand" type="hidden" value="<%=(String)session.getAttribute("randomString")%>"/>
               </td>
           </tr>                    
           <tr>
               <td colspan="2">&nbsp;</td>
           </tr>
           <tr>
               <td></td>
               <td id="baohu">密码保护设置</td>
           </tr>
           <tr>
               <td class="right">问题一：               
                 <select name="sone" id="sone">
                   <option selected="selected">请选择密保问题</option>
                   <option>您母亲的姓名是？</option>
                   <option>您父亲的姓名是？</option>
                   <option>您配偶的姓名是？</option>
                   <option>您高中班主任的姓名是？</option>
                   <option>您初中班主任的姓名是？</option>
                   <option>您小学班主任的姓名是？</option>
                   <option>您的学号（或工号）是？</option>
                   <option>您父亲的生日是？</option>
                   <option>您母亲的生日是？</option>
                   <option>您配偶的生日是？</option>
                   <option>您孩子的生日是？</option>
                   <option>您最熟悉的童年好友名字是？</option>
                   <option>对您影响最大的人名字是？</option>
                 </select>
               </td>           
             <td  class="left">
               <input name="protectone" type="text" class="tdwidth" id="protectone" value="<%=(user==null)?"":user.getQuestiona()%>"/>
             </td>
           </tr>
           <tr>
               <td class="right">问题二：
                   <select name="stwo" id="stwo">
                   <option selected="selected">请选择密保问题</option>
                   <option>您母亲的姓名是？</option>
                   <option>您父亲的姓名是？</option>
                   <option>您配偶的姓名是？</option>
                   <option>您高中班主任的姓名是？</option>
                   <option>您初中班主任的姓名是？</option>
                   <option>您小学班主任的姓名是？</option>
                   <option>您的学号（或工号）是？</option>
                   <option>您父亲的生日是？</option>
                   <option>您母亲的生日是？</option>
                   <option>您配偶的生日是？</option>
                   <option>您孩子的生日是？</option>
                   <option>您最熟悉的童年好友名字是？</option>
                   <option>对您影响最大的人名字是？</option>
               </select>
               </td>
             <td  class="left">
               <input name="protecttwo" type="text" class="tdwidth" id="protecttwo" value="<%=(user==null)?"":user.getQuestionb()%>"/>
             </td>
           </tr>
           <tr>
               <td class="right">问题三：
                   <select name="sthree" id="sthree">
                   <option selected="selected">请选择密保问题</option>
                   <option>您母亲的姓名是？</option>
                   <option>您父亲的姓名是？</option>
                   <option>您配偶的姓名是？</option>
                   <option>您高中班主任的姓名是？</option>
                   <option>您初中班主任的姓名是？</option>
                   <option>您小学班主任的姓名是？</option>
                   <option>您的学号（或工号）是？</option>
                   <option>您父亲的生日是？</option>
                   <option>您母亲的生日是？</option>
                   <option>您配偶的生日是？</option>
                   <option>您孩子的生日是？</option>
                   <option>您最熟悉的童年好友名字是？</option>
                   <option>对您影响最大的人名字是？</option>
               </select>
               </td>
             <td class="left" >
               <input name="protectthree" type="text" class="tdwidth" id="protectthree" value="<%=(user==null)?"":user.getQuestionc()%>"/>
             </td>
           </tr>                      
           <tr>
               <td></td>
               <td class="left">
                    <input type="submit" name="#8" id="#8" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="#12" id="#5" value="重置"/>
               </td>
           </tr>
           <tr>
               <td></td>
               <td class="word">提示：带"*"的项目为必填项目</td>
           </tr>
        </table>
    </form>        
  <!-- end #mainContent --></div>
  <div id="photoselect">
       <table width="300" border="1" cellpadding="0" cellspacing="2">
         <tr>
             <td><img src="images/2/1.bmp" class="rwi" onclick="photoselect('1')" /></td>
             <td><img src="images/2/2.bmp" class="rwi" onclick="photoselect('2')" /></td>
             <td><img src="images/2/3.bmp" class="rwi" onclick="photoselect('3')" /></td>
             <td><img src="images/2/4.bmp" class="rwi" onclick="photoselect('4')" /></td>
             <td><img src="images/2/5.bmp" class="rwi" onclick="photoselect('5')" /></td>
             <td><img src="images/2/6.bmp" class="rwi" onclick="photoselect('6')" /></td>
             <td><img src="images/2/7.bmp" class="rwi" onclick="photoselect('7')" /></td>
             <td><img src="images/2/8.bmp" class="rwi" onclick="photoselect('8')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/9.bmp" class="rwi" onclick="photoselect('9')" /></td>
             <td><img src="images/2/10.bmp" class="rwi" onclick="photoselect('10')" /></td>
             <td><img src="images/2/11.bmp" class="rwi" onclick="photoselect('11')" /></td>
             <td><img src="images/2/12.bmp" class="rwi" onclick="photoselect('12')" /></td>
             <td><img src="images/2/13.bmp" class="rwi" onclick="photoselect('13')" /></td>
             <td><img src="images/2/14.bmp" class="rwi" onclick="photoselect('14')" /></td>
             <td><img src="images/2/15.bmp" class="rwi" onclick="photoselect('15')" /></td>
             <td><img src="images/2/16.bmp" class="rwi" onclick="photoselect('16')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/17.bmp" class="rwi" onclick="photoselect('17')" /></td>
             <td><img src="images/2/18.bmp" class="rwi" onclick="photoselect('18')" /></td>
             <td><img src="images/2/19.bmp" class="rwi" onclick="photoselect('19')" /></td>
             <td><img src="images/2/20.bmp" class="rwi" onclick="photoselect('20')" /></td>
             <td><img src="images/2/21.bmp" class="rwi" onclick="photoselect('21')" /></td>
             <td><img src="images/2/22.bmp" class="rwi" onclick="photoselect('22')" /></td>
             <td><img src="images/2/23.bmp" class="rwi" onclick="photoselect('23')" /></td>
             <td><img src="images/2/24.bmp" class="rwi" onclick="photoselect('24')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/25.bmp" class="rwi" onclick="photoselect('25')" /></td>
             <td><img src="images/2/26.bmp" class="rwi" onclick="photoselect('26')" /></td>
             <td><img src="images/2/27.bmp" class="rwi" onclick="photoselect('27')" /></td>
             <td><img src="images/2/28.bmp" class="rwi" onclick="photoselect('28')" /></td>
             <td><img src="images/2/29.bmp" class="rwi" onclick="photoselect('29')" /></td>
             <td><img src="images/2/30.bmp" class="rwi" onclick="photoselect('30')" /></td>
             <td><img src="images/2/31.bmp" class="rwi" onclick="photoselect('31')" /></td>
             <td><img src="images/2/32.bmp" class="rwi" onclick="photoselect('32')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/33.bmp" class="rwi" onclick="photoselect('33')" /></td>
             <td><img src="images/2/34.bmp" class="rwi" onclick="photoselect('34')" /></td>
             <td><img src="images/2/35.bmp" class="rwi" onclick="photoselect('35')" /></td>
             <td><img src="images/2/36.bmp" class="rwi" onclick="photoselect('36')" /></td>
             <td><img src="images/2/37.bmp" class="rwi" onclick="photoselect('37')" /></td>
             <td><img src="images/2/38.bmp" class="rwi" onclick="photoselect('38')" /></td>
             <td><img src="images/2/39.bmp" class="rwi" onclick="photoselect('39')" /></td>
             <td><img src="images/2/40.bmp" class="rwi" onclick="photoselect('40')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/41.bmp" class="rwi" onclick="photoselect('41')" /></td>
             <td><img src="images/2/42.bmp" class="rwi" onclick="photoselect('42')" /></td>
             <td><img src="images/2/43.bmp" class="rwi" onclick="photoselect('43')" /></td>
             <td><img src="images/2/44.bmp" class="rwi" onclick="photoselect('44')" /></td>
             <td><img src="images/2/45.bmp" class="rwi" onclick="photoselect('45')" /></td>
             <td><img src="images/2/46.bmp" class="rwi" onclick="photoselect('46')" /></td>
             <td><img src="images/2/47.bmp" class="rwi" onclick="photoselect('47')" /></td>
             <td><img src="images/2/48.bmp" class="rwi" onclick="photoselect('48')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/49.bmp" class="rwi" onclick="photoselect('49')" /></td>
             <td><img src="images/2/50.bmp" class="rwi" onclick="photoselect('50')" /></td>
             <td><img src="images/2/51.bmp" class="rwi" onclick="photoselect('51')" /></td>
             <td><img src="images/2/52.bmp" class="rwi" onclick="photoselect('52')" /></td>
             <td><img src="images/2/53.bmp" class="rwi" onclick="photoselect('53')" /></td>
             <td><img src="images/2/54.bmp" class="rwi" onclick="photoselect('54')" /></td>
             <td><img src="images/2/55.bmp" class="rwi" onclick="photoselect('55')" /></td>
             <td><img src="images/2/56.bmp" class="rwi" onclick="photoselect('56')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/57.bmp" class="rwi" onclick="photoselect('57')" /></td>
             <td><img src="images/2/58.bmp" class="rwi" onclick="photoselect('58')" /></td>
             <td><img src="images/2/59.bmp" class="rwi" onclick="photoselect('59')" /></td>
             <td><img src="images/2/60.bmp" class="rwi" onclick="photoselect('60')" /></td>
             <td><img src="images/2/61.bmp" class="rwi" onclick="photoselect('61')" /></td>
             <td><img src="images/2/62.bmp" class="rwi" onclick="photoselect('62')" /></td>
             <td><img src="images/2/63.bmp" class="rwi" onclick="photoselect('63')" /></td>
             <td><img src="images/2/64.bmp" class="rwi" onclick="photoselect('64')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/65.bmp" class="rwi" onclick="photoselect('65')" /></td>
             <td><img src="images/2/66.bmp" class="rwi" onclick="photoselect('66')" /></td>
             <td><img src="images/2/67.bmp" class="rwi" onclick="photoselect('67')" /></td>
             <td><img src="images/2/68.bmp" class="rwi" onclick="photoselect('68')" /></td>
             <td><img src="images/2/69.bmp" class="rwi" onclick="photoselect('69')" /></td>
             <td><img src="images/2/70.bmp" class="rwi" onclick="photoselect('70')" /></td>
             <td><img src="images/2/71.bmp" class="rwi" onclick="photoselect('71')" /></td>
             <td><img src="images/2/72.bmp" class="rwi" onclick="photoselect('72')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/73.bmp" class="rwi" onclick="photoselect('73')" /></td>
             <td><img src="images/2/74.bmp" class="rwi" onclick="photoselect('74')" /></td>
             <td><img src="images/2/75.bmp" class="rwi" onclick="photoselect('75')" /></td>
             <td><img src="images/2/76.bmp" class="rwi" onclick="photoselect('76')" /></td>
             <td><img src="images/2/77.bmp" class="rwi" onclick="photoselect('77')" /></td>
             <td><img src="images/2/78.bmp" class="rwi" onclick="photoselect('78')" /></td>
             <td><img src="images/2/79.bmp" class="rwi" onclick="photoselect('79')" /></td>
             <td><img src="images/2/80.bmp" class="rwi" onclick="photoselect('80')" /></td>
         </tr>
         <tr>
             <td><img src="images/2/81.bmp" class="rwi" onclick="photoselect('81')" /></td>
             <td><img src="images/2/82.bmp" class="rwi" onclick="photoselect('82')" /></td>
             <td><img src="images/2/83.bmp" class="rwi" onclick="photoselect('83')" /></td>
             <td><img src="images/2/84.bmp" class="rwi" onclick="photoselect('84')" /></td>
             <td><img src="images/2/85.bmp" class="rwi" onclick="photoselect('85')" /></td>
             <td><img src="images/2/86.bmp" class="rwi" onclick="photoselect('86')" /></td>
             <td><img src="images/2/87.bmp" class="rwi" onclick="photoselect('87')" /></td>
             <td><img src="images/2/88.bmp" class="rwi" onclick="photoselect('88')" /></td>
         </tr>
         
       </table>
  </div>
  <div id="footer">
       <p>广州经济技术开发区日东胶粘带经营部</p>
       地址：广州市萝岗区金碧路83号<br/>
       电话：020-82208469
       传真：020-82211009
       QQ：340352007
       E-mail：nitto@139.com<br/>
       网址：www.nittotape.cn  
  <!-- end #footer --></div>
<!-- end #container --></div>
</body>
</html>
