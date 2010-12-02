package com.tape.servlet;

import com.tape.model.DbBean;
import com.tape.model.User;
import com.tape.model.UserInfo;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Vector;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class Messages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		String action = request.getParameter("action");
        if ("loginRoom".equals(action)) {	//登录时，写入系统公告
            this.loginRoom(request, response);
        } else if ("sendMessage".equals(action)) {	//发送聊天信息
            this.sendMessages(request, response);
        } else if ("getMessages".equals(action)) {		//读取聊天信息
            this.getMessages(request, response);
        }
    }

	// 登录
	public void loginRoom(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		int mm=0;			
		
		String strPass = request.getParameter("loginpass").trim();   //登录框中用户密码
		String usernumber=request.getParameter("usernumber").trim(); //登录框中用户号码
		int sNumber=Integer.parseInt(usernumber);             //用户号码string转换为int
		
		 //以下是数据库查询数据
		User userid = new User();
		List<User> users=new ArrayList<User>();
		DbBean dbBean=new DbBean();   
		users=dbBean.getUsers(sNumber);
		int alluser=users.size();
		if(users==null||alluser==0){//输入错误用户的处理
			mm=1;
			String resultt = "您输入了错误的用户号码！请重新输入。";
			request.setAttribute("resultt", resultt);
			try {
				request.getRequestDispatcher("/index.jsp").forward(request,response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}	
		}
		if(users!=null&&alluser>0){//输入错误密码的处理
			userid=(User)users.get(0);
			String pwd=userid.getUserPwd(); //数据库中用户密码					
			if(!strPass.equals(pwd)){       //用户密码不符
		    	mm=1;
		    	String resultt = "您输入了错误的密码！请重新输入。";
				request.setAttribute("resultt", resultt);
				try {
					request.getRequestDispatcher("/index.jsp").forward(request,response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
		    }
		}
		if(mm==0){//用户名和密码输入正确的处理
			String username=userid.getUserName();//数据库中用户呢称
			String userphoto=userid.getPhoto();
			String userwith=userphoto+" "+username+"("+usernumber+")";//为传递和显示数据，将用户号码和呢称组合在一起
		    UserInfo user=UserInfo.getInstance();		//获得UserInfo类的对象
		    session.setMaxInactiveInterval(1200);		//设置Session的过期时间为20分钟
		    Vector<String> vector=user.getList();
		    
		      //判断用户是否已经登录
		    boolean flag=true;
		    //System.out.println("vector-size(登录前在线人员总数)="+vector.size());
		    if(vector!=null && vector.size()>0){
			    for(int i=0;i<vector.size();i++){
				    //System.out.println("vector["+i+"](登录前在线人员)="+vector.elementAt(i));
				    if(userwith.equals(vector.elementAt(i))){
					     PrintWriter out;
					     try {
						     out = response.getWriter();
						     out.println("<script language='javascript'>alert('该用户已经登录');window.location.href='index.jsp';</script>");
					     } catch (IOException e) {
						     e.printStackTrace();
					     }
					     flag=false;
					     break;
				    }
			    }
			    //System.out.println("本次登录人员="+userwith);
		    }
		     //保存用户信息
		    if(flag){		    	
		    	UserInfo userall=UserInfo.getInstanceall();
				userall.removeUserall(userwith);
		    	
		    	UserListener listener=new UserListener();	   
			    listener.setUser(userwith);					//添加监听对象
			    user.addUser(listener.getUser());	        //添加监听对象到UserInfo类的vector对象中
			    session.setAttribute("user",listener);		//将UserListener对象绑定到Session中			    
			    session.setAttribute("userwith",userwith);	//保存当前登录的用户名
			    session.setAttribute("usernumber",usernumber);	
			    SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");			    
			    session.setAttribute("loginTime",time.format(new Date()));	//保存登录时间
			    
                ServletContext application=getServletContext();
                //application.setAttribute("message","");
                //application.setAttribute("messageee","");
                try{
                	application.getAttribute("message").toString();
                }catch(Exception e){
                	application.setAttribute("message","");
                } 
                try {
                    request.getRequestDispatcher("main.jsp").forward(request, response);//将login_ok.jsp改成了main.jsp
                    
                } catch (Exception ex) {
                    Logger.getLogger(Messages.class.getName()).log(Level.SEVERE, null, ex);
                }
		    }
		}
	}

	// 发送聊天信息
    public void sendMessages(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            Random random = new Random();
            String extre = request.getParameter("extre");//额外的号码，包括修改后的聊天显示框的ID
            String ff = request.getParameter("ff");//序号代表所选择的私聊主框架            
            String from = request.getParameter("from"); //发言人号码和呢称
            String content1 = request.getParameter("content1"); //发言内容
            //if(content1!=null){
            //    content1=content1.replace("中李M荣att臻hylee","&");//发送时将&字符用其它字符取代了，现在返回该字符
            //}
            SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String sendTime = time.format(new Date()); //发言时间
            
            int i=from.indexOf("(");
            String str=from.substring(i+1,i+6);//从号码和呢称混合的字符串中取出号码
            int sNumber=Integer.parseInt(str);//将号码从String转换成int
            
            ServletContext application = getServletContext();
            
            //下面过滤掉被踢人的发言
            try{
                String deleliststr = application.getAttribute("delename").toString();
                int delenumb=deleliststr.length()/6;            
                for(int j=0;j<delenumb;j++){
            	    String delename=deleliststr.substring(j*6, j*6+5);
            	    if(delename.equals(str)){//如果发言者跟被踢掉名单中的一个号码相同，就重新设置ff的值，以便该人不能发言
            		    ff="100";
            		    break;
            	    }
                }
            }catch(Exception e){
            	application.setAttribute("delename","");
            }
            try {
            	String newMessage;
            	String oldMessage;
            	if(ff.equals("0")){
            	    oldMessage = application.getAttribute("message").toString();
            	    newMessage = "<span class='contentfont1'>" + from + " " +  sendTime
                    + "</span><br>" + content1 + "<br>"; 
                     
                    oldMessage=oldMessage+newMessage;
                    int leng=oldMessage.length();
                    if(leng>4000){//控制存储message的session不要过于庞大，影响速度，具体数值定多大，需要调节
                    	int ii=oldMessage.indexOf("<img", 2600);
                    	oldMessage=oldMessage.substring(ii-27, leng);
                    }
                    application.setAttribute("message", oldMessage);
                    //request.getRequestDispatcher("content.jsp?nocache=" + random.nextInt(10000)).forward(request, response);
                    
                    //以下把聊天记录输入数据库chatrecord
                    User user = new User();                
                    user.setUserNumber(sNumber);
        			user.setChatDate(sendTime);
        			user.setChatRecord(newMessage);
        			DbBean dbBean=new DbBean();
        			dbBean.insertChatRecord(user);     
            	}
            	
            	if(ff.equals("1")){
                    newMessage = "<span class='contentfont1'>" + from + " " +  sendTime
                               + "</span><br>" + content1 + "<br>"; 
                	if(content1==null){
                		newMessage="";
                	}                	
                	try{
                		oldMessage = application.getAttribute(""+extre+"").toString();
                		//oldMessage=oldMessage.substring(10);
                		//String le=oldMessage.substring(15,17);
                    	//int length=Integer.parseInt(le);
                    	//oldMessage=oldMessage.substring(17+length);                		
                	}catch(Exception e){
                		oldMessage=extre;
                		//oldMessage="";            
                	}            	
                	
                    oldMessage=oldMessage+newMessage;
                    //oldMessage=newstr+oldMessage+newMessage;
                    int leng=oldMessage.length();                    
                    if(leng>3000){//控制session不要过于庞大，影响速度，具体数值定多大，需要调节
                    	int ii=oldMessage.indexOf("<img", 2000);
                    	oldMessage=oldMessage.substring(ii-27, leng);
                    	oldMessage=extre+oldMessage;
                        //str1=extre.substring(0, 5);
                        //str2=extre.substring(5, 10);
                        //if(str.equals(str1)){
                    	//    oldMessage=extre+str2+len+from+oldMessage;//双方的号码＋对方号码+from的长度值+from+旧信息
                    	//}else{
                    	//	oldMessage=extre+str1+len+from+oldMessage;
                    	//}
                    }
                    application.setAttribute("message11", extre);
                    application.setAttribute(""+extre+"", oldMessage);
                    //request.getRequestDispatcher("content1.jsp?nocache=" + random.nextInt(10000)).forward(request, response);
                    
                    User user = new User();                
                    user.setTwoUserNumber(extre);
        			user.setChatDate(sendTime);
        			user.setChatRecord(newMessage);
        			DbBean dbBean=new DbBean();
        			dbBean.insertPersonalChat(user);  
        			
        			//int len=from.length();
                	String str1=extre.substring(0, 5);
                    String str2=extre.substring(5, 10);
                    //sendTime=sendTime.replaceAll("-","").replaceAll(":","").replaceAll(" ","");
                    //System.out.println("sendTime="+sendTime);
                    String newNum,oldNum;
                    //newNum=extre+from;//双方号码+userwith
                    if(str.equals(str1)){
                    	newNum=extre+str2+from;//双方号码＋对方号码+userwith
                    	//newstr=extre+str2+len+from;//双方号码＋对方号码+from
                	}else{
                		newNum=extre+str1+from;//双方号码＋对方号码+userwith
                	}
                    int j;                    
                    try{
                		oldNum = application.getAttribute("totalNumber").toString();
                		j=oldNum.indexOf(newNum); 
                		//oldMessage=oldMessage.substring(10);
                		//String le=oldMessage.substring(15,17);
                    	//int length=Integer.parseInt(le);
                    	//oldMessage=oldMessage.substring(17+length);                		
                	}catch(Exception e){
                		oldNum=""; 
                		j=-1;
                	} 
            		if(j==(-1)){
            			newNum=oldNum+"@"+newNum;
            			//System.out.println("newNum="+newNum);
                    	application.setAttribute("totalNumber", newNum);                	
                    	request.getRequestDispatcher("contentnumber.jsp?nocache=" + random.nextInt(10000)).forward(request, response);
            		}
                }
            	
            	if(ff.equals("2")){
            		
                }
            } catch (Exception ex) {//Messages?action=getMessages&这个是被上面的content.jsp?取代
                Logger.getLogger(Messages.class.getName()).log(Level.SEVERE, null, ex);
            }
	}
    
	// 得到聊天记录
	public void getMessages(HttpServletRequest request,HttpServletResponse response) 
	    throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
        
		String chatRecord="";
        String dayy = request.getParameter("day");
        String sid = request.getParameter("www");
		User userid = new User();
		List<User> chatrecords=new ArrayList<User>();
		DbBean dbBean=new DbBean();
		if(sid.equals("content")){		    
		    chatrecords=dbBean.getChatRecords(dayy);
		    for(int i=0;i<chatrecords.size();i++){
				 userid=(User)chatrecords.get(i);
				 chatRecord+=userid.getChatRecord();
			}
		    chatRecord="日期：<span id='datehead'>"+dayy+"&nbsp;&nbsp;聊天记录</span><br/>"+chatRecord;
		    
		}else{
			//chatrecords=dbBean.getPersonalChatRecords(sid,dayy);
			//for(int i=0;i<chatrecords.size();i++){
			//	 userid=(User)chatrecords.get(i);
			//	 chatRecord+=userid.getChatRecord();
			//}
		    //chatRecord="<div class='chat2611'>"+dayy+"&nbsp;&nbsp;聊天记录</div>"
		    //          +"<div class='chat2612'>"+chatRecord+"</div>";
		}	    
		//HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		//session.setAttribute("chatrecord", chatRecord);
		application.setAttribute("chatrecord", chatRecord);
		//System.out.println(chatRecord);
        //try {
        //    request.getRequestDispatcher("chatrecord.jsp").forward(request, response);
        //}catch (Exception ex) {
        //    Logger.getLogger(Messages.class.getName()).log(Level.SEVERE, null, ex);
        //}
	}
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet 方法。单击左侧的 + 号以编辑代码。">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
