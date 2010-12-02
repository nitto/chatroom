<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="CSS/imgareaselect-deprecated.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="JS/jquery-1.4.2.js"></script>
	<script language="javascript" src="JS/jquery.imgareaselect.pack.js"></script>
	
    <title>My JSP 'test3.jsp' starting page</title>
    
    
<script type="text/javascript">       
    function preview(img, selection)
         {
          var scaleX = 100 / (selection.width || 1);
          var scaleY = 100 / (selection.height || 1);
          $('#myimg + div > img').css
                ({
                 width: Math.round(scaleX * 400) + 'px',
                 height: Math.round(scaleY * 300) + 'px',
                 marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px',
                 marginTop: '-' + Math.round(scaleY * selection.y1) + 'px'
                });
         }

$(document).ready(function () {
  $('<div><img src="images/login.jpg" style="position: relative;" /></div>')
    .css({
      float: 'left',
      position: 'relative',
      overflow: 'hidden',
      width: '100px',
      height: '100px'
    })
    .insertAfter($('#myimg'));
});

$(window).load(function () {
  $('#myimg').imgAreaSelect({ 
                             //aspectRatio: '2:1', 
                             //maxWidth:360,
                             //maxHeight:300,
                             //handles:true,
                             x1:15,//c左上角x轴坐标
			                 y1:15,//c左上角y轴坐标
			                 x2:150,//c右下角x轴坐标 
			                 y2:150,//c右下角y轴坐标
			                 //persistent:true,
                             onSelectChange: preview });
});

           //初始化加载 
    //$(window).load(function () { 
         // $('#biuuu').imgAreaSelect({ //alert("testwww");
                                      //aspectRatio: '3:4', //b选择框宽高比率
                                      //maxWidth:60,//b选择区域透宽最大值 
                                      //maxHeight:100,//b选择区域透高最大值
			                          //handles:true,
			                          //minHeight:120,
			                          //minWidth:90,
			                          //x1:155,//c左上角x轴坐标
			                          //y1:240,//c左上角y轴坐标
			                          //x2:245,//c右下角x轴坐标 
			                          //y2:360,//c右下角y轴坐标 
			                          //persistent:true,//表示不能拖曳放大或缩小，可以移动选择框
			                          //keys:{ arrows: 10, shift: 5},//c开启键盘支持 
			                          //selectionColor://a选择区域颜色,如果使用该参数  就必须设置透明度
			                          //outerOpacity:0.5,//a选择区域透明度
			                          //borderWidth://a选择层边框大小
                                     // onSelectChange: preview //选择区域发生变化的时候回调处理
         // }); 
   // });    
</script>
</head>
  
<body>
     <div>
          <img id="myimg" src="images/login.jpg" />    
     </div>
     
     <br /><br /><br /><br /><br /><br />
     
     <div id="aaa">
           
     </div>
</body>
</html>
