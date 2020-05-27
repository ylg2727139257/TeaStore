<%@page import="com.vo.Tea"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.vo.Shopcart"%>
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
#top{padding-right:37%;}
.top{width:-160%;}
.phone{text-align:center;}

</style>
<title>购物车</title>
</head>
<!--宽度1000的购物车样式-->
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
	   	String flag=request.getParameter("flag");
	   /*  -----  user flag  		*/
	   		if(null!=flag){
	   	session.removeAttribute("USER");
	   		}
	   	   	User user=(User)obj;
	   	   	if(null==user){
	   	   		return ;
	   	   	}
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
<!--提示购物步骤-->
 <div class="prompt_step">
  <img src="images/cart_step_01.png" />
 </div>
 <!--购物车商品-->
 <div class="Shopping_list">
  <div class="title_name">
    <ul>
	<li class="name">商品名称</li>
	<li class="checkbox">&nbsp;</li>
	<li class="scj">&nbsp;</li>
	<li class="bdj">价 格</li>
	<li class="sl">购买数量</li>
	<li class="xj">小 计</li>
	<LI class="cz">操 作</LI>
  </ul>
 </div>
  <div class="shopping">
  <form  method="post">
 <table class="table_list">
 <%
 	double sum=0;
  	StoreService service=new StoreService();
  	List<Tea> teas=service.findTeaSc(user.getUid());
  	DecimalFormat format=new DecimalFormat("0.00");
 	double sub=0;
  	for(Tea tea:teas){
 		sub=tea.getPrice()*tea.getNum();
 		sum+=sub;
 %> 
	<tr class="tr">
   	<td class="checkbox"><input name="checkitems" type="checkbox" value="<%=tea.getTid() %>" onclick="check(this,<%=sub %>);"/></td>
    <td class="name">
	  <div class="img"><a href="detailed.jsp?tid=<%=tea.getTid() %>"><img src="<%=tea.getSrc() %>"/></a></div>
	  <div class="p_name"><a href="detailed.jsp?tid=<%=tea.getTid() %>"><%=tea.getTname() %></a></div>
	</td>
	<td class="scj sp"></td>
	<td class="bgj sp">￥<%=format.format(tea.getPrice()) %></td>
	<td class="sl">
	    <div class="Numbers">
		  <a href="shopcartServlet?tid=<%=tea.getTid() %>&num=<%=tea.getNum() %>&f=minus" class="jian">-</a>
		  <input id="number" name="number" type="text" value="<%=tea.getNum() %>" class="number_text" onblur="asnum(this,<%=tea.getTid() %>);" />
		  <a href="shopcartServlet?tid=<%=tea.getTid() %>&num=<%=tea.getNum() %>&f=plus" class="jia">+</a>
		 </div>
	</td>
	<td class="xj"><h4>￥<%=format.format(sub) %></h4></td>
	<td class="cz">
	 <p><a href="deleteServlet?tids=<%=tea.getTid() %>">删 除</a><P>
	</td>
   </tr> 	 
<% 
 }
 %>
 </table>
 <div class="sp_Operation">
  <div class="select-all">
  <div class="cart-checkbox"><input type="checkbox" id="CheckedAll" name="toggle-checkboxes" class="jdcheckbox" />全 选</div>
    </div> 
	 <!--结算-->
	<div class="toolbar_right">
    <div class="p_Total">
	  <span class="text">商品总价：</span><span class="price sumPrice" id="total">0.00</span>元
	</div>
	<div class="btn">
	 <a class="continueFind" href="index.jsp"></a>
	 <a class="cartsubmit" id="settle"></a>
	</div>
  </div>
  </div>
   </form>
 </div>
</div>
<!--底部样式-->
 <div class="footer help-box  clearfix">
   <div class="right_footer clearfix">
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
  <div class="Copyright">
  <p><a href="#">关于我们</a> | <a href="#">隐私申明</a> | <a href="#">成为供应商</a> | <a href="#">茶叶</a> | <a href="#">博客</a> |<a href="#">友情链接</a> | <a href="#">网站地图</a></p>
  <p>Copyright 2010 - 2015 巴山雀舌 四川巴山雀舌茗茶实业有限公司 zuipin.cn All Rights Reserved </p>
  <p>川ICP备10200063号-1</p>
   <a href="#" class="return_img"></a>
 </div>
 </div>
</div>
<!--结束-->
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
			 <p><img alt="图 片 走 丢 了 ！" src="imgs/other/ybh.png" width="150px" height="150px"/></p>
			 <p>微信扫一扫，关注我们</p>
			</div>		</div></li>
    <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
  </ul>
</div>
<script>
/*  -----  as value  	*/
var numbers=document.getElementsByName("number");
var checks=document.getElementsByName("checkitems");
for(var i=0;i<numbers.length;i++){
	numbers[i].onkeydown=function(ev){
	var charcode=String.fromCharCode(ev.keyCode);
		if(charcode>="0"&&charcode<="9"||ev.keyCode==8||ev.keyCode==37||ev.keyCode==39){
			return true;
		}
	return false;
	}
}
/*  -----  as null     */
function asnum(curr,tid){
	if(null==curr.value||curr.value==""||curr.value=="0"){
		num=1;
	}else{
		num=parseInt(curr.value);
	}
	location.href="shopcartServlet?tid="+tid+"&num="+num+"&f=no" ;
}
/*    as  checkedall   */
var checkall=document.getElementById("CheckedAll");
var total=document.getElementById("total");
checkall.onclick=function(){
	for(var i=0;i<checks.length;i++){
		checks[i].checked=this.checked;
		if(this.checked){	
			total.innerHTML=<%=format.format(sum) %>;	
		}else{
			total.innerHTML=0.00;		
		}
	}	
}
/*    as  check */   
function check(curr,sub){
	if(curr.checked){
		total.innerHTML=parseFloat(total.innerHTML.trim())+sub;			
	}else{
		checkall.checked=false;	
		total.innerHTML=parseFloat(total.innerHTML.trim())-sub;			
	}
}
/*    as  settle */  
var settle=document.getElementById("settle");
settle.onclick=function(){
	var tids = "";
	for(var i=0;i<checks.length;i++){
		if(checks[i].checked){	
			tids = tids + "/" + checks[i].value;		
		}
	}
	location.href="orders.jsp?tids=" + tids ;
}
</script>
</body>
</html>
