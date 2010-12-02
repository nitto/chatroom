function insertString(face){
    var tb = document.getElementById("txtContent");   
    tb.focus();
    var str="<IMG src='"+face+"' width=24 height=24>";
    var re=/(<|&(amp;)*(lt;))IMG\s(src=)("|')(images)\/4\/\d{2}(.gif)("|')\s(width=)\d{1,3}\s(height=)\d{1,3}(\/|)(>|&(amp;)*(gt;))/g;
    if (document.all){
        var r = document.selection.createRange();
        document.selection.empty();
        r.text = str;
        r.collapse();
        r.select();              
        var val=tb.innerHTML;//多亏tb.innerHTML能把插入的节点数据显示出来，实在是很重要，写程序真不容易
        var reb=/\s$/;//表示字符串尾部的空格
        var rec=/(<|&(amp;)*(lt;))IMG/g;//代表表情字符串的前部
    	val=val.replace(rec," <IMG");//在每段代表表情的字符串前加空格，以便分割需要，避免相邻表情无法分割的现象
    	var narray=val.split(re);
	    var len=narray.length;
	    for(var i=0;i<len;i++){
	        narray[i]=narray[i].replace(reb,"");
	    }
	    tb.value="";
	    var reee=/(src=)("|')(images)\/4\/\d{2}(.gif)("|')/g;
	    var ray=val.match(reee);
	    var leng=ray.length;
	       //下面代码都属于添加表情，方法是将文本框的值分割形成多个表情和文本节点，然后将节点不断的添加
	    for(var i=0;i<(leng+1);i++){
	    	if(!narray[i]){
	    		narray[i]="";
	    	}
	    	var lasttex=document.createTextNode(narray[i]);
		    tb.appendChild(lasttex);
		    if(i==leng){break;}
		    ray[i]=ray[i].substring(14,16);
	    	var imgic=document.createElement("img");
		    imgic.src="images/4/"+ray[i]+".gif";
	    	tb.appendChild(imgic);
		}
	    	    
    }   
    else{ //这里的代码是为了解决非IE浏览器的插入，还未测试
    	var face=face.substring(9,11);
    	str="@表情"+face+"@";
        var newstart = tb.selectionStart+str.length;   
        tb.value=tb.value.substr(0,tb.selectionStart)+str+tb.value.substring(tb.selectionEnd);   
        tb.selectionStart = newstart;   
        tb.selectionEnd = newstart;   
    }   
}


function insertface(num,b){//表情插入
    var tb = document.getElementById(b);   
    tb.focus();
    var str="<IMG src='images/4/"+num+".gif' width=24 height=24>";
    //var re=/(<|&(amp;)*(lt;))IMG\s(src=)("|')(images)\/4\/\d{2}(.gif)("|')\s(width=)\d{1,3}\s(height=)\d{1,3}(\/|)(>|&(amp;)*(gt;))/g;
    var re=/<IMG\ssrc=("|')\S+\.(gif|jpg|jpeg|png)("|')\s?\S*\s?\S*\s?\S*(>|&gt;)/ig;
    //var re=/(<|&(amp;)*(lt;))img\s.*?\s?src\s*=\s*['|"]?([^\s'"]+).*?(>|&(amp;)*(gt;))/ig 
    if (document.all){
        var r = document.selection.createRange();
        document.selection.empty();
        r.text = str;//将新表情插入文本之中,不过暂时它是以文本方式表现的，要通过下面的步骤才能以图像方式表现
        var vbl=tb.innerHTML;//多亏tb.innerHTML能把插入的节点数据显示出来，实在是很重要，写程序真不容易
        var rec=/(<|&lt;)IMG\ssrc=/ig;//代表表情字符串的前部
    	var val=vbl.replace(rec,"!1q@2w#3e$4r<IMG src=");//在每段代表表情的字符串前加字母，以便分割需要，避免相邻表情无法分割的现象
    	var narray=val.split(re);//用图像分割字符串
	    var len=narray.length;
	    for(var i=0;i<len;i++){	    	
	        narray[i]=narray[i].replace("!1q@2w#3e$4r","");
	    }
	    tb.value="";
	    var ray=val.match(re);//查找代表图像的字符串
	    var leng=ray.length;
	    //下面代码都属于添加表情，方法是将文本框的值分割形成多个表情和文本节点，然后将节点不断的添加
	    for(var i=0;i<(leng+1);i++){
	    	if(!narray[i]){
	    		narray[i]="";
	    	}
	    	var lasttex=document.createTextNode(narray[i]);
		    tb.appendChild(lasttex);
		    if(i==leng){break;}
		    var ree=/\S+\.(gif|jpg|jpeg|png)/ig;
		    var photo=ray[i].substring(10);
		    photo=photo.match(ree);
	    	var imgic=document.createElement("img");
	    	imgic.src=photo;
	    	tb.appendChild(imgic);
		}
	    //以下是解决光标的定位问题
	    str=str.replace("<", "&lt;").replace(">", "&gt;");
	    var array1=vbl.split(str);
	    var array2=array1[0].split(re); 
	    var array3=array1[0].match(re);
	    var ar3=0;
	    if(array3!=null){
	        ar3=array3.length;
	    }
	    var pn=0;
	    for(var i=0;i<array2.length;i++){
	    	pn=pn+array2[i].length;
	    }
	    pn=pn+ar3+1;
	    r.collapse();
	    r.move('character',pn);
        r.select();
    }   
    else{ //这里的代码是为了解决非IE浏览器的插入，还未测试
    	//var face=face.substring(9,11);
    	//str="@表情"+face+"@";
        var newstart = tb.selectionStart+str.length;
        tb.value=tb.value.substr(0,tb.selectionStart)+str+tb.value.substring(tb.selectionEnd);   
        tb.selectionStart = newstart;   
        tb.selectionEnd = newstart;   
    }   
}

function Insertface(str){   
    var tb = document.getElementById("txtContent");   
    tb.focus();   
    if (document.all){   
        var r = document.selection.createRange();   
        document.selection.empty();
        r.text = "<IMG src='images/4/02.gif' width=24 height=24>"; 
        //r.text = str;   
        //r.collapse();   
        //r.select();   
    }   
    else{   
        var newstart = tb.selectionStart+str.length;   
        tb.value=tb.value.substr(0,tb.selectionStart)+str+tb.value.substring(tb.selectionEnd);   
        tb.selectionStart = newstart;   
        tb.selectionEnd = newstart;   
    }   
}

function insert(){
	var tarea=document.getElementById("txtContent");
	var imgic=document.createElement("img");
	imgic.src="images/4/02.gif";
	
	var tex=document.createTextNode("123456");	
	tarea.focus();
	var bbb="123456";
	//document.selection.createRange().text=bbb.innerHTML;
	
	//document.getElementById("mydiv").innerHTML='<img src="images/4/05.gif"/>';
	tarea.innerHTML+=appendChild(imgic);
	//tarea.appendChild(imgic);	
	//tarea.appendChild(tex);
	//document.getElementById("mydiv").innerHTML=imgic;
	
	
	var val="";
    var valu=document.getElementById("txtContent").childNodes;
    var len=valu.length;
    for(var i=0;i<len;i++){
    	var aa=valu[i].nodeValue;	
    	
    	//if(aa==null){ 		
    	  //  aa="<img src='images/4/01.gif'>";
    	//}
    	val+=aa;//alert(val);
    }
	
	
}

$(document).ready(function () {
	  $('#duck').imgAreaSelect({ aspectRatio: '4:3', handles: true });
	});

function pic(){
	$(document).ready(function () {
		  $('#duck').imgAreaSelect({ x1: 120, y1: 90, x2: 280, y2: 210 });
		});
}

function aaa(){
	var tex=document.createTextNode("123456");
	//document.getElementById("txtContent").focus();
	document.getElementById("mydiv").focus();
	document.selection.createRange().text= "tex";//<img src='images/4/03.gif'/>.htmText 
	alert("插入后");
	//document.getElementById("txtContent").htmlText="<img src='images/4/03.gif'/>";
	
	//document.getElementById("txtContent").innerHTML='<img src="images/4/01.gif"/>';
	//document.selection.createRange().pasteHTML=("<b>imgUU</b>");
}

function replace() {
	var tb = document.getElementById("mydiv");   
    tb.focus();  
	var myRange = document.selection.createRange().pasteHTML('<img src="images/4/01.gif"/>');
	} 

function move(m){	
	document.onmousemove=mov;
	function mov(){
		if(m==2){
			return false;
		    }
	    var x,y;
	    var modiv=document.getElementById("move");	
	    var myEvent=window.event?window.event:evt;	
	    x=myEvent.clientX;
	    y=myEvent.clientY;
	    modiv.style.left=x-75+"px";
	    modiv.style.top=y-25+"px";	
	}
}

function openWindow(url) {
	var newWin = window.open(url,"","location=no,menubar=yes,resizable=yes,toolbar=no,status=no,scrollbars=yes,width=450,height=320");
	return false;
}

function openspan(num){	
	var singlechat=document.createElement("div");
	singlechat.setAttribute("id", num);	
	var container=document.getElementById("container");
	container.appendChild(singlechat);
	document.getElementById(num).className="singlechat";
	//document.getElementById("singlechat").style.display="block";
	document.getElementById(num).innerHTML="ddddddddddddd";
}

function ext(){
     var str="abcdefghijklmnopqrstuvwxyz";
     var aa=str.charAt(0);
     alert("aa="+aa);
}