window.onunload=function(){
	//window.open("leave.jsp");
	var id=sessid.value;
	//alert("2");
	window.location.href="leave.jsp;jsessionid="+id+"";
	//alert("3");
	//alert("欢迎您下次光临！");
}
function exit(){
	var id=sessid.value;
	//alert("leave.jsp;jsessionid="+id+"?c=1&wd=Java");
	window.location.href="leave.jsp;jsessionid="+id+"";	
	alert("欢迎您下次光临！");
}
function addmark(){//实现收藏网页的功能
	window.external.addFavorite('http://xxx','中国胶带在线超大集群');
}
function crectinfo(){//打开修改用户资料的页面
	window.open('crectinfo.jsp');
}
function hide(a){//打开和隐藏一些功能区
	var cc=document.getElementById(a).style.display;
    if(cc=="block"){    	
   	     document.getElementById(a).style.display="none";
    }else{
    	document.getElementById(a).style.display="block";
    }
}
function rightwin3(a,b,c,d){//右部区的广告区的选择
   	document.getElementById(a).style.display="block";
	document.getElementById(b).style.display="none";
	document.getElementById(c).style.display="none";
	document.getElementById(d).style.display="none";
	if(a=="r31"){
		document.getElementById("rwi61").src="images/33.gif";	
		document.getElementById("rwi62").src="images/30.gif";
		document.getElementById("rwi63").src="images/31.gif";
		document.getElementById("rwi64").src="images/32.gif";
	}
	else if(a=="r32"){
		document.getElementById("rwi62").src="images/34.gif";
		document.getElementById("rwi61").src="images/29.gif";
		document.getElementById("rwi63").src="images/31.gif";
		document.getElementById("rwi64").src="images/32.gif";
	}
	else if(a=="r33"){
		document.getElementById("rwi63").src="images/35.gif";
		document.getElementById("rwi62").src="images/30.gif";
		document.getElementById("rwi61").src="images/29.gif";
		document.getElementById("rwi64").src="images/32.gif";
	}
	else{
		document.getElementById("rwi64").src="images/36.gif";
		document.getElementById("rwi62").src="images/30.gif";
		document.getElementById("rwi63").src="images/31.gif";
		document.getElementById("rwi61").src="images/29.gif";
	}
}

function singlechat(users){//建立私聊对话框
	var userwith=users.replace(/&/g,"'");//users输出时一些字符用其他字符代替了，这里还原回来，下行也是如此
	userwith=userwith.replace("#",">");
	var i=userwith.indexOf("(");
	var himnumb=userwith.substring(i+1,i+6);//对方的号码
	var meuserwith=from.value;
	i=meuserwith.indexOf("(");
	var menumb=meuserwith.substring(i+1,i+6);//自己的号码
	var numbwith;
	if(himnumb>menumb){//按小大的顺序组合两者的号码
	    numbwith=menumb+himnumb;
	}else{
		numbwith=himnumb+menumb;
	}	
	var str=document.getElementById(numbwith);//查查numbwith是否已经存在
	if(str!=null){//不为空，表示已存在，代表已打开了聊天室
		alert("您已经打开了该对象的聊天室！");return false;
	}
	if(himnumb==menumb){
		alert("你双击了你自己！");return false;
	}
	for(i=1;i<12;i++){//循环寻找未打开的聊天室
	   if(i==11){
	       alert("您最多只能打开10个聊天窗口");return false;
	       }
	   var sho=document.getElementById("singlechat"+i).style.display;
	   if(sho=="block"){
	       continue;//如果该聊天框已经打开，就执行下个循环，寻找新的未打开的聊天框	      
	   }
	   else{break;}
	}
	document.getElementById("singlechat"+i).style.display="block";
	var mm=new Array("chata21","chatb21","chatc21","chatd21","chate21","chatf21","chatg21","chath21","chati21","chatj21");	
	var cnode=document.getElementById(mm[i-1]);
	try{
	   cnode.setAttribute("id",numbwith);//建立以双方的组合号码为内容的ID，方便各方得到聊天内容
	}
	catch(e){
		alert('替换聊天显示框ID失败！请检查原因');return false;
	}
	var mnid=new Array("chata1","chatb1","chatc1","chatd1","chate1","chatf1","chatg1","chath1","chati1","chatj1"); 
	document.getElementById(mnid[i-1]).innerHTML=userwith+"<span class='mov' onmousedown='move(1,&quot;leftwin35&quot)' onmouseup='move(2,&quot;leftwin35&quot;)'>(点此移动)</span>";//将聊天对象显示在私聊的窗头
	//var param="extre="+numbwith+"&ff="+i+"&from="+from.value;
	//var loader2=new net.AjaxRequest("Messages?action=sendMessage",deal_send,onerror,"POST",param);	
}

function shutdown(num1,num2,num3){//num1是私聊主窗口，num2是聊天显示区的父div，num3是聊天显示区的原ID
	var aaa=document.getElementById(num2);
	
	var numbwith=aaa.firstChild.getAttribute("id");
	var numbfirst=numbwith.slice(0,5);
	var numbsecond=numbwith.slice(5,10);
	var bbb=document.getElementById("flush");
	var menumb=bbb.firstChild.getAttribute("id");
	if(menumb==numbfirst){
	    var numball=numbwith+numbfirst;
	}else{
		var numball=numbwith+numbsecond;
	}
	var param="extreall="+numball;
    var async=httpasync();
    async.open('POST','deletenum.jsp',true);
    async.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    async.send(param);
	
	aaa.firstChild.setAttribute("id",num3);//将id还原为chata21
	document.getElementById(num3).innerHTML="";
  	document.getElementById(num1).style.display="none";   	
}
function flush(){//当有消息时，用闪烁提示用户
	var aaa=document.getElementById("flush");
	var bbb=aaa.firstChild.style.visibility;
	if(bbb=="visible"){
		document.getElementById("flush").firstChild.style.visibility="hidden";
	}else{
		document.getElementById("flush").firstChild.style.visibility="visible";
	}
}
function opensingle(menumb){//根据闪烁点打开新聊天窗口
	var userwith=document.getElementById(menumb).innerHTML;
	var i=userwith.indexOf("(");
	var himnumb=userwith.substring(i+1,i+6);//对方的号码
	var numbwith;
	if(himnumb>menumb){//按小大的顺序组合两者的号码
	    numbwith=menumb+himnumb;
	}else{
		numbwith=himnumb+menumb;
	}
	var i;
	for(i=1;i<12;i++){//循环寻找未打开的聊天室
		   if(i==11){
		       alert("您最多只能打开10个聊天窗口，请关闭一些聊天窗口才能打开新的聊天窗");return false;
		       }
		   var sho=document.getElementById("singlechat"+i).style.display;
		   if(sho=="block"){
		       continue;//如果该聊天框已经打开，就执行下个循环，寻找新的未打开的聊天框	      
		   }
		   else{break;}
		}
	document.getElementById("singlechat"+i).style.display="block";
	var mm=new Array("chata21","chatb21","chatc21","chatd21","chate21","chatf21","chatg21","chath21","chati21","chatj21");	
	var cnode=document.getElementById(mm[i-1]);
	try{
	   cnode.setAttribute("id",numbwith);//建立以双方的组合号码为内容的ID，方便各方得到聊天内容
	}
	catch(e){
		alert('替换聊天显示框ID失败！请检查原因');return false;
	}
	var mnid=new Array("chata1","chatb1","chatc1","chatd1","chate1","chatf1","chatg1","chath1","chati1","chatj1"); 
	document.getElementById(mnid[i-1]).innerHTML=userwith+"<span class='mov' onmousedown='move(1,&quot;leftwin35&quot)' onmouseup='move(2,&quot;leftwin35&quot;)'>(点此移动)</span>";//将聊天对象显示在私聊的窗头
	document.getElementById(menumb).innerHTML="";//打开窗口后，清空提示的号码
	Road(3,"content1.jsp?nocache="+new Date().getTime());
}
