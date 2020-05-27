package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.StoreService;
import com.vo.Tea;

public class InsertTeaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public InsertTeaServlet() {}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		-----  Encode
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
//		-----  getValue
    	System.out.println("******its");
    	
    	String tname=request.getParameter("tname");
    	String pristr=request.getParameter("price");
    	double price=0;
    	if(null!=pristr&&!pristr.equals("")) {
    		price=Double.parseDouble(pristr);
    	}
    	String stostr=request.getParameter("stock");
    	double stock=0;
    	if(null!=pristr&&!pristr.equals("")) {
    		stock=Double.parseDouble(stostr);;
    	}
    	String src=request.getParameter("src");
    	String typ=request.getParameter("typ");
    	String origin=request.getParameter("origin");
    	String des=request.getParameter("des");
    	Tea tea=new Tea(tname, price, stock, src, typ, origin, des);
    	StoreService service=new StoreService();
    	service.insertTea(tea);
    	response.sendRedirect("admin.jsp");
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
