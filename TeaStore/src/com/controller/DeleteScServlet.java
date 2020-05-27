package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.StoreService;
import com.vo.User;

public class DeleteScServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteScServlet() {}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		-----  Encode
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
//		-----  getValue
    	String tids=request.getParameter("tids");
    	if(null==tids||tids=="") {
			return ;
		}
    	String[] tidstrs=tids.split("/");
    	for(String tidstr:tidstrs) {
    		if(null==tidstr||tidstr.equals("")) {
    			continue ;
    		}
    	int tid=Integer.parseInt(tidstr);
    	HttpSession session=request.getSession();
    	User user=(User)session.getAttribute("USER");
    	StoreService service =new StoreService();
    	service.deleteSc_shopcart(user.getUid(), tid);
    	}
    	response.sendRedirect("shopping_cart.jsp");
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
