<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>

       <div id="chatb1" class="chat1"  onmousedown="move(1,'singlechat2')" onmouseup="move(2,'singlechat2')"></div>
       <div id="chatb2" class="chat2">
          <div id="chatb21" class="chat21"></div>
          <div id="chatb22" class="chat22">
             <form id="formb22" name="formb22" method="post" action="">
                  <select id="fontb1" onchange="fonttypechange(this,'chatb4')">
                       <option selected="selected" value="宋体, 新宋体">宋体</option>
                       <option value="仿宋">仿宋体</option>
                       <option value="黑体">黑体</option>
                       <option value="楷体">楷体</option>
                       <option value="隶书">隶书</option>
                       <option value="幼圆">幼圆</option>
                       <option value="微软雅黑">微软雅黑</option>
                       <option value="华文彩云">华文彩云</option>
                       <option value="Arial">Arial</option>
                       <option value="Times New Roman">Times New Roman</option>
                       <option value="Courier New">Courier New</option>
                  </select>
                  <select id="fontb2" onchange="fontsizechange(this,'chatb4')">
                       <option value="8">8</option>
                       <option value="9">9</option>
                       <option value="10">10</option>
                       <option value="11">11</option>
                       <option selected="selected" value="12">12</option>
                       <option value="13">13</option>
                       <option value="14">14</option>
                       <option value="15">15</option>
                       <option value="16">16</option>
                       <option value="17">17</option>
                       <option value="18">18</option>
                       <option value="19">19</option>
                       <option value="20">20</option>
                       <option value="21">21</option>
                       <option value="22">22</option>
                  </select>
                  <img src="images/1/52.gif" width="30" height="19" class="rwi" onclick="fontweightchange('chatb4')"/>
                  <img src="images/1/53.gif" width="31" height="19" class="rwi" onclick="fontstylechange('chatb4')"/>
                  <img src="images/1/54.gif" width="30" height="19" class="rwi" onclick="fonttextdechange('chatb4')"/>
                  <img src="images/1/55.gif" width="30" height="19" class="rwi" onclick="hide('chatb23','','','','')"/>       
             </form>                           
         <!-- end #chatb22 --></div>
         <div id="chatb23" class="chat23">
             <table width="300" border="1" cellpadding="0" cellspacing="2">
                   <tr>
                       <td bgcolor="#FF8080" class="rwi" onclick="fontcolorchange('#FF8080','chatb4')">&nbsp;</td>
                       <td bgcolor="#FFFF80" class="rwi" onclick="fontcolorchange('#FFFF80','chatb4')">&nbsp;</td>
                       <td bgcolor="#80FF80" class="rwi" onclick="fontcolorchange('#80FF80','chatb4')">&nbsp;</td>
                       <td bgcolor="#00FF80" class="rwi" onclick="fontcolorchange('#00FF80','chatb4')">&nbsp;</td>
                       <td bgcolor="#80FFFF" class="rwi" onclick="fontcolorchange('#80FFFF','chatb4')">&nbsp;</td>
                       <td bgcolor="#0080FF" class="rwi" onclick="fontcolorchange('#0080FF','chatb4')">&nbsp;</td>
                       <td bgcolor="#FF80C0" class="rwi" onclick="fontcolorchange('#FF80C0','chatb4')">&nbsp;</td>
                       <td bgcolor="#FF80FF" class="rwi" onclick="fontcolorchange('#FF80FF','chatb4')">&nbsp;</td>
                  </tr>
                  <tr>
                       <td bgcolor="#FF0000" class="rwi" onclick="fontcolorchange('#FF0000','chatb4')">&nbsp;</td>
                       <td bgcolor="#FFFF00" class="rwi" onclick="fontcolorchange('#FFFF00','chatb4')">&nbsp;</td>
                       <td bgcolor="#80FF00" class="rwi" onclick="fontcolorchange('#80FF00','chatb4')">&nbsp;</td>
                       <td bgcolor="#00FF40" class="rwi" onclick="fontcolorchange('#00FF40','chatb4')">&nbsp;</td>
                       <td bgcolor="#00FFFF" class="rwi" onclick="fontcolorchange('#00FFFF','chatb4')">&nbsp;</td>
                       <td bgcolor="#0080C0" class="rwi" onclick="fontcolorchange('#0080C0','chatb4')">&nbsp;</td>
                       <td bgcolor="#8080C0" class="rwi" onclick="fontcolorchange('#8080C0','chatb4')">&nbsp;</td>
                       <td bgcolor="#FF00FF" class="rwi" onclick="fontcolorchange('#FF00FF','chatb4')">&nbsp;</td>
                  </tr>
                  <tr>
                       <td bgcolor="#804040" class="rwi" onclick="fontcolorchange('#804040','chatb4')">&nbsp;</td>
                       <td bgcolor="#FF8040" class="rwi" onclick="fontcolorchange('#FF8040','chatb4')">&nbsp;</td>
                       <td bgcolor="#00FF00" class="rwi" onclick="fontcolorchange('#00FF00','chatb4')">&nbsp;</td>
                       <td bgcolor="#008080" class="rwi" onclick="fontcolorchange('#008080','chatb4')">&nbsp;</td>
                       <td bgcolor="#004080" class="rwi" onclick="fontcolorchange('#004080','chatb4')">&nbsp;</td>
                       <td bgcolor="#8080FF" class="rwi" onclick="fontcolorchange('#8080FF','chatb4')">&nbsp;</td>
                       <td bgcolor="#800040" class="rwi" onclick="fontcolorchange('#800040','chatb4')">&nbsp;</td>
                       <td bgcolor="#FF0080" class="rwi" onclick="fontcolorchange('#FF0080','chatb4')">&nbsp;</td>
                  </tr>
                  <tr>
                       <td bgcolor="#800000" class="rwi" onclick="fontcolorchange('#800000','chatb4')">&nbsp;</td>
                       <td bgcolor="#FF8000" class="rwi" onclick="fontcolorchange('#FF8000','chatb4')">&nbsp;</td>
                       <td bgcolor="#008000" class="rwi" onclick="fontcolorchange('#008000','chatb4')">&nbsp;</td>
                       <td bgcolor="#008040" class="rwi" onclick="fontcolorchange('#008040','chatb4')">&nbsp;</td>
                       <td bgcolor="#0000FF" class="rwi" onclick="fontcolorchange('#0000FF','chatb4')">&nbsp;</td>
                       <td bgcolor="#0000A0" class="rwi" onclick="fontcolorchange('#0000A0','chatb4')">&nbsp;</td>
                       <td bgcolor="#800080" class="rwi" onclick="fontcolorchange('#800080','chatb4')">&nbsp;</td>
                       <td bgcolor="#8000FF" class="rwi" onclick="fontcolorchange('#8000FF','chatb4')">&nbsp;</td>
                  </tr>
                  <tr>
                       <td bgcolor="#400000" class="rwi" onclick="fontcolorchange('#400000','chatb4')">&nbsp;</td>
                       <td bgcolor="#804000" class="rwi" onclick="fontcolorchange('#804000','chatb4')">&nbsp;</td>
                       <td bgcolor="#004000" class="rwi" onclick="fontcolorchange('#004000','chatb4')">&nbsp;</td>
                       <td bgcolor="#004040" class="rwi" onclick="fontcolorchange('#004040','chatb4')">&nbsp;</td>
                       <td bgcolor="#000080" class="rwi" onclick="fontcolorchange('#000080','chatb4')">&nbsp;</td>
                       <td bgcolor="#000040" class="rwi" onclick="fontcolorchange('#000040','chatb4')">&nbsp;</td>
                       <td bgcolor="#400040" class="rwi" onclick="fontcolorchange('#400040','chatb4')">&nbsp;</td>
                       <td bgcolor="#400080" class="rwi" onclick="fontcolorchange('#400080','chatb4')">&nbsp;</td>
                  </tr>
                  <tr>
                       <td bgcolor="#000000" class="rwi" onclick="fontcolorchange('#000000','chatb4')">&nbsp;</td>
                       <td bgcolor="#808000" class="rwi" onclick="fontcolorchange('#808000','chatb4')">&nbsp;</td>
                       <td bgcolor="#808040" class="rwi" onclick="fontcolorchange('#808040','chatb4')">&nbsp;</td>
                       <td bgcolor="#808080" class="rwi" onclick="fontcolorchange('#808080','chatb4')">&nbsp;</td>
                       <td bgcolor="#408080" class="rwi" onclick="fontcolorchange('#408080','chatb4')">&nbsp;</td>
                       <td bgcolor="#C0C0C0" class="rwi" onclick="fontcolorchange('#C0C0C0','chatb4')">&nbsp;</td>
                       <td bgcolor="#400000" class="rwi" onclick="fontcolorchange('#400000','chatb4')">&nbsp;</td>
                       <td bgcolor="#FFFFFF" class="rwi" onclick="fontcolorchange('#FFFFFF','chatb4')">&nbsp;</td>
                  </tr>
             </table>
         <!-- end #chatb23 --></div>
         <div id="chatb24" class="chat24">
          <table border="1" cellpadding="3" cellspacing="0">
                  <tr>
                       <td><img src="images/4/01.gif" width="24" height="24" class="rwi" onclick="insertface('01','chatb4')" /></td>
                       <td><img src="images/4/02.gif" width="24" height="24" class="rwi" onclick="insertface('02','chatb4')" /></td>
                       <td><img src="images/4/03.gif" width="24" height="24" class="rwi" onclick="insertface('03','chatb4')" /></td>
                       <td><img src="images/4/04.gif" width="24" height="24" class="rwi" onclick="insertface('04','chatb4')" /></td>
                       <td><img src="images/4/05.gif" width="24" height="24" class="rwi" onclick="insertface('05','chatb4')" /></td>
                       <td><img src="images/4/06.gif" width="24" height="24" class="rwi" onclick="insertface('06','chatb4')" /></td>
                       <td><img src="images/4/07.gif" width="24" height="24" class="rwi" onclick="insertface('07','chatb4')" /></td>
                       <td><img src="images/4/08.gif" width="24" height="24" class="rwi" onclick="insertface('08','chatb4')" /></td>
                       <td><img src="images/4/09.gif" width="24" height="24" class="rwi" onclick="insertface('09','chatb4')" /></td>
                       <td><img src="images/4/10.gif" width="24" height="24" class="rwi" onclick="insertface('10','chatb4')" /></td>
                       <td><img src="images/4/11.gif" width="24" height="24" class="rwi" onclick="insertface('11','chatb4')" /></td>
                       <td><img src="images/4/12.gif" width="24" height="24" class="rwi" onclick="insertface('12','chatb4')" /></td>
                       <td><img src="images/4/13.gif" width="24" height="24" class="rwi" onclick="insertface('13','chatb4')" /></td>
                       <td><img src="images/4/14.gif" width="24" height="24" class="rwi" onclick="insertface('14','chatb4')" /></td>
                       <td><img src="images/4/15.gif" width="24" height="24" class="rwi" onclick="insertface('15','chatb4')" /></td>
                       <td><img src="images/4/16.gif" width="24" height="24" class="rwi" onclick="insertface('16','chatb4')" /></td>
                  </tr>
                  <tr>
                       <td><img src="images/4/17.gif" width="24" height="24" class="rwi" onclick="insertface('17','chatb4')" /></td>
                       <td><img src="images/4/18.gif" width="24" height="24" class="rwi" onclick="insertface('18','chatb4')" /></td>
                       <td><img src="images/4/19.gif" width="24" height="24" class="rwi" onclick="insertface('19','chatb4')" /></td>
                       <td><img src="images/4/20.gif" width="24" height="24" class="rwi" onclick="insertface('20','chatb4')" /></td>
                       <td><img src="images/4/21.gif" width="24" height="24" class="rwi" onclick="insertface('21','chatb4')" /></td>
                       <td><img src="images/4/22.gif" width="24" height="24" class="rwi" onclick="insertface('22','chatb4')" /></td>
                       <td><img src="images/4/23.gif" width="24" height="24" class="rwi" onclick="insertface('23','chatb4')" /></td>
                       <td><img src="images/4/24.gif" width="24" height="24" class="rwi" onclick="insertface('24','chatb4')" /></td>
                       <td><img src="images/4/25.gif" width="24" height="24" class="rwi" onclick="insertface('25','chatb4')" /></td>
                       <td><img src="images/4/26.gif" width="24" height="24" class="rwi" onclick="insertface('26','chatb4')" /></td>
                       <td><img src="images/4/27.gif" width="24" height="24" class="rwi" onclick="insertface('27','chatb4')" /></td>
                       <td><img src="images/4/28.gif" width="24" height="24" class="rwi" onclick="insertface('28','chatb4')" /></td>
                       <td><img src="images/4/29.gif" width="24" height="24" class="rwi" onclick="insertface('29','chatb4')" /></td>
                       <td><img src="images/4/30.gif" width="24" height="24" class="rwi" onclick="insertface('30','chatb4')" /></td>
                       <td><img src="images/4/31.gif" width="24" height="24" class="rwi" onclick="insertface('31','chatb4')" /></td>
                       <td><img src="images/4/32.gif" width="24" height="24" class="rwi" onclick="insertface('32','chatb4')" /></td>
                  </tr>
                  <tr>
                       <td><img src="images/4/33.gif" width="24" height="24" class="rwi" onclick="insertface('33','chatb4')" /></td>
                       <td><img src="images/4/34.gif" width="24" height="24" class="rwi" onclick="insertface('34','chatb4')" /></td>
                       <td><img src="images/4/35.gif" width="24" height="24" class="rwi" onclick="insertface('35','chatb4')" /></td>
                       <td><img src="images/4/36.gif" width="24" height="24" class="rwi" onclick="insertface('36','chatb4')" /></td>
                       <td><img src="images/4/37.gif" width="24" height="24" class="rwi" onclick="insertface('37','chatb4')" /></td>
                       <td><img src="images/4/38.gif" width="24" height="24" class="rwi" onclick="insertface('38','chatb4')" /></td>
                       <td><img src="images/4/39.gif" width="24" height="24" class="rwi" onclick="insertface('39','chatb4')" /></td>
                       <td><img src="images/4/40.gif" width="24" height="24" class="rwi" onclick="insertface('40','chatb4')" /></td>
                       <td><img src="images/4/41.gif" width="24" height="24" class="rwi" onclick="insertface('41','chatb4')" /></td>
                       <td><img src="images/4/42.gif" width="24" height="24" class="rwi" onclick="insertface('42','chatb4')" /></td>
                       <td><img src="images/4/43.gif" width="24" height="24" class="rwi" onclick="insertface('43','chatb4')" /></td>
                       <td><img src="images/4/44.gif" width="24" height="24" class="rwi" onclick="insertface('44','chatb4')" /></td>
                       <td><img src="images/4/45.gif" width="24" height="24" class="rwi" onclick="insertface('45','chatb4')" /></td>
                       <td><img src="images/4/46.gif" width="24" height="24" class="rwi" onclick="insertface('46','chatb4')" /></td>                                        
                       <td><img src="images/4/47.gif" width="24" height="24" class="rwi" onclick="insertface('47','chatb4')" /></td>
                       <td><img src="images/4/48.gif" width="24" height="24" class="rwi" onclick="insertface('48','chatb4')" /></td>
                  </tr>
                  <tr> 
                       <td><img src="images/4/49.gif" width="24" height="24" class="rwi" onclick="insertface('49','chatb4')" /></td>
                       <td><img src="images/4/50.gif" width="24" height="24" class="rwi" onclick="insertface('50','chatb4')" /></td>
                       <td><img src="images/4/51.gif" width="24" height="24" class="rwi" onclick="insertface('51','chatb4')" /></td>
                       <td><img src="images/4/52.gif" width="24" height="24" class="rwi" onclick="insertface('52','chatb4')" /></td>
                       <td><img src="images/4/53.gif" width="24" height="24" class="rwi" onclick="insertface('53','chatb4')" /></td>
                       <td><img src="images/4/54.gif" width="24" height="24" class="rwi" onclick="insertface('54','chatb4')" /></td>
                       <td><img src="images/4/55.gif" width="24" height="24" class="rwi" onclick="insertface('55','chatb4')" /></td>
                       <td><img src="images/4/56.gif" width="24" height="24" class="rwi" onclick="insertface('56','chatb4')" /></td>
                       <td><img src="images/4/57.gif" width="24" height="24" class="rwi" onclick="insertface('57','chatb4')" /></td>
                       <td><img src="images/4/58.gif" width="24" height="24" class="rwi" onclick="insertface('58','chatb4')" /></td>
                       <td><img src="images/4/61.gif" width="24" height="24" class="rwi" onclick="insertface('61','chatb4')" /></td>
                       <td><img src="images/4/62.gif" width="24" height="24" class="rwi" onclick="insertface('62','chatb4')" /></td>
                       <td><img src="images/4/63.gif" width="24" height="24" class="rwi" onclick="insertface('63','chatb4')" /></td>
                       <td><img src="images/4/64.gif" width="24" height="24" class="rwi" onclick="insertface('64','chatb4')" /></td>                  
                       <td><img src="images/4/65.gif" width="24" height="24" class="rwi" onclick="insertface('65','chatb4')" /></td>
                       <td><img src="images/4/66.gif" width="24" height="24" class="rwi" onclick="insertface('66','chatb4')" /></td>
                  </tr>
                  <tr>    
                       <td><img src="images/4/67.gif" width="24" height="24" class="rwi" onclick="insertface('67','chatb4')" /></td>
                       <td><img src="images/4/68.gif" width="24" height="24" class="rwi" onclick="insertface('68','chatb4')" /></td>
                       <td><img src="images/4/69.gif" width="24" height="24" class="rwi" onclick="insertface('69','chatb4')" /></td>
                       <td><img src="images/4/71.gif" width="24" height="24" class="rwi" onclick="insertface('71','chatb4')" /></td>
                       <td><img src="images/4/72.gif" width="24" height="24" class="rwi" onclick="insertface('72','chatb4')" /></td>
                       <td><img src="images/4/73.gif" width="24" height="24" class="rwi" onclick="insertface('73','chatb4')" /></td>
                       <td><img src="images/4/74.gif" width="24" height="24" class="rwi" onclick="insertface('74','chatb4')" /></td>
                       <td><img src="images/4/75.gif" width="24" height="24" class="rwi" onclick="insertface('75','chatb4')" /></td>
                       <td><img src="images/4/76.gif" width="24" height="24" class="rwi" onclick="insertface('76','chatb4')" /></td>
                       <td><img src="images/4/77.gif" width="24" height="24" class="rwi" onclick="insertface('77','chatb4')" /></td>
                       <td><img src="images/4/78.gif" width="24" height="24" class="rwi" onclick="insertface('78','chatb4')" /></td>
                       <td><img src="images/4/79.gif" width="24" height="24" class="rwi" onclick="insertface('79','chatb4')" /></td>
                       <td><img src="images/4/80.gif" width="24" height="24" class="rwi" onclick="insertface('80','chatb4')" /></td>                 
                       <td><img src="images/4/81.gif" width="24" height="24" class="rwi" onclick="insertface('81','chatb4')" /></td>
                       <td><img src="images/4/82.gif" width="24" height="24" class="rwi" onclick="insertface('82','chatb4')" /></td>
                       <td><img src="images/4/83.gif" width="24" height="24" class="rwi" onclick="insertface('83','chatb4')" /></td>
                  </tr>
                  <tr> 
                       <td><img src="images/4/84.gif" width="24" height="24" class="rwi" onclick="insertface('84','chatb4')" /></td>
                       <td><img src="images/4/85.gif" width="24" height="24" class="rwi" onclick="insertface('85','chatb4')" /></td>
                       <td><img src="images/4/86.gif" width="24" height="24" class="rwi" onclick="insertface('86','chatb4')" /></td>
                       <td><img src="images/4/87.gif" width="24" height="24" class="rwi" onclick="insertface('87','chatb4')" /></td>
                       <td><img src="images/4/88.gif" width="24" height="24" class="rwi" onclick="insertface('88','chatb4')" /></td>
                       <td><img src="images/4/89.gif" width="24" height="24" class="rwi" onclick="insertface('89','chatb4')" /></td>
                       <td><img src="images/4/90.gif" width="24" height="24" class="rwi" onclick="insertface('90','chatb4')" /></td>
                       <td><img src="images/4/91.gif" width="24" height="24" class="rwi" onclick="insertface('91','chatb4')" /></td>
                       <td><img src="images/4/92.gif" width="24" height="24" class="rwi" onclick="insertface('92','chatb4')" /></td>
                       <td><img src="images/4/93.gif" width="24" height="24" class="rwi" onclick="insertface('93','chatb4')" /></td>
                       <td><img src="images/4/94.gif" width="24" height="24" class="rwi" onclick="insertface('94','chatb4')" /></td>
                       <td><img src="images/4/95.gif" width="24" height="24" class="rwi" onclick="insertface('95','chatb4')" /></td>
                       <td><img src="images/4/96.gif" width="24" height="24" class="rwi" onclick="insertface('96','chatb4')" /></td>
                       <td><img src="images/4/97.gif" width="24" height="24" class="rwi" onclick="insertface('97','chatb4')" /></td>
                       <td><img src="images/4/98.gif" width="24" height="24" class="rwi" onclick="insertface('98','chatb4')" /></td>
                       <td><img src="images/4/99.gif" width="24" height="24" class="rwi" onclick="insertface('99','chatb4')" /></td>
                  </tr>
             </table>
         <!-- end #chatb24 --></div>
         <div id="chatb25" class="chat25">
           <select name="chatb341" id="chatb341" >
                 <option value="※促销＞ " selected="selected">促销</option>
                 <option value="※急需＞ ">急需</option>
             </select>&nbsp;&nbsp;
             <select name="chatb342" id="chatb342"  size="1">
                 <option value="日东(NITTO):" selected="selected">日东(NITTO)</option>
                 <option value="3M:">3M</option>
                 <option value="德莎(TESA):">德莎(TESA)</option>
                 <option value="索尼(SONY):">索尼(SONY)</option>
                 <option value="四维:">四维</option>
                 <option value="亚化:">亚化</option>
                 <option value="其他品牌:">其他品牌</option>
             </select>&nbsp;
                                  型号<input name="chatb343" id="chatb343" type="text" size="6" /><br/>
                                  厚度<input name="chatb344" id="chatb344" type="text" size="6" />&nbsp;mm&nbsp;
                                  宽度<input name="chatb345" id="chatb345" type="text" size="6" />&nbsp;mm&nbsp;
                                  长度<input name="chatb346" id="chatb346" type="text" size="6" />&nbsp;m&nbsp;
             <select name="chatb347" id="chatb347" >
                 <option value="黑色" selected="selected">黑色</option>
                 <option value="白色">白色</option>
                 <option value="红色">红色</option>
                 <option value="橙色">橙色</option>
                 <option value="黄色">黄色</option>
                 <option value="淡黄色">淡黄色</option>
                 <option value="绿色">绿色</option>
                 <option value="蓝色">蓝色</option>
                 <option value="青色">青色</option>
                 <option value="紫色">紫色</option>
                 <option value="灰色">灰色</option>
                 <option value="褐色">褐色</option>
                 <option value="棕色">棕色</option>
                 <option value="其它颜色">其它颜色</option>
             </select><br/>
                                  数量<input name="chatb348" id="chatb348" type="text" size="6" />&nbsp;卷&nbsp;
                                  价格:￥<input name="chatb349" id="chatb349" type="text" size="6" />&nbsp;元/卷&nbsp;
             <select name="chatb3410" id="chatb3410" size="1">
                 <option value="不含税" selected="selected">不含税</option>
                 <option value="含17%增值税">含17%增值税</option>
                 <option value="含4%增值税">含4%增值税</option>
                 <option value="含3%增值税">含3%增值税</option>
                 <option value="普通销售发票">普通销售发票</option>
             </select>&nbsp;
             <input name="" id="" type="submit" value="插入" onclick="insertinfo('chatb4','chatb341','chatb342','chatb343','chatb344','chatb345','chatb346','chatb347','chatb348','chatb349','chatb3410')"/>
         <!-- end #chatb25 --></div>
         <div id="chatb26" class="chat26">
             <div id="chatb261" ></div>
             <div id="chatb262" >
                     <input name="" type="button" value="查找" onclick="showrecord('otherday',null,'chatb2')"/>
                     <select name="year1" id="year1">
                       <option value="2010" selected="selected">2010</option> 
                       <option value="2011">2011</option>
                       <option value="2012">2012</option>
                     </select>年
                    <select name="month1" id="month1">
                       <option value="1" selected="selected">1</option>
                       <option value="2">2</option>
                       <option value="3">3</option>
                       <option value="4">4</option>
                       <option value="5">5</option>
                       <option value="6">6</option>
                       <option value="7">7</option>
                       <option value="8">8</option>
                       <option value="9">9</option>
                       <option value="10">10</option>
                       <option value="11">11</option>
                       <option value="12">12</option>
                    </select>月
                    <select name="day1" id="day1">
                       <option value="1" selected="selected">1</option>
                       <option value="2">2</option>
                       <option value="3">3</option>
                       <option value="4">4</option>
                       <option value="5">5</option>
                       <option value="6">6</option>
                       <option value="7">7</option>
                       <option value="8">8</option>
                       <option value="9">9</option>
                       <option value="10">10</option>
                       <option value="11">11</option>
                       <option value="12">12</option>
                       <option value="13">13</option>
                       <option value="14">14</option>
                       <option value="15">15</option>
                       <option value="16">16</option>
                       <option value="17">17</option>
                       <option value="18">18</option>
                       <option value="19">19</option>
                       <option value="20">20</option>
                       <option value="21">21</option>
                       <option value="22">22</option>
                       <option value="23">23</option>
                       <option value="24">24</option>
                       <option value="25">25</option>
                       <option value="26">26</option>
                       <option value="27">27</option>
                       <option value="28">28</option>
                       <option value="29">29</option>
                       <option value="30">30</option>
                       <option value="31">31</option>
                    </select>日
             <!-- end chatb262 --></div>
         <!-- end #chatb26 --></div>
       </div>
       <div id="chatb3" class="chat3">
         <input name="" type="image" src="images/1/4.gif" class="rwi" onclick="hide('chatb22','chatb23','chatb24','chatb25','chatb26')"/>
         <input name="" type="image" src="images/1/5.gif" class="rwi" onclick="hide('chatb24','chatb22','chatb23','chatb25','chatb26')"/>
         <input name="" type="image" src="images/1/6.gif" class="rwi" onclick="hide('chatb25','chatb22','chatb23','chatb24','chatb26')"/>
         <input name="" type="image" src="images/1/14.gif" class="rwi" onclick="showrecord('today','chatb26','chatb2')"/>
         <input name="" type="image" src="images/1/15.gif" class="rwi" />         
       </div>
       <div id="chatb4" class="chat4" contenteditable="true"></div>
       <div id="chatb5" class="chat5">
           <input name="exit" type="image" src="images/1/2.gif" class="rwi" onclick="shutdown('singlechat2','chatb2','chatb21')"/>
           <input name="fasong" type="image" src="images/1/1.gif" class="rwi" onclick="send('chatb4','fontb1','fontb2','chatb2','2')"/>
       </div>