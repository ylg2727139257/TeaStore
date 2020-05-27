package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.StoreService;
import com.vo.User;

public class ShopcartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ShopcartServlet() {}
    protected void doGet(HttpServletRequest request, HttpServletResponse 
    		response) throws ServletException, IOException {
//		-----  Encode
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
//		-----  getValue
    	String tidstr=request.getParameter("tid");
    	String numstr=request.getParameter("num");
    	String f=request.getParameter("f");
    	if(null==tidstr||tidstr==""||null==numstr||numstr=="") {
			return ;
		}
    	int tid=Integer.parseInt(tidstr);
    	int num=Integer.parseInt(numstr);
    	HttpSession session=request.getSession();
    	User user=(User)session.getAttribute("USER");
    	StoreService service =new StoreService();
    	service.updateSc_shopcart(user.getUid(),tid,num,f);
        response.sendRedirect("shopping_cart.jsp");		
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse 
			response) throws ServletException, IOException {
		doGet(request, response);
	}

}
