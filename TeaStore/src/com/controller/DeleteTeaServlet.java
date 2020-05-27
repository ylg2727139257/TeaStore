package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.StoreService;

public class DeleteTeaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteTeaServlet() {}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		-----  Encode
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
//		-----  getValue
    	String tidstr=request.getParameter("tid");
    	if(null==tidstr||tidstr.equals("")) {
    		return ;
    	}
    	int tid = Integer.parseInt(tidstr);
    	StoreService service=new StoreService();
    	service.deleteTea(tid);
    	response.sendRedirect("admin.jsp");
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
