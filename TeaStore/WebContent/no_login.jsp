<%@page import="com.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>no_login</title>
	</head>
	<body>
		<%
		Object obj=session.getAttribute("USER");
	   	if(null==obj){
	   		out.println("<script>alert('亲 ， 还 未 登 录 哦 !');location.href='login.jsp';"
					+ "</script>");
	   		return ;
	   	}
		%>
	</body>
</html>