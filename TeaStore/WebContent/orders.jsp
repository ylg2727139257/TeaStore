<%@page import="com.vo.Tea"%>
<%@page import="com.vo.Site"%>
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
.hidd{visibility: hidden;}
#tids{visibility: hidden;}
#ts{margin:20px 120px;}
.detailed{font-size:18px;text-align:center;}
input{width:300px;text-align:center;}
span{color:red;}
.top{width:90%;}

</style>
<title>确认订单界面</title>
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
 	  	if(((User)obj).getRole()==0){
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
  <img src="images/cart_step_02.png" />
 </div>
<!--收货地址样式-->
<div id="Orders" class="Inside_pages  clearfix">
<form method="post" action="buy.jsp" >
  <div class="Orders_style clearfix">
     <div class="address clearfix">
 <div class="title">收货人信息</div>
 <div class="adderss_list clearfix">
 <div class="title_name">选 择 收 货 地 址<span>
 <select onchange="setText(this);" >
            	<option selected="selected"> =选==择==收==货==地==址=</option>
            	<%
            		StoreService service=new StoreService();
            	            	List<Site> sites=service.findSiteByUid(user.getUid()); 
            	            	if(null==sites){
            	            		out.println("<script>alert('还没有地址，去添加！');location.href='uInfo.jsp';</script>");
            	            	}
            	            	for(Site site:sites){
            	%>
            	<option><%=site.getSite()%></option>
            	<%
            		}
            	%>
            </select>&nbsp;&nbsp;*</span>
 <a href="uInfo.jsp">+添加地址</a></div>
     <div class="Shipping_address">
       <ul class="detailed">
        <li><label>姓&nbsp;&nbsp;名</label><span><input name="uname" value="<%=user.getUname()%>"/>&nbsp;&nbsp;*</span></li>
        <li><label>电&nbsp;&nbsp;话</label><span><input name="uphone" value="<%=user.getPhone()%>"/>&nbsp;&nbsp;*</span></li> 
        <li><label>地&nbsp;&nbsp;址 </label><span><input name="uaddress" value="<%=user.getAddress()%>"/>&nbsp;&nbsp;*</span></li>
        <li><label>邮&nbsp;&nbsp;编</label><span><input name="upostcode"/></span></li>   
       </ul>
     </div>
     </div> 
      <!--产品列表-->
     <div class="Product_List">
      <table>
       <tr class="title">
       <td class="name">商品名称</td><td class="price">商品价格</td>
      	<td class="Quantity">购买数量</td><td class="Money">金&nbsp;&nbsp;额</td>
       <td class="Preferential"> 操&nbsp;&nbsp;作 </td>
       </tr>
       <%
       	int num=0;
              	Tea tea=null;
              	double sub=0;
              	double sum=0;
              	String nums="";
              	String ntids="";
              	String tids=request.getParameter("tids");
              	if(null==tids||tids.equals("")){
              		out.println("<script>alert('请选择商品!') ;location.href='shopping_cart.jsp';</script>");
              		return ;
              	}
              	String numstr=request.getParameter("num");
              	DecimalFormat format=new DecimalFormat("0.00");
              	String[] tidstrs=tids.split("/");
            for(String tidstr:tidstrs){
              		if(null==tidstr||tidstr.equals("")){
           			continue;
           		}
              	int tid=Integer.parseInt(tidstr);
              	if(null!=numstr&&!numstr.equals("")){
       	       	tea=service.findTeaById(tid);  	
              		num=Integer.parseInt(numstr);
              	}else{	
       	       	tea=service.findTeaSc(user.getUid(),tid);
       	       	num=tea.getNum();
              	}
              	nums=nums+"/"+num;
       	    ntids=tids.replace(tidstr, "/");
       	    sub=num*tea.getPrice();
              	sum+=sub;
       %>
        <tr>
        <td class="Product_info">
         <a href="detailed.jsp?tid=<%=tea.getTid() %>">
         <img src="<%=tea.getSrc() %>"  width="100px" height="100px"/></a>
         <a href="detailed.jsp?tid=<%=tea.getTid() %>" class="name" id="product">
         <%=tea.getTname() %>
         </a>
         </td>
        <td>￥   <%=format.format(tea.getPrice()) %></td>
        <td><%=num %></td>
        <td class="Moneys"> ￥    <%=format.format(sub) %></td>
        <td>
        <div class="delet" onclick="location.href='orders.jsp?tids=<%=ntids %>';"> 删&nbsp;&nbsp;除 </div>
        </td>
       </tr>
       <%
       	}
       %>
      </table>
      <div class="Pay_info">
       <label>订单留言(50以内)</label>
       <input name="note" type="text" onkeyup="checkLength(this);" class="text_name"/>    
      </div>
      <!--价格-->
       <input name="nums" class="hidd" value=<%=nums %> />
       <input name="sum" class="hidd" value=<%=format.format(sum) %> />
       <input name="tids" class="hidd" value=<%=tids %>/>
      <div class="price_style">
      <div class="right_direction">
        <ul>
         <li>商品总价 ￥ <%=format.format(sum) %></li>
        </ul>   
        <div class="btn">
        <input name="submit" type="submit" value="提交订单" class="submit_btn" />
		<a href="shopping_cart.jsp"><input type="button" value="返回购物车"  class="return_btn"/></a>
		</div>
      </div>
      </div>
     </div>  
  </div>
</div>
</form>
</div>
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
			</div>
			</div></li>
    <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
  </ul>
</div>
<script type="text/javascript">
function checkLength(which) {
	var maxChars = 50; //
	if(which.value.length > maxChars){
		alert("您输入的字数超多限制!");
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
}
</script>
<script>
$(function(){
	$(':input').labelauty();
});	
function setText(curr){
	var uInfo=curr.value.split("/");
	var uname=document.getElementsByName("uname")[0];
	var uphone=document.getElementsByName("uphone")[0];
	var uaddress=document.getElementsByName("uaddress")[0];
	var upostcode=document.getElementsByName("upostcode")[0];
	uname.value=uInfo[0];
	uphone.value=uInfo[1];
	uaddress.value=uInfo[2];
	upostcode.value=uInfo[3];	
}	
</script>
</body>
</html>
