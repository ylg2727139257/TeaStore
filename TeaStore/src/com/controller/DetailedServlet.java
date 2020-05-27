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

public class DetailedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DetailedServlet() {}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		-----  Encode
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
//		-----  getValue
		String tidstr=request.getParameter("tid");
		String numstr=request.getParameter("num");
		if(null==tidstr||tidstr==""||null==numstr||numstr=="") {
			return ;
		}
		int tid=Integer.parseInt(tidstr);
		int num=Integer.parseInt(numstr);
		HttpSession session=request.getSession();
		Object user=session.getAttribute("USER");
		PrintWriter out=response.getWriter();
		if(null==user) {
			out.println("<script>alert(' 您 还 未 登 录 ，请  登  录  ！');location.href='login.jsp';</script>");
		}else {
		StoreService service=new StoreService();
		int rows=service.updateSc_detailed(((User)user).getUid(),tid, num);
		if(rows!=0) {
			out.println("<script>alert('购 物 车 添 加 成 功  ！');location.href='detailed.jsp?tid="+tid+"'</script>");
		}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
