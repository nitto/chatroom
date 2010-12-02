function check(){
	if(form3.username.value==""){
		alert("请输入您的号码！");form3.username.focus();return false;	
	}
	var num=form3.username.value;
	if(isNaN(num)){
		alert("用户名是您的五位数字号码！");form3.username.focus();return false;
	}
	else if(num<11000 || num>99999){
		alert("请输入您的五位数字号码！");form3.username.focus();return false;
	}
}

function log(){
	alert("欢迎你的到来！请您先登录页面！");
}

function hide(a){
	var c=document.getElementById(a).style.display;
    if(c=="block"){    	
   	     document.getElementById(a).style.display="none";
         if(a=="leftwin31"){
        	 document.getElementById("leftwin32").style.display="none";
         }
    }
    else{document.getElementById(a).style.display="block";}
}

function rightwin3(a,b,c,d){
   	document.getElementById(a).style.display="block";
	document.getElementById(b).style.display="none";
	document.getElementById(c).style.display="none";
	document.getElementById(d).style.display="none";
	if(a=="r31"){
		document.getElementById("rwi61").src="images/1/41.gif";	
		document.getElementById("rwi62").src="images/1/62.gif";
		document.getElementById("rwi63").src="images/1/63.gif";
		document.getElementById("rwi64").src="images/1/64.gif";
	}
	else if(a=="r32"){
		document.getElementById("rwi62").src="images/1/42.gif";
		document.getElementById("rwi61").src="images/1/61.gif";
		document.getElementById("rwi63").src="images/1/63.gif";
		document.getElementById("rwi64").src="images/1/64.gif";
	}
	else if(a=="r33"){
		document.getElementById("rwi63").src="images/1/43.gif";
		document.getElementById("rwi62").src="images/1/62.gif";
		document.getElementById("rwi61").src="images/1/61.gif";
		document.getElementById("rwi64").src="images/1/64.gif";
	}
	else{
		document.getElementById("rwi64").src="images/1/44.gif";
		document.getElementById("rwi62").src="images/1/62.gif";
		document.getElementById("rwi63").src="images/1/63.gif";
		document.getElementById("rwi61").src="images/1/61.gif";
	}
}

function fonttypechange(obj,b){//字体
    document.getElementById(b).style.fontFamily=obj.value;
}

function fontsizechange(objs,b){//字体大小
    document.getElementById(b).style.fontSize=objs.value;
}

function fontweightchange(b){//粗体
    var d=document.getElementById(b).style.fontWeight;
    if(d=="bold"){
    	document.getElementById(b).style.fontWeight="normal";}
    else{document.getElementById(b).style.fontWeight="bold";} 
}

function fontstylechange(b){//斜体
	var e=document.getElementById(b).style.fontStyle;
    if(e=="italic"){
    	document.getElementById(b).style.fontStyle="normal";}
    else{document.getElementById(b).style.fontStyle="italic";}
}

function fonttextdechange(b){//下划线
	var f=document.getElementById(b).style.textDecoration;
    if(f=="underline"){
    	document.getElementById(b).style.textDecoration="none";}
    else{document.getElementById(b).style.textDecoration="underline";}
}

function fontcolorchange(col){//颜色
    document.getElementById("content1").style.color=col;
}

function fontcolorchange2(col){//颜色
    document.getElementById("chat4").style.color=col;
}

function insertinfo(b){//产品资料
	var tot="";
	var productarray=new Array("productne","productbr","productty","productth","productwi","productlo","productco","productqu","productpr","productta");
	var pro=new Array("","","， 规格:","mm×","mm×","m， ",", ","卷 ， ","元/卷(",")※");
	var le=productarray.length;
	for(var i=0;i<le;i++){
		var ttt=document.getElementById(productarray[i]).value;
		if(!ttt){
			continue;
		}
		tot+=document.getElementById(productarray[i]).value+pro[i];//alert(ddd);
	}
	document.getElementById(b).focus();  
	document.selection.createRange().pasteHTML(tot);
}

function insertface(num) {//表情
	face="<img src='images/4/"+num+".gif'/>";
	document.getElementById("content1").focus();  
	document.selection.createRange().pasteHTML(face);	
}

function insertface2(num) {//表情
	face="<img src='images/4/"+num+".gif'/>";
	document.getElementById("chat4").focus();  
	document.selection.createRange().pasteHTML(face);	
}

function runcamera(){
	//WSH=new ActiveXObject("WScript.Shell"); alert("test2");

	var wsh=new ActiveXObject("wscript.shell");alert("test1");//WScript Shell
    try{    	
    	var strPath="rundll32.exe QMOCameraDll.dll,CameraSubArea";
    	wsh.Run(strPath);
    	wsh=null;alert("test3");
    }catch(e){
    	try{    	    	  	    	
    	    strPath="rundll32.exe 'C:\Program Files\Tencent\Foxmail\CameraDll.dll',CameraSubArea";
    	    wsh.Run(strPath);
    	    wsh=null;
    	}catch(e){
    	    try{    	    	  	    	
        	    strPath="rundll32.exe 'C:\Program Files\Tencent\QQ\CameraDll.dll',CameraSubArea";
        	    wsh.Run(strPath);
        	    wsh=null;
        	}catch(e){ 
        	    alert("没有找到执行文件"+strPath+"，原因可能是该文件在其他目录下，请自行搜索！")
        	}
    	}
    }
}

