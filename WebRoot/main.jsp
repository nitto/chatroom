<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ include file="safe.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

   <title>胶带超大集群</title>

   <link href="CSS/tape.css" rel="stylesheet" type="text/css" />
   <link href="CSS/jquery-ui-1.8.6.custom.css" rel="stylesheet" type="text/css" />
   
   <script language="javascript" src="JS/main.js"></script>
   <script language="javascript" src="JS/ajax.js"></script>   
   <script language="javascript" src="JS/kindeditor.js"></script>
   <script language="javascript" src="JS/specialchar.js"></script>
   <script language="javascript" src="JS/jquery-1.4.2.js"></script>
   <script language="javascript" src="JS/jquery-ui-1.8.6.custom.js"></script>
   <script language="javascript" src="JS/jquery.ui.datepicker-zh-CN.js"></script>
   <script language="javascript">
        KE.show({
                id : 'content1',
                items : ['|', 'fontname', 'fontsize', '|','emoticons', '|', 
                         'textcolor', 'bgcolor', 'bold', 'italic', 'underline', 
                         'strikethrough', 'removeformat', '|', 'specialchar',
                         'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 
                         'insertorderedlist', 'insertunorderedlist', 'subscript',
                         'superscript', '|', 'selectall', 'image',
                         'flash', 'media', 'table', 'hr', 'link', 'unlink' ],
                //cssPath : ['CSS/index.css'],
                skinsPath : 'kindeditor/skins/',
                pluginsPath : 'kindeditor/plugins/',
                resizeMode : 0,
                imageUploadJson : '../../jsp/upload_json.jsp',
                fileManagerJson : '../../jsp/file_manager_json.jsp',
        });
   </script> 
   <script language="javascript">
        $(function(){//聊天记录查询日期插件
            var pickerOpts={
                showOn:"button",
                buttonImage:'images/calendar.gif',
                buttonImageOnly:true,
                dateFormat:"yy-mm-dd"
            };
            $("#date").datepicker(pickerOpts);
        });
         $(function(){//建立可以移动的区域      
            $("#leftwin35").draggable();
        });
   </script>  
</head>

<body class="oneColLiqCtrHdr">
<div id="container">
  <div id="header">中国胶带在线超大集群
     <div id="headright">
          <input name="" type="image" src="images/27.gif" class="rwi" onclick="crectinfo()"/><input name="" type="image" src="images/28.gif" class="rwi" onclick="addmark()"/>
     </div>
  </div>
  <div id="header2">
     <div id="welcome">欢迎您：<%=session.getAttribute("userwith") %></div>
  </div>  
  <div id="mainContent">
    <div id="leftwin">
      <div id="leftwin1">交谈中请勿轻信汇款、中奖信息，勿轻易拨打中奖电话。
         <div id="flush" onclick="opensingle('<%=session.getAttribute("usernumber") %>')">
             <div id='<%=session.getAttribute("usernumber") %>' ></div>             
         </div>
      </div>
      <div id="content" ></div>          
         <div id="leftwin35" >             
             <div id="leftwin352" >
                     <label>输入查询日期:</label><input id="date" type="text" />                     
                     <input name="" type="submit" value="提交" onclick="showrecord('date','content')"/>
                     <input name="" type="button" value="关闭" onclick="hide('leftwin35')"/>
             </div>
             <div id="leftwin351" ></div>
         </div>
      <!--//form name="form1" method="post" action="", 这里测试了下，不用这行可-->
      <input name="from" id="from" type="hidden" value="<%=session.getAttribute("userwith") %>" />
      <input name="sessid" id="sessid" type="hidden" value="<%=session.getId() %>" />
      <div >
         <textarea id="content1" name="content" cols="100" rows="8"></textarea>
      </div>
      <div id="leftwin5"><input name="" type="image" src="images/20.gif" class="rwi" onclick="send('content1','0148793265','0')"/>      
                         <input name="" type="image" src="images/21.gif" class="rwi" onclick="exit()"/>
                         <input name="" type="image" src="images/26.gif" class="rwi" onclick="hide('leftwin35')"/>                      
      <!-- end #leftwin5 --></div>      
      <!--//form-->
    <!-- end #leftwin --></div>    
    <div id="rigthwin">      
       <div id="rightwin1">群动态</div>
       <div id="rightwin2">
          <a href="javascript:rightwin3('r31','r32','r33','r34');" ><img src="images/29.gif" alt="" name="rwi61" border="0" id="rwi61" class="rwi"/></a><a href="javascript:rightwin3('r32','r31','r33','r34');" ><img src="images/30.gif" alt="" name="rwi62" border="0" id="rwi62" class="rwi"/></a><a href="javascript:rightwin3('r33','r32','r31','r34');" ><img src="images/31.gif" alt="" name="rwi63" border="0" id="rwi63" class="rwi"/></a><a href="javascript:rightwin3('r34','r31','r33','r31');" ><img src="images/32.gif" alt="" name="rwi64" border="0" id="rwi64" class="rwi"/></a>         
       </div>    
       <div id="rigthwin3">
          <div id="r31"></div>
          <div id="r32"></div> 
          <div id="r33"></div> 
          <div id="r34"></div>  
       </div>
       <div id="online"></div><!-- 在线人数和群成员列表 -->
    </div>    
  </div><!-- end(mainContent) -->
  <div id="footer"></div>  
<!-- end #container --></div>
</body>
</html>
