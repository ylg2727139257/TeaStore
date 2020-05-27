<%@page import="com.vo.Tea"%>
<%@page import="java.text.DecimalFormat"%>
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
<link href="css/Orders.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.reveal.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/jquery.sumoselect.min.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/jquery.jumpto.js" type="text/javascript"></script>
<style>
#ts{margin:10px 150px;}
#main{margin:2% 24%;font-size:22px;color:purple;background-color:yellowgreen;padding:2% 0;}
button{margin:1% 24%;width:50%;background-color:orange;}
#info{display:inline-block;width:53%;padding:0 3%;}
#settl{display:inline-block;margin-left:-3%;}
.Copyright{margin-left: 20%;}
</style>
<title>支付界面</title>
</head>
 <script type="text/javascript">
        $(document).ready(function () {
            window.asd = $('.SlectBox').SumoSelect({ csvDispCount: 3 });
            window.test = $('.testsel').SumoSelect({okCancelInMulti:true });
        });
    </script>
<body>
<%@	include file="no_login.jsp" %>
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
	   	   	User user=(User)session.getAttribute("USER");
	   %>
		<a href="uInfo.jsp">
		<%=user.getUname()%>
		</a>
<!--    as flag   		 -->		
		<a href="index.jsp?flag=exit"> [退  出]</a>
		</li>
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
</div>
<!--logo和搜索样式-->
<div id="shop_cart">
 <div id="header">
  <div class="logo">
  <a href="#"><img src="images/logo.png" /></a>
  <div class="phone">
   免费咨询热线:<span class="telephone">400-3454-343</span>
  </div>
  </div>
</div>
</div>
<!--提示购物步骤-->
 <div class="prompt_step" id="ts">
  <img src="images/cart_step_03.png" />
 </div>
<!--收货地址样式-->
<%
	int num=0;
	Tea tea=null;
	String ntids="";
	String tnames="";
	String prices="";
	String tids=request.getParameter("tids");
	String nums=request.getParameter("nums");
	if(null==tids||tids.equals("/")||tids.equals("")||null==nums||nums.equals("/")||nums.equals("")){
		out.println("<script>alert('订单提交失败 ! ');location.href='shopping_cart.jsp';</script>");
		return ;
	}
	StoreService service=new StoreService();
	DecimalFormat format=new DecimalFormat("0.00");
	String[] tidstr=tids.split("/");
	String sum=request.getParameter("sum");
	String note=request.getParameter("note");
	String uname=request.getParameter("uname");
	String uphone=request.getParameter("uphone");
	String uaddress=request.getParameter("uaddress");
	String upostcode=request.getParameter("upostcode");
%>
<div id="main">
<span id="info">
您 好 ！<%=uname %><br/>
电 话 ：<%=uphone %><br/>
地 址 ：<%=uaddress %><br/>
邮 编 ：<%=upostcode %><br/>
<%
for(int i=0;i<tidstr.length;i++){
	if(null==tidstr[i]||tidstr[i].equals("")){
		continue;
	}
	int tid=Integer.parseInt(tidstr[i]);
	tea=service.findTeaById(tid);
   	tnames=tnames+"/"+tea.getTname();
   	prices=prices + "/￥" + format.format(tea.getPrice());
}
if(tnames.equals("/")){
	out.println("<script>alert('订单提交失败 ! ');location.href='shopping_cart.jsp';</script>");
	return ;
}
%>
商 品 ：<%=tnames %><br/>
数 量 ：<%=nums %><br/>
单 价 ：<%=prices %><br/>	
备 注 ：<%=note %><br/><br/>
共 计 ：￥ <%=sum %><br/>
 确 认 无 误 请 支 付 !
</span>
<img src="imgs/settle.png" width="40%" height="40%" id="settl"/>
<button id="pay">支 付</button>
</div>
<script>
var pay=document.getElementById("pay");
pay.onclick=function(){
	alert("支付成功！");
	location.href="deleteServlet?tids=<%=tids %>";	
}
</script>
<!--底部样式-->
<div class="footer">
 <div class="streak"></div>
 <div class="footerbox clearfix">
  <div class="left_footer">
   <div class="img"><img src="images/img_33.png" /></div>
   <div class="phone">
    <h2>服务咨询电话</h2>
    <p class="Numbers">400-3455-334</p>
   </div>
  </div>
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
			</div>
			</div></li>
    <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
  </ul>
</div>
</body>
</html>
