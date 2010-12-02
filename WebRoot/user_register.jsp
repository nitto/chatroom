<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="CSS/user_style.css" type="text/css">
<script language="javascript" src="JS/public_js.js"></script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0">
      <table width="780" height="100%" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top" >
            <form name="form1" method="post" action="Register?action=save">
              <table width="96%" border="0" cellspacing="0" cellpadding="0" align="center" height="100%" bgcolor="#F3F3F3">
                <tr>
                  <td height="330" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr> 
                        <td colspan="4" height="17"><font color="#FF0000">请输入以下信息:</font></td>
                      </tr>
                      <tr> 
                        <td colspan="4"> 
                          <hr size="1" noshade>
                        </td>
                      </tr>
                      <tr> 
                        <td> 
                          <div align="right"><font color="#0000FF">用户名：</font></div>
                        </td>
                        <td> &nbsp; 
                          <input type="text" name="username" class="input1">
                        </td>
                      </tr>
                      <tr> 
                        <td> 
                          <div align="right"><font color="#0000FF">密码：</font></div>
                        </td>
                        <td> &nbsp; 
                          <input type="password" name="password" class="input1">
                        </td>
                      </tr>
                      <tr> 
                        <td> 
                          <div align="right"><font color="#0000FF">确认密码：</font></div>
                        </td>
                        <td> &nbsp; 
                          <input type="password" name="repassword" class="input1">
                        </td>
                      </tr>
                      <tr> 
                       <td> 
                          <div align="right"><font color="#0000FF">性别：</font></div>
                        </td>
                        <td> &nbsp; 
                          <input type="radio" name="sex" value="1">
                          男 
                          <input type="radio" name="sex" value="0">
                          女 
                         </td>
                      </tr>
                      <tr> 
                        <td> 
                          <div align="right"><font color="#0000FF">别名：</font></div>
                        </td>
                        <td> &nbsp; 
                          <input type="text" name="nick" class="input1">
                        </td>
                      </tr>
                      <tr> 
                        <td> 
                          <div align="right"><font color="#0000FF">E-Mail：</font></div>
                        </td>
                        <td> &nbsp; 
                        	<input type="text" name="email" class="input1">  
						</td>
                      </tr>
                      <tr> 
                        <td height="24" width="157"> 
                          <div align="right"></div>
                        </td>
                        <td height="24" width="285">&nbsp;</td>
                        <td height="24" width="307"> 
                          <div align="right"></div>
                        </td>                       
                      </tr>
                      <tr> 
                        <td height="24" colspan="4"> 
                          <div align="center"> 
                            <input type="submit" name="Submit" value=" 提 交 " class="button2">
                          </div>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </form>
          </td>
        </tr>
      </table>
<br>
<br>
</body>
</html>
