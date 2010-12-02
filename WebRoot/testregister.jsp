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
  <body>
        <%Object errorMsg = request.getAttribute("result");
		  User user = (User) request.getAttribute("user");
		  if (errorMsg != null) {
		      out.println("提示：注册失败，"+errorMsg.toString());
          }
		%>
   
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
             <td><img src="images/2/9.bmp" class="rwi" onclick="photoselect('9')" /></td>
         </tr>
         
       </table>
    </div>
    <div id="maindiv"> 居中测试       
        <form id="form4" name="form4" method="post" action="RegisterServlet" onsubmit="checke()">
        <table width="600" id="maintable" cellspacing="5" cellpadding="0">
           <caption id="head">
                                      中国胶带在线超大集群用户注册
           </caption>
           <tr>
               <td class="right">呢&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
               <td colspan="4" ><input name="oname" id="oname" type="text" class="widt" value="<%=(user==null)?"":user.getUserName()%>"/>
               *</td>
           </tr>
           <tr>
               <td class="right">头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</td>               
               <td id="photoin"><img src="images/2/1.bmp" /></td>
               <td><input name="photobutton" id="photobutton" type="button" value="更多头像"/></td>
          </tr>
           <tr>
               <td class="right">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
               <td colspan="4">
                   <label><input name="RadioGroup1" type="radio" id="sex1" value="1" checked="checked"/>男</label>
                   <label><input type="radio" name="RadioGroup1" id="sex0" value="0"/>女</label>*
                </td>
           </tr>
           <tr>
               <td class="right">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
               <td colspan="4"><input name="passw" id="passw" type="password" class="widt"/></td>
           </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="4" id="mima">6-16个字符组成，区分大小写</td>
           </tr>
           <tr>
               <td class="right">确认密码：</td>
               <td colspan="4"><input name="passwo" id="passwo" type="password" class="widt"/>
               *</td>
           </tr>
           <tr>
               <td class="right">您的邮箱：</td>
               <td colspan="4"><input name="ema" type="text" class="widt" id="ema" value="<%=(user==null)?"":user.getEmail()%>"/>
               *</td>
           </tr> 
           <tr>
               <td class="right">验&nbsp;&nbsp;证&nbsp;&nbsp;码：</td>
               <td colspan="4"><input name="yanzhenma" type="text" class="widt" id="yanzhenma" value="请输入你在下图中看到的验证码，区分大小写 <%=(user==null)?"":user.getYanZhenMa()%>" onclick="yanzhen()"/>
               *
               </td>
           </tr>
            <tr>
               <td class="right">验证图片：</td>
               <td colspan="4" >
                   <img src="IdentityServlet" id="identity" />
		           <input type=button value="换个验证图片 " onclick="reloadImage()" id="btn"/>
                    <input name="rand" type="hidden" value="<%=(String)session.getAttribute("randomString")%>"/>
               </td>
           </tr>                    
           <tr>
               <td colspan="5">&nbsp;</td>
           </tr>
           <tr>
               <td colspan="5" id="baohu">密码保护设置</td>
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
             <td colspan="4"><input name="protectone" type="text" class="widt" id="protectone" value="<%=(user==null)?"":user.getQuestiona()%>"/></td>
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
             <td colspan="4"><input name="protecttwo" type="text" class="widt" id="protecttwo" value="<%=(user==null)?"":user.getQuestionb()%>"/></td>
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
             <td colspan="4"><input name="protectthree" type="text" class="widt" id="protectthree" value="<%=(user==null)?"":user.getQuestionc()%>"/></td>
           </tr>                      
           <tr>
               <td colspan="5" class="cent">
                    <input type="submit" name="#8" id="#8" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="#12" id="#5" value="重置"/>
               </td>
           </tr>
           <tr>
               <td colspan="5">提示：带"*"的项目为必填项目</td>
           </tr>
        </table>
        </form>        
    </div>    
  </body> 
</html>
