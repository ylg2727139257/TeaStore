<%@page import="com.vo.Tea"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="com.service.StoreService"%>
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
<style>
.image_display{margin-left:10%;}
#shop{margin-left:5%;}
#header .phone{clear: both;margin:5% 160%;width:100%;}
#header .Search .Search_btn{margin:-8.4% 150%;}
.Search_btn{clear:both;display: inline-block;}
.text{margin-left:70%;}
#im{position:absolute;top:6%;left:10%;}
.shop_info{float: left;margin:1% 1%;text-align:center;border:ridge;font-size: 20px;color:purple;font-family:"楷体";}
.footer{clear: both;}
.Copyright{margin-left: 20%;}
</style>
<title>茶叶商城首页</title>
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
	   	//		-----  encode	
	   	request.setCharacterEncoding("UTF-8");
	   	response.setContentType("text/html;UTF-8");
	   	  	 String flag=request.getParameter("flag");
	   /*  -----  user flag  		*/
	   		if(null!=flag){
	   	session.removeAttribute("USER");
	   		}
	   	   	Object obj=session.getAttribute("USER");
	   	   	if(null!=obj){
	   %>
		<a href="uInfo.jsp">
		<%=((User)obj).getUname()%>
		</a>
<!--    as flag   		 -->		
		<a href="index.jsp?flag=exit"> [退  出]</a>
		<%
			}else{
		%>
		 <a href="login.jsp" class="red">[请登录]</a> 新用户<a href="registered.jsp" class="red">[免费注册]</a>
		 <%
		 	}
		 %> </li>
<!--   FirstLi   -->
		<li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="index.jsp"> 首  页 </a> </li>
	   	<li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="shopping_cart.jsp">购物车</a> </li>
	   	<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="registered.jsp">注 册</a></li> 
	  	<%
 	  		if(null!=obj&&((User)obj).getRole()==0){
 	  	%>
	   	<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="admin.jsp">管 理</a></li> 	
	   	<%
 		   		}
 		   	%>
	  </ul>
	</div>
  </div>
<div id="header"  class="header">
  <div class="logo">
  <img src="images/logo.png" id="im" />
  <div class="phone" id="ph">
  免费咨询热线:<span class="telephone">400-3404-000</span>
  </div>
  </div>
  <form action="index.jsp" method="post" id="serch">
  <div class="Search">
    <input name="t_name" type="text" id="find" class="text"/><input type="submit" value=""  class="Search_btn"/>
</div>
  </form>
</div>	
<!--幻灯片样式-->
<div id="head">
<div class="Plates"  id="mian">
    <div class="image_display"  >
	   <div id="slideBox" class="slideBox">
			<div class="hd"><ul></ul>
			</div>
			<div class="bd">
				<ul>
					<li><img src="images/ad-1.png" class="photo" width="200%" /></li>
			        <li><img src="images/ad-3.jpg" class="photo" width="200%" /></li>
				</ul>
			</div>
		</div>
		<script type="text/javascript">
		jQuery(".slideBox").slide({titCell:".hd ul",mainCell:".bd ul",autoPlay:true,autoPage:true,interTime:9000});
		</script> <div id="hr"> </div> </div></div></div><br/>
      <!--内容样式-->
        <div class="Selling_list" id="shop">        
			<%
        				String t_name=request.getParameter("t_name");
        				StoreService service=new StoreService();
        				DecimalFormat format=new DecimalFormat("0.00");
        				List<Tea> teas=null;
        			  			if(null==t_name||t_name.equals("")){
        					teas=service.findAllTea();
        					if(null==teas||teas.size()==0){
        						return ;
        					}
        			  			}else{
        			  				teas=service.findTeaByName(t_name);
        			  				if(null==teas||teas.size()==0){
        			  					out.println("<script>alert('没有查询结果!');location.href='index.jsp';</script>");
        						return ;
        					}
        			  			}
        				for(Tea tea:teas){
        			%>
			<div class="shop_info" >	
				<a href="detailed.jsp?tid=<%=tea.getTid() %>">
				<img alt="图 片 走 丢 了 ！" src="<%=tea.getSrc() %>" width="210px"height="200px"/></a>
				<div id="shop_desc">
					品 名：<%=tea.getTname() %><br/>
					价 格：<%=format.format(tea.getPrice()) %><br/>
					分 类：<%=tea.getTyp() %><br/>
					产 地：<%=tea.getOrigin() %>
				</div>	
			</div>	
			<%
			}
			%>
			</div>
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
 <div class="Copyright">
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
</div>
</body>
</html>
