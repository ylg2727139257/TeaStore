<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			div{width:400px;height:100px;background-color:yellowgreen;text-align:center;font-size:25px;color:blue;margin:10% 35%;padding:5% 0;}
			button{background-color:skyblue;font-size:30px;}
		</style>
	</head>
	<body>
	<%
//	-----  encode	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;UTF-8");
	String nus =request.getParameter("nus");
	String aler="";
	if(nus.equals("1")) {
		aler="地 址 添 加 成 功,继 续 添 加！";
	%>
	<div>
	<%=aler %><br/><br/>
	<button onclick="location.href='uInfo.jsp';">是</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='shopping_cart.jsp';">否</button>
	</div>
	<%
	}else{
		aler="地 址 添 加 失 败,重 新 添 加！";
	%>
	<div>
	<%=aler %><br/><br/>
	<button onclick="location.href='uInfo.jsp';">是</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='index.jsp';">否</button>
	</div>
	<%
	}
	%>
	</body>
</html>