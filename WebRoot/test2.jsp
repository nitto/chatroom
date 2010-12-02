<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script language="javascript" src="JS/testinsertface.js"></script>
	<script language="javascript" src="JS/jquery.imgareaselect.js"></script>
	<script language="javascript" src="JS/jquery.min.js"></script>
	<script language="javascript" src="JS/jquery-1.4.2.js"></script>

    <title>JavaScript 截图效果『截取图片局部』</title>

    <style type="text/css">
        #box{
             overflow:hidden;
             border:1px solid #000;
             width:100px;
             height:100px;
             margin:3px;
             background-color:#0182c4;
             position:absolute;
             top:1px;
             left:1px;
        } 

        #mainBox {
             padding:3px;border:1px solid #000;
             width:276px;height:110px; 
        }
    </style>
    
<script type="text/javascript">
    function eee(id){
        return document.getElementById(id);
    } 
    
    function change(evt){
        evt = evt || window.event;
        xPag = evt.offsetX == undefined ? getOffset(evt).offsetX : evt.offsetX;
        yPag = evt.offsetY == undefined ? getOffset(evt).offsetY : evt.offsetY;
        a = eee("box").offsetWidth / 2;
        b = eee("box").offsetHeight / 2;
        eee("png").style.marginTop = - (yPag - b) + "px";
        eee("png").style.marginLeft = - (xPag - a) + "px";
    }
    
    function getOffset(evt){
        var target = evt.target;

        if (target.offsetLeft == undefined){
             target = target.parentNode;
        }
        var pageCoord = getPageCoord(target);
        var eventCoord ={
             x: window.pageXOffset + evt.clientX,
             y: window.pageYOffset + evt.clientY
        };
        var offset ={
             offsetX: eventCoord.x - pageCoord.x,
             offsetY: eventCoord.y - pageCoord.y
        };
        return offset;
    }
    
    function getPageCoord(element){
        var coord = {x: 0, y: 0};
        while (element){
             coord.x += element.offsetLeft;
             coord.y += element.offsetTop;
             element = element.offsetParent;
        }
        return coord;
    }
    
    //下面是另一个范例的JS
    function preview(img, selection){ 
        var scaleX = 100 / selection.width; 
        var scaleY = 100 / selection.height; 

           //动态小头像 获取当前选中框的宽度，高度，左边框，右边框 
        $('#biuuu + div > img').css({ 
             width: Math.round(scaleX * 400) + 'px', 
             height: Math.round(scaleY * 300) + 'px', 
             marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px', 
             marginTop: '-' + Math.round(scaleY * selection.y1) + 'px' 
             }); 
    } 

            //加载小头像 
    $(document).ready(function () { 
         $('<div><img src="images/login.jpg" style="position: relative;" /></div>') 
             .css({ 
                  float: 'left', 
                  position: 'relative', 
                  overflow: 'hidden', 
                  width: '100px', 
                  height: '100px' 
             })  
             .insertAfter($('#biuuu')); 
    }); 

           //初始化加载 
    $(window).load(function () { alert("test");
          $('#biuuu').imgAreaSelect({ aspectRatio: '1:1', onSelectChange: preview }); 
    });
    
</script>
</head>

<body>
<div id="box">
    <img src="images/login.jpg" id="png"/>
</div>

<br /><br /><br /><br /><br /><br />

<div id="mainBox" onmousemove="change(event);">
    <img src="images/login.jpg" />
</div>
<p>把鼠标滑过较大的图片，将出现效果！</p>

<br /><br /><br /><br /><br /><br />

<div class="container">
     <p> 
          <img id="biuuu" src="images/login.jpg" title="biuuu" style="float: left; margin-right: 10px;" /> 
     </p>
</div>


</body>
</html>
