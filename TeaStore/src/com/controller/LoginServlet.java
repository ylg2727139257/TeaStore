package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.StoreService;
import com.vo.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
//		-----  Encode
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
//		-----  getValue
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.err.println(username+"%%%%%%%%%%%"+password);
		String role=request.getParameter("role");
		String cook=request.getParameter("cook");
		if(null==username||username==""||null==password||password=="") {
			return ;
		}
		PrintWriter out=response.getWriter();
		StoreService service=new StoreService();
		Cookie cname=null;
		Cookie cpass=null;
		if(service.isRightUser(username, password)) {
//		-----  isRightUser	
		//-----  asSession	
			HttpSession session=request.getSession();
			User user=service.findUserByName(username);
			session.setAttribute("USER", user);
		//-----  asCookie
			String UTname="";
			if(null!=cook) {
				UTname=URLEncoder.encode(username,"UTF-8");
				cname=new Cookie("UTNAME",UTname);
				cpass=new Cookie("UTPASS",password);
			}else {
				cname=new Cookie("UTNAME","");
				cpass=new Cookie("UTPASS","");
			}
			cname.setMaxAge(30*60*60*24);
			cpass.setMaxAge(30*60*60*24);
			response.addCookie(cname);
			response.addCookie(cpass);
			
			if(role.equals("0")&&service.isAdmin(username)) {
		//-----  is Admin
				out.println("<script>alert('商家登录成功！');location.href='admin.jsp';"
						+ "</script>");
			}else {
		//----- is not Admin
				Object obj=session.getAttribute("page");
				String page=null==obj?"index.jsp":String.valueOf(obj);
				out.println("<script>alert('登录成功！');location.href='" + page + "';"
						+ "</script>");
			}
		}else {
//			-----  ! isRightUser			
			out.println("<script>alert('登录失败，请检查用户名和密码！');"
					+ "location.href='login.jsp';</script>");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
