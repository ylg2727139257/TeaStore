<%@page import="com.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<title>茶叶商城首页</title>
<style>
form{margin:10px 19%;padding-left:5%;color:purple;font-size:20px;font-weight: bold;background-color:yellowgreen;}
#submi{padding:10px 38.5%;}
</style>
</head>
<body>
<!--顶部样式-->
<div id="top">
  <div class="top">
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
<!--  FirstLi  -->
	   <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！
	   <%
	  	 String flag=request.getParameter("flag");
	   /*  -----  user flag  		*/
		if(null!=flag){
			session.removeAttribute("USER");
		}
	   	User user=(User)session.getAttribute("USER");
	   	if(user.getRole()!=0){
	   		out.println("<script>location.href='index.jsp';</script>");
	   		return ;
	   	}
	   	%>
		<a href="uInfo.jsp">
		<%=user.getUname() %>
		</a>
<!--    as flag   		 -->		
		<a href="index.jsp?flag=exit"> [退  出]</a>
		</li>
<!--   FirstLi   -->
		<li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="index.jsp"> 首  页 </a> </li>
	   	<li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="shopping_cart.jsp">购物车</a> </li>
	   	<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="registered.jsp">注 册</a></li> 
	   	<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="admin.jsp">管 理</a></li> 	
	  </ul>
	</div>
  </div>
</div>
<!--logo和搜索样式-->
<div id="header"  class="header">
  <div class="logo">
  <span><img src="images/logo.png"/></span></div>
  <div class="phone">
   免费咨询热线:<span class="telephone">400-3404-000</span></div></div>
  <div class="Search"></div>
		<form action="insertTeaServlet" method="post"><br/>
			名 称&nbsp;<input type="text" name="tname" />
			&nbsp;&nbsp;
			价 格&nbsp;<input type="number" name="price"/>
			<br/><br/><br/>
			库 存&nbsp;<input type="text" name="stock" />
			&nbsp;&nbsp;
			图 片&nbsp;<input type="text" name="src" />
			<br/><br/><br/>
			类 型&nbsp;<input type="text" name="type" />
			&nbsp;&nbsp;
			产 地&nbsp;<input type="text" name="origin" />
			<br/><br/><br/>
			描 述&nbsp;<input type="text" name="desc" />
			<br/><br/><br/>
			<input type="submit" value=" 确 认 添 加 " id="submi"/>
			<br/><br/>
		</form>
	<!--底部样式-->
<div class="footer" >
 <div class="streak"></div>
 <div class="footerbox clearfix">
  <div class="left_footer">
   <div class="img"><img src="images/img_33.png" /></div>
   <div class="phone">
    <h2>服务咨询电话</h2>
    <p class="Numbers">400-0000-000</p></div></div>
  <div class="right_footer">
   <dl>
    <dt><em class="icon_img"></em>购物指南</dt>
    <dd><a href="#">怎样购物</a></dd>
    <dd><a href="#">积分政策</a></dd>
    <dd><a href="#">会员优惠</a></dd>
    <dd><a href="#">订单状态</a></dd>
    <dd><a href="#">产品信息</a></dd>
    <dd><a href="#">怎样购物</a></dd>
   </dl>
   <dl>
    <dt><em class="icon_img"></em>配送方式</dt>
    <dd><a href="#">快递资费及送达时间</a></dd>
    <dd><a href="#">快递覆盖地区查询</a></dd>
    <dd><a href="#">验货与签收</a></dd>
    <dd><a href="#">订单状态</a></dd>
    <dd><a href="#">产品信息</a></dd>
    <dd><a href="#">怎样购物</a></dd>
   </dl>
   <dl>
    <dt><em class="icon_img"></em>配送方式</dt>
    <dd><a href="#">货到付款</a></dd>
    <dd><a href="#">支付宝</a></dd>
    <dd><a href="#">财付通</a></dd>
    <dd><a href="#">网银支付</a></dd>
    <dd><a href="#">银联支付</a></dd>
   </dl>
   <dl>
    <dt><em class="icon_img"></em>售后服务</dt>
    <dd><a href="#">退换货原则</a></dd>
    <dd><a href="#">退换货要求与运费规则</a></dd>
    <dd><a href="#">退换货流程</a></dd>
   </dl>
   <dl>
    <dt><em class="icon_img"></em>关于我们</dt>
    <dd><a href="#">关于我们</a></dd>
    <dd><a href="#">友情链接</a></dd>
    <dd><a href="#">媒体报道</a></dd>
    <dd><a href="#">新闻动态</a></dd>
    <dd><a href="#">企业文化</a></dd>
 
   </dl>
  </div>
 </div>
 <div class="slogen">
  <div class="footerbox clearfix ">
  <ul class="wrap">
	 <li>
	  <a href="#"><img src="images/icon_img_02.png" data-bd-imgshare-binded="1"></a>
	  <b>正品保证</b>
	  <span>正品行货 放心选购</span>
	 </li>
	 <li><a href="#"><img src="images/icon_img_03.png" data-bd-imgshare-binded="2"></a>
	  <b>满68元包邮</b>
	  <span>购物满68元，免费快递</span>
	 </li>
	 <li>
	  <a href="#"><img src="images/icon_img_04.png" data-bd-imgshare-binded="3"></a>
	  <b>厂家直供</b>
	  <span>价格更低，质量更可靠</span>
	 </li>
      <li>
	  <a href="#"><img src="images/icon_img_05.png" data-bd-imgshare-binded="4"></a>
	  <b>权威认证</b>
	  <span>政府扶持单位，安全保证</span>
	 </li>
	</ul>
  </div>
 </div>
 <div class="footerbox Copyright">
  <p><a href="#">关于我们</a> | <a href="#">隐私申明</a> | <a href="#">成为供应商</a> | <a href="#">茶叶</a> | <a href="#">博客</a> |<a href="#">友情链接</a> | <a href="#">网站地图</a></p>
  <p>Copyright 2010 - 2015 巴山雀舌 四川巴山雀舌茗茶实业有限公司 zuipin.cn All Rights Reserved </p>
  <p>川ICP备10200063号-1</p>
   <a href="#" class="return_img"></a>
 </div>
</div>
 <!--右侧菜单栏购物车样式-->
<div class="fixedBox">
  <ul class="fixedBoxList">
      <li class="fixeBoxLi user"><a href="uInfo.jsp"> <span class="fixeBoxSpan"></span> <strong>用 户</strong></a> </li>
      <li class="fixeBoxLi Home"> <a href="index.jsp"> <span class="fixeBoxSpan"></span> <strong>首 页</strong> </a> </li>
    <li class="fixeBoxLi cart_bd" style="display:block;" id="cartboxs">
		<a href="shopping_cart.jsp"><span class="fixeBoxSpan"></span> <strong>购物车</strong></a></li>
	 <li class="fixeBoxLi code cart_bd " style="display:block;" id="cartboxs">
			<span class="fixeBoxSpan"></span> <strong>微 信</strong>
			<div class="cartBox">
       		<div class="bjfff"></div>
			<div class="QR_code">
			 <p><img alt="图 片 走 丢 了 ！" src="imgs/other/ybh.png" width="150px" height="150px" style=" margin-top:10px;" /></p>
			 <p>微信扫一扫，关注我们</p>
			</div>		</div></li>
    <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
  </ul>
</div>
</body>
</html>
