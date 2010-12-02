
window.setInterval("showContent();",1000);
window.setInterval("showOnline();",10000);
var sysBBS="<span style='font-size:14px; line-height:30px;'>欢迎光临心之语聊天室，请遵守聊天室规则，不要使用不文明用语。</span><br><span style='line-height:22px;'>";

function showOnline(){
	var loader=new net.AjaxRequest("online.jsp?nocache="+new Date().getTime(),deal_online,onerror,"GET");
}
function showContent(){
	var loader1=new net.AjaxRequest("Messages?action=getMessages&nocache="+new Date().getTime(),deal_content,onerror,"GET");
}
function onerror(){
	alert("很抱歉，服务器出现错误，当前窗口将关闭！");
	window.opener=null;
	window.close();
}
function deal_online(){
	online.innerHTML=this.req.responseText;
}
function deal_content(){
	var returnValue=this.req.responseText;		//获取Ajax处理页的返回值
	var h=returnValue.replace(/\s/g,"");	//去除字符串中的Unicode空白符
	if(h=="error"){
		//alert("您的账户已经过期，请重新登录！");
		Exit();
	}else{
		content.innerHTML=sysBBS+returnValue+"</span>";
		document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;	//当聊天信息超过一屏时，设置最先发送的聊天信息不显示
	}
}

window.onload=function(){
	showContent();						//当页面载入后显示聊天内容
	showOnline();						//当页面载入后显示在线人员列表
}

	function send(){	//验证聊天信息并发送
		if(form1.to.value==""){
			alert("请选择聊天对象！");return false;
		}
		if(form1.content1.value==""){
			alert("发送信息不可以为空！");form1.content1.focus();return false;
		}
		var param="from="+form1.from.value+"&face="+form1.face.value+"&color="+form1.color.value+"&to="+form1.to.value+"&content="+	form1.content1.value;
        var loader=new net.AjaxRequest("Messages?action=sendMessage",deal_send,onerror,"POST",param);

	}
function deal_send(){
content.innerHTML=sysBBS+this.req.responseText+"</span>";
}
	function Exit(){
		window.location.href="leave.jsp";
		alert("欢迎您下次光临！");
	}

function set(selectPerson){	//自动添加聊天对象
	if(selectPerson!="${username}"){
			form1.to.value=selectPerson;
	}else{
		alert("请重新选择聊天对象！");
	}
}