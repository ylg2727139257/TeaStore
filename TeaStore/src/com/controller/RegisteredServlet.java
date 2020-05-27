package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.StoreService;
import com.vo.User;

public class RegisteredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisteredServlet() {}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
//		-----  Encode
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
//		-----  getValue
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(null==username||username==""||null==password||password=="") {
			return ;
		}
		PrintWriter out=response.getWriter();
		StoreService service=new StoreService();
		User user=service.findUserByName(username);
		
		if(null==user) {
//		-----  registered
			User use=new User(username,password);
			if(service.insertUser(use)) {
				out.println("<script>alert(' 注 册 成 功 ，请 登 录 ！');"
						+ "location.href='login.jsp';</script>");
			}
		}
//		-----  ! registered
				out.println("<script>alert(' 注 册 失 败 ，该 用 户 名 可 能 已 被 使 用 ！');"
						+ "location.href='registered.jsp?username="+username
						+"&password=" + password+"';</script>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
