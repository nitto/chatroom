function checke(){
	//var rand=document.getElementById("rand").value;
	//alert("rand="+rand);
	var arr=new Array("oname","passw","passwo","ema");
	var arra=new Array("呢称","密码","确认密码","邮箱");
	var aa=new Array(4);
	for(var i=0;i<3;i++){
	    aa[i]=document.getElementById(arr[i]).value;
	    if(aa[0]==""|| aa[0]==null){
		    alert(arra[0]+"的内容不能为空！");
		    return false;
	    }
	}
	
	if(aa[1]!=aa[2]){
		alert("您两次输入的密码不相同！请重新输入");
		document.getElementById(arr[1]).value="";
		document.getElementById(arr[2]).value="";
		return false;
	}
	if(aa[1].length<6 && aa[1].length>20){
		alert("您输入的密码不能少于6位，也不能大于20位！请重新输入");
		return false;
	}
	var emai=document.getElementById("ema").value;
	if(emai!=""){
		var re=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var mac=emai.match(re);
		if(mac==null){
			alert("您输入的邮箱地址不符合规范！请重新输入");
			document.getElementById(ema).value="";
			return false;
		}
	}	
}

function yanzhen(){
	document.getElementById('yanzhenma').value="";
}

function reloadImage() {
	document.getElementById('btn').disabled = true;
	document.getElementById('identity').src='IdentityServlet?=' + new Date().getTime();
	document.getElementById('btn').disabled = false;
}
function photoselect(num) {//头像
	face="<img src='images/2/"+num+".bmp'/>";
	document.getElementById("photoin").innerHTML=face;
	document.getElementById("photoinside").value=num;
	//alert(document.getElementById("photoin").innerHTML);
	//face="<img src='images/4/"+num+".gif'/>";
	//document.getElementById("photoinside").focus();  
	//document.selection.createRange().pasteHTML(face);
}
function photohide(){
	var c=document.getElementById("photoselect").style.display;
    if(c=="block"){
   	     document.getElementById("photoselect").style.display="none";}
    else{document.getElementById("photoselect").style.display="block";}
}