package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.StoreService;
import com.vo.User;

public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddressServlet() {}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	-----  encode	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");
//	-----  value
		String uname =request.getParameter("uname");
		String uphone =request.getParameter("uphone");
		String sitepro =request.getParameter("sitepro");
		String sitecity =request.getParameter("sitecity");
		String sitedist =request.getParameter("sitedist");
		String sitetext  =request.getParameter("sitetext");
		String upostcode  =request.getParameter("upostcode");
		String site=uname + "/" + uphone + "/" + sitepro + sitecity + sitedist + 
				sitetext + "/" + upostcode ;
		StoreService service=new StoreService();
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		Object obj=session.getAttribute("USER");
		int nus=service.insertSite(((User)obj).getUid(), site);
		out.println("<script>location.href='choose.jsp?nus=" + nus + "';</script>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
