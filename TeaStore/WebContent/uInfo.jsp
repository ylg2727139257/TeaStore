<%@page import="com.vo.Site"%> 
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
<link href="Threelinkage/linkage.css" rel="stylesheet"  type="text/css"/>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<style>
.logo{margin-left:5%;}
#uname{font-size:30px;color:orange;}

</style>
<title>用户管理</title>
</head>
<body>
<!--顶部样式-->
<%@	include file="no_login.jsp" %>
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
	   	User user=(User)obj;
	   	if(null==user){
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
 <div id="header">
  <div class="logo">
  <a><img src="images/logo.png" /></a>
  <div class="phone">
   免费咨询热线:<span class="telephone">400-3454-343</span>
  </div>
  </div>
</div>
<!--用户中心(地址管理界面)-->
<div class="user_style clearfix" id="user">
<div class="user_title"><em></em>用户中心</div>
 <div class="clearfix user" >
   <!--左侧菜单栏样式-->
     <div class="user_left">
	<div class="user_info">
       <div class="Head_portrait"><img src="images/people.png"  width="80px" height="80px"/><!--头像区域--></div>
       <a href="uInfo.jsp" id="uname"><%=user.getUname() %></a>
       </div>
       <ul class="Section">
       <li><a href="index.jsp"><em></em><span>首 页</span></a></li>
       <li><a href="shopping_cart.jsp"><em></em><span>购物车</span></a></li>
       <li><a href="login.jsp"><em></em><span>登 录</span></a></li>
       <li><a href="registered.jsp"><em></em><span>注 册</span></a></li>
      </ul>
       </div>
    <!--右侧内容样式-->
    <div class="right_style r_user_style">
      <div class="user_Borders">
       <div class="title_name">
        <span class="name">地址管理</span>
       </div>
       <div class="about_user_info">
         <form id="form1" name="form1" method="post" action="addressServlet">   
       <div class="user_layout">
         <ul>
          <li class="li"><label class="user_title_name">姓&nbsp;&nbsp;名：</label><input name="uname" type="text" class="add_text"/><i>*</i></li>
          <li class="li"><label class="user_title_name">电&nbsp;&nbsp;话：</label><input name="uphone" type="text" class="add_text"><i>*</i></li>
          <li class="li"><label class="user_title_name">地&nbsp;&nbsp;址：</label>
          <div class="select">
          <span class="select_adderss"><label> 省 份 </label><select id="province" name="sitepro"><option>==请选择</option></select></span>
          <span class="select_adderss"><label> 市/县 </label><select id="city" name="sitecity"><option>==请选择</option></select></span>
          <span class="select_adderss"><label> 区/县 </label><select id="district" name="sitedist" ><option>==请选择</option></select></span>
            <i>*</i>
		</div>   
          <input name="sitetext" type="text" class="add_text"></li>
          <li class="li"><label class="user_title_name">邮&nbsp;&nbsp;编：</label><input name="upostcode" type="text" class="add_text"><i>*</i></li>
         </ul>
         <div class="operating_btn"><input name="name" type="submit" value="确认" class="submit—btn"></div>
         </div>
          </form>       
       </div>
       <!--地址列表-->
       <div class="Address_List">
        <div class="title_name"><span class="name">用户地址列表</span></div>
        <div class="list">
         <table>
         <thead>
         <tr>
          <td class="list1">姓名</td>
          <td class="list1">电话</td>
          <td class="list1">地址</td>
          <td class="list1">邮编</td>
          <td class="list1">操作</td>
          </tr>
         </thead>        
        <%
        StoreService service=new StoreService();
        List<Site> sites=service.findSiteByUid(user.getUid());
        if(null==sites||sites.size()==0){
        	%>
    	<tr><td colspan="5">还 没 有 地 址 ， 去 添 加 ！</td></tr>
    	<%
    	}
        for(Site site:sites){
        	String[] str=site.getSite().split("/");
        	%>
          <tr><td><%=str[0] %></td><td><%=str[1] %></td><td><%=str[2] %></td><td><%=str[3] %></td><td><a href="#">修改</a><a href="#">删除</a></td></tr>
           
        	<%
        }
        %>
         </table>
        </div>
       </div>
      </div>
   </div>
 </div>
</div>
<div class="footerbox">
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
			</div>		</div></li>
    <li class="fixeBoxLi BackToTop"> <span class="fixeBoxSpan"></span> <strong>返回顶部</strong> </li>
  </ul>
</div>
</body>
<script>
			/*  */
			var datas = [
			        ["陕西省","610000"],
			        ["西安市","610100"],
			        ["咸阳市","610200"],
			        ["宝鸡市","610300"],
			        ["雁塔区","610101"],
			        ["新城区","610102"],
			        ["碑林区","610103"],
			        ["秦都区","610201"],
			        ["山西省","620000"],
			        ["太原市","620100"],
			        ["小店区","620101"],
			        ["运城市","620200"],
			        ["甘肃省","630000"],
			        ["河南省","640000"],
			        ["河北省","650000"]
			    ];
		    var province = document.getElementById("province");
		    var city = document.getElementById("city");
		    var district = document.getElementById("district");
		    for(var i=0;i<datas.length;i++){
		    	var code = datas[i][1];
		    	if(code.slice(0,2)!="00" && code.slice(2)=="0000"){
		    		province.innerHTML += "<option>"+datas[i][0]+"</option>";
		    	}
		    }
		    province.onchange = function(){
		    	city.innerHTML = "<option>==请选择</option>";
		    	district.innerHTML = "<option>==请选择</option>";
		    	var pCode = findCodeByName(this.value); 
		    	for(var i=0;i<datas.length;i++){
		    		var cCode = datas[i][1];
		    		if(cCode.slice(0,2)==pCode.slice(0,2)
		    			&& cCode.slice(2,4)!="00"
		    			&& cCode.slice(4)=="00"){
		    			city.innerHTML += "<option>"+datas[i][0]+"</option>";
		    		}
		    	}
		    }
		    city.onchange = function(){
		    	district.innerHTML = "<option>==请选择</option>";
		    	var cCode = findCodeByName(this.value);
		    	for(var i=0;i<datas.length;i++){
		    		var dCode = datas[i][1];
		    		if(dCode.slice(0,4)==cCode.slice(0,4)
		    			&& dCode.slice(4)!="00"){
		    			district.innerHTML += "<option>"+datas[i][0]+"</option>";
		    		}
		    	}
		    }
		    function findCodeByName(name){
		    	for(var i=0;i<datas.length;i++){
		    		if(datas[i][0]==name){
		    			return datas[i][1];
		    		}
		    	}
		    }
		</script>
		
</html>