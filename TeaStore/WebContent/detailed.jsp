<%@page import="com.vo.Tea"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
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
<link href="css/show.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/jqzoom.js" type="text/javascript"></script>
<title>产品名称详细介绍购买</title>
<style>
#num input{width:70px;height:50px;text-align:center;font-size:20px;}

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
		 		 //session.setAttribute("page", request.getRequestURI()+"?");
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
</div>
<div id="header"  class="header">
  <div class="logo">
  <a href="#"><img src="images/logo.png" /></a>
  <div class="phone">
   免费咨询热线:<span class="telephone">400-3404-000</span></div></div>
  <div class="Search"></div></div>	
 <div id="hr"> </div>
<!--内页样式-->
<div class="Inside_pages">
 <!--产品购买介绍样式-->
<%
	String tidstr=request.getParameter("tid");
   int tid=Integer.parseInt(tidstr);
   StoreService service=new StoreService();
   Tea tea=service.findTeaById(tid);
   DecimalFormat format=new DecimalFormat("0.00");
%>
     <!--产品详细介绍-->
 <div class="Details_style clearfix" id="goodsInfo">
  <div class="mod_picfold clearfix">
    <div class="clearfix" id="detail_main_img">
	 <div class="layout_wrap preview">
     <div id="vertical" class="bigImg">
		<img src="<%=tea.getSrc() %>" width="" height="" alt="图 片 走 丢 了" id="midimg" />
		<div style="display:none;" id="winSelector"></div>
	</div>
     <div class="smallImg">
		<div class="scrollbutton smallImgUp disabled">&lt;</div>
		<div id="imageMenu">
			<ul id="men">
				<li><img src="<%=tea.getSrc() %>" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
				<li><img src="imgs/tea/cb.jpg" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
				<li><img src="imgs/tea/jxc.jpg" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
				<li><img src="imgs/tea/nhj.jpg" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
				<li><img src="imgs/tea/sfc.png" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
				<li><img src="small/04.jpg" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
				<li><img src="small/05.jpg" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
				<li><img src="small/06.jpg" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
                <li><img src="small/07.jpg" width="68" height="68" alt="图 片 走 丢 了 ！"/></li>
			</ul>
		</div>
		<div class="scrollbutton smallImgDown">&gt;</div>
	</div><!--smallImg end-->	
	<div id="bigView" style="display:none;"><div><img width="800" height="800" alt="" src="" /></div></div>
	 </div>
  
	</div>
		 <div class="Sharing">
	 <div class="bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1441079683326"><a href="#" class="bds_more" data-cmd="more">分享到：</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
<script>
window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{"bdSize":16},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
</div></div>
   <!--信息样式-->
   <div class="textInfo">
    <form action="javascript:addToCart(97)" name="ECS_FORMBUY" id="ECS_FORMBUY">
	  <div class="title"><h1><%=tea.getTname() %></h1><p><%=tea.getDes() %></p></div>
	  <div class="mod_detailInfo_priceSales">
	  <div class="margins">
	  <div class="Price clearfix text_name"><label>价 格</label><span class="Prices"><h4> ¥<%=format.format(tea.getPrice()) %></h4></span></div>
	  <div class="Activity clearfix text_name"><label>重 量</label><span class="weight">500克</span></div>
	  </div>
	  </div>
	 <div class="buyinfo" id="detail_buyinfo">
		<dl>
        <dt>数 量</dt>
        <dd>
		  <div id="num">
			<input type="number"class="text" id="buy-num" value="1"min="1"name="num"/>
		 </div>       
        </dd>
	  <dd>
	    <div class="wrap_btn"> 
	    	<span id="cart"><a class="wrap_btn1" title="加入购物车"></a></span> 
		  	<span id="order"><a class="wrap_btn2" title="立即购买"></a></span> 
		  	</div>
		  </dd>
	  </dl>
	  </div>
	  <div class="Guarantee clearfix">
	   <dl><dt>商城服务</dt><dd><em></em>正品保障</dd><dd><em></em>售后无忧</dd><dd><em></em>原产认证</dd> 
	   <dd class="manner"> <div class="payment " id="payment">
      	<ul><li>货到付款</li><li>礼品卡支付</li><li>网上支付</li><li>银行转账</li></ul></div>
	  </dd></dl></div>	  
	</form>
  </div>
  </div> 
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
<script>
	var num=document.getElementById("buy-num");
/*  -----  as null     */
	num.onblur=function(){
		if(null==this.value||this.value==""){
			this.value=1;
		}
	}
/*  -----  as value     */
	num.onkeydown=function(ev){
	var charcode=String.fromCharCode(ev.keyCode);
		if(charcode>="0"&&charcode<="9"||ev.keyCode==8||ev.keyCode==37||ev.keyCode==39){
			return true;
		}
		return false;
	}
/*  -----  as cart     */	
	var cart=document.getElementById("cart");
	cart.onclick=function(){
		location.href= "detailedServlet?tid=<%=tea.getTid() %>&num=" + num.value;
	}
/*  -----  as order     */
	var order=document.getElementById("order");
	order.onclick=function(){
		location.href= "orders.jsp?tids=<%=tea.getTid() %>&num=" + num.value;	
	}
</script>
</body>
</html>
