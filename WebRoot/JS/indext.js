function check(){//登录页面输入数据的检查
	if(form3.usernumber.value==""){
		alert("请输入您的号码！");form3.usernumber.focus();return false;	
	}
	var num=form3.usernumber.value;
	if(isNaN(num)){
		alert("用户名是您的五位数字号码！");form3.usernumber.focus();return false;
	}
	else if(num<11000 || num>99999){
		alert("请输入您的五位数字号码！");form3.usernumber.focus();return false;
	}
}

function log(){//登录页面的提示
	alert("欢迎你的到来！请您先登录页面！");
}