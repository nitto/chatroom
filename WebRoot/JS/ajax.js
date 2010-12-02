window.onload=function(){//alert("sessionid="+document.cookie);
	showContent();	//显示聊天内容
	showOnline();	//显示在线人员列表
	//showContent1();
	//showContent2();
	//showNum();
	setInterval(showContent,1000);
	setInterval(showOnline,10000);
	//setInterval(showContent1,1000);
	//setInterval(showContent2,1000);
	//setInterval(showNum,1000);
	//setInterval(flush, 400);//消息提醒功能
}
function httpasync(){
	var async=false;
	if(window.XMLHttpRequest){
	    async=new XMLHttpRequest();
	}else if(window.ActiveXObject){
	    try{
	        async=new ActiveXObject("Msxml2.XMLHTTP");
	    }catch(e){
	        async=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	}
	return async;
}
function Road(id,uri){
	var async=httpasync();
	if(!async) return;
	try{ 
	     async.open('GET',uri,true);
	     
	     async.send(null);
	     async.onreadystatechange=function(){
	          if(async.readyState == 4){
	        	  if(async.status == 200){
	        		  if(id==1){
	        		       document.getElementById("online").innerHTML = async.responseText;
	        		  }else if(id==2){
	        			   document.getElementById('content').innerHTML= async.responseText;
	        		  }else if(id==3){
	        			   var str=async.responseText; //获取Ajax处理页的返回值
	        			   var numbwith=str.substring(2,12);  //双方号码
	        			   var straa=str.substring(12);
	        			   //var leng=Number(str.substring(17,19)); //发送消息者的userwith的长度
	        			   //var straa=str.substring(leng+19);//需要传输的消息,returnValue.length
	        			   if(document.getElementById(numbwith)!=null){
	        			       document.getElementById(numbwith).innerHTML=straa;
	        			       }
	        		  }else if(id==4){//显示查询后的聊天记录
	        			   document.getElementById('leftwin351').innerHTML= async.responseText;
	        		  }else if(id==88){
	        			   var str=async.responseText;
	        			   if(str==null){return;}
	        			   var myArray=str.split("@");
	        			   var leng=myArray.length;
	        			   for(var i=1;i<leng;i++){
	        				   var numbwith=myArray[i].substring(0,10);  //双方号码
	        				   try{
	        					    document.getElementById(numbwith).innerHTML;
		        		       }catch(e){	        		    	    
		        		    	    var himnumb=myArray[i].substring(10,15); //接收消息者的号码	
			        			    var userwith=myArray[i].substring(15); //发送消息者的userwith
			        			    try{
		        		    	         document.getElementById(himnumb).innerHTML=userwith;
			        			    }catch(ex){			        			    	
			        			    	continue;
			        			    }
		        			   }		        		       
	        			   }
	    	          }else{
	    	               onerror();
	    	          }
	             }
	         }
	     }
	}catch(err){
	     onerror();
	}
}
function showOnline(){
	Road(1,"online.jsp?nocache="+new Date().getTime());
}
function showContent(){//setTimeout(showContent,1000);//这个功能和window.setInterval一样	
	Road(2,"content.jsp?nocache="+new Date().getTime());
}//Messages?action=getMessages&
//function showContent1(){
//	Road(3,"content1.jsp?nocache="+new Date().getTime());
//}
function showrecord(day,who){//查询聊天记录,who是公聊或者私聊的窗口ID
	var datevalue=document.getElementById(day).value;
	datevalue=datevalue.replace(/\s/g,"");
    var re=/^\d{4}-[01]\d-[0123]\d$/;
    if(re.test(datevalue)){
	    var param="day="+datevalue+"&www="+who;
	    var async=httpasync();
	    async.open('POST','Messages?action=getMessages&nocache='+new Date().getTime(),true);
	    async.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	    async.send(param);
	    Road(4,"chatrecord.jsp?nocache="+new Date().getTime());
	}else{
	    alert('日期格式错误，正确格式例如"2010-08-06"');
	}
}
function showNum(){
	Road(88,"contentnumber.jsp?nocache="+new Date().getTime());
}
function send(b,e,f){//b是输入区DIV，e是显示区的父DIV，f是序号
	if(f!=0){//公聊的e值不会用到
		var node=document.getElementById(e);
		var numbwith=node.firstChild.getAttribute("id");
	}
	var val=document.getElementById(b).value;
    if(val==""){
		alert("你未输入信息！");
		return false;
	}
	var param="extre="+numbwith+"&ff="+f+"&from="+document.getElementById("from").value+"&content1="+KE.util.getData(b);
	var async=httpasync();
	async.open('POST','Messages?action=sendMessage',true);
	async.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	async.send(param);
    KE.util.setFullHtml(b, '');
}
function onerror(){
	alert("很抱歉，服务器出现错误，当前窗口将关闭！");
	window.opener=null;
	window.close();
}