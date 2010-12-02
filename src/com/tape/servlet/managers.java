package com.tape.servlet;

import com.tape.model.DbBean;
import com.tape.model.User;
import com.tape.model.UserInfo;

import java.io.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class managers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		String action = request.getParameter("action");
        if ("Login".equals(action)) {	//登录管理员页面
            this.Login(request, response);
        } else if ("Manager1".equals(action)) {	//删除成员
            this.Manager1(request, response);
        } else if ("Manager2".equals(action)) {	//管理员项目更新
            this.Manager2(request, response);
        } 
    }
	
	// 登录检查和导向管理页面
	public void Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		int mm=0;			
		int mclass=0;
		
		String strPass = request.getParameter("strpwd");   //登录框中用户密码
		String usernumber=request.getParameter("strnumber"); //登录框中用户号码
		int sNumber=Integer.parseInt(usernumber);             //用户号码string转换为int
		
		 //以下是数据库查询数据
		User userid = new User();
		List<User> users=new ArrayList<User>();
		DbBean dbBean=new DbBean();   
		users=dbBean.getUsers(sNumber);
		int alluser=users.size();		
		if(users==null||alluser==0){
			mm=1;
			String result = "您输入了错误的用户号码！请重新输入。";
			request.setAttribute("result", result);
			try {
				request.getRequestDispatcher("/managerlogin.jsp").forward(request,response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}	
		}		
		if(users!=null&&alluser>0){	
			userid=(User)users.get(0);
			String pwd=userid.getUserPwd();      //数据库中用户密码	
			mclass=userid.getMclass();
			if(!strPass.equals(pwd)){//用户密码不符
		    	mm=1;
		    	String result = "您输入了错误的密码！请重新输入。";
				request.setAttribute("result", result);
				try {
					request.getRequestDispatcher("/managerlogin.jsp").forward(request,response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
		    }
			else if(mclass==0){
				mm=1;
		    	String result = "您不是管理员，不能进入该页面！";
				request.setAttribute("result", result);
				try {
					request.getRequestDispatcher("/managerlogin.jsp").forward(request,response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
			}
		}
		if(mm==0){
			HttpSession session = request.getSession();
	        session.setAttribute("mclass",mclass);
	        ServletContext application=getServletContext();
	        application.setAttribute("class",mclass);
			try {
                request.getRequestDispatcher("manager.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(Messages.class.getName()).log(Level.SEVERE, null, ex);
            }			
		}
	}	
	
    public void Manager1(HttpServletRequest request,HttpServletResponse response) 
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");             
        
        HttpSession session = request.getSession();
        session.setAttribute("mclass","0");
        String numb;
        int i;
        int mclass=0;
        int num[]=new int[13];
        User user = new User();
        DbBean dbBean=new DbBean();
        for(i=1;i<13;i++){
           numb = request.getParameter("num"+i+"").trim();
           if(numb==""){
        	   break;
           }
           num[i]=Integer.parseInt(numb);
           
           List<User> users=new ArrayList<User>();
   		   users=dbBean.getUsers(num[i]);
   		   int leng=users.size();   		   
   		   if(leng==0){//System.out.println("leng="+leng);
   			    String result = "您输入了错误的号码("+numb+")！";
			    request.setAttribute("result", result);				
			    try {					
				    request.getRequestDispatcher("/manager.jsp").forward(request,response);
			    } catch (Throwable t) {
				    getServletContext().log(t.getMessage());
			    }
   		   }else{
   		        user=(User)users.get(0);
		        mclass=user.getMclass();		        
	       }	       
		   if(mclass>0){
		    	String result = "请认真谨慎操作，您不能删除管理员("+numb+")！";
				request.setAttribute("result", result);				
				try {					
					request.getRequestDispatcher("/manager.jsp").forward(request,response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
		   }else{			    
			    user.setUserNumber(num[i]);
			    dbBean.deleteUser(user);
			    int j=user.getNuma();
				if (j == 1) {// 删除成功	
					String username=user.getUserName();
				    String userphoto=user.getPhoto();
				    String userwith=userphoto+" "+username+"("+num[i]+")";
					UserInfo use=UserInfo.getInstance();
					use.removeUser(userwith);
					UserInfo userall=UserInfo.getInstanceall();
					userall.removeUserall(userwith);
					ServletContext application = getServletContext();
	                String strname = application.getAttribute("delename").toString();
	                if(strname.length()>804){
	                	strname=strname.substring(0,600);//限制长度
	                }
					application.setAttribute("delename", num[i]+"/"+strname);
										
					String result = "删除完成！";
					request.setAttribute("result", result);
					try {
						request.getRequestDispatcher("/manager.jsp").forward(request, response);
					} catch (Throwable t) {
						getServletContext().log(t.getMessage());
					}
			    } else {// 删除失败：
					String result = "请将情况告知群主以便群主查找原因，谢谢!";
					request.setAttribute("result", result);
					try {
						request.getRequestDispatcher("/manager.jsp").forward(request,
								response);
					} catch (Throwable t) {
						getServletContext().log(t.getMessage());
					}
			    }
		   }   		   	
        }
    }
	
    public void Manager2(HttpServletRequest request,HttpServletResponse response) 
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String num;
        User user = new User();
        DbBean dbBean=new DbBean();
        num = request.getParameter("numa").trim();;
        int numa=Integer.parseInt(num);
        num = request.getParameter("classa").trim();;
        int classa=Integer.parseInt(num);
        
        ServletContext application=getServletContext();
        int mclass=(Integer)application.getAttribute("class");//得到操作者的级别
        HttpSession session = request.getSession();
        session.setAttribute("mclass",mclass);
	    if(mclass<5){
	    	String result = "您不能进行该项操作！请向群主申请。";
			request.setAttribute("result", result);
			try {
				request.getRequestDispatcher("/manager.jsp").forward(request,response);
			} catch (Throwable t) {
				getServletContext().log(t.getMessage());
			}
	   }else{
		    List<User> users=new ArrayList<User>();
		    users=dbBean.getUsers(numa);
			user=(User)users.get(0);		   
		    user.setMclass(classa);
		    dbBean.updateUser(user);
		    int j=user.getNuma();
			if (j == 1) {// 修改成功										
				//session.removeAttribute("userwith");
				String result = "修改管理员资料成功！";
				request.setAttribute("result", result);
				try {
					request.getRequestDispatcher("/manager.jsp").forward(request, response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
		    } else {// 删除失败：
				String result = "请将情况告知群主以便群主查找原因，谢谢!";
				request.setAttribute("result", result);
				try {
					request.getRequestDispatcher("/manager.jsp").forward(request,
							response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
		    }
	   } 
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