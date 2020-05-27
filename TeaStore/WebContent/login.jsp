<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<style>
.Forgetpass{font-size:17px;}
.login .btn_login{width:295.6px;}
.btn_login{}
.login-btn{}
</style>
<title>用户登录</title>
</head>
<body>
<!--顶部样式-->
<div class="common_top">
 <div class="Narrow">
  <div class=" left logo"><img src="images/logo.png" /></div>
  <!--电话图层-->
  <div class="phone"><label>全国服务热线：</label><em>400-345-5633</em></div>
 </div>
</div>
<div class="login_bg">
<div class="login Narrow">
   <div class="login_advertising"><img src="images/bg_03.png" /></div>
  <div class="login_frame">
   <form action="loginServlet" method="post" class="login-form" id="login" onsubmit="return checkUser()">
     <div class="login-name"><h1 class="name">用户登录</h1><span class="login_link"><a href="registered.jsp"><b></b>用户注册</a></span></div>
	  <!--提示信息-->
	    <div class="Prompt">   <b>  *  </b>   账 号 密 码 不 能 为 空 ! </div>
	    <div class="form clearfix">
	     <div class="item item-fore1">
	     <%
			Cookie[] cooks=request.getCookies();
	     	String username="";
	     	String password="";
	     	if(null!=cooks){
	     		for(Cookie cook:cooks){
	     			if(cook.getName().equals("UTNAME")){
	     				username=URLDecoder.decode(cook.getValue(), "UTF-8");
	     			}
	     			if(cook.getName().equals("UTPASS")){
	     				password=cook.getValue();
	     			}
	     		}
	     	}
	     	%>
	     <label for="loginname" class="login-label name-label"></label>
	     <input name="username" type="text"  class="text" placeholder=" 请 输 入 用 户 名 ！" value="<%=username %>"   />
		 </div>
		 <div class="item item-fore2">
		 <label for="nloginpwd" class="login-label pwd-label" ></label>
		 <input name="password" type="password" class="text" placeholder=" 用 户 密 码 ！" value="<%=password %>"   />
	     </div> 
	     <div class="Forgetpass">
	     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     	<input type="radio" name="role" value="1" checked="checked" />  会  员
	     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     	<input type="radio" name="role" value="0"/>  商   家<br/><br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     	&nbsp;&nbsp;&nbsp;
	     	<input type="checkbox" name="cook" value="0" checked="checked"/>  记 住 密 码
		</div>
	    </div>	
	    <div class="login-btn"><br/>
	    <input type="submit" class="btn_login" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录"/>
	  </div>
    </form>
  </div>
</div>
</div>
<!--底部样式-->
 <div class="bottom_footer">
   <p><a href="#">关于我们</a> | <a href="#">联系我们</a> | <a href="#">商家入驻</a> | <a href="#">法律申明</a> | <a href="#">友情链接</a>  </p>
	 <p>Copyright©2014四川金祥保险销售有限公司.All Rights Reserved. </p>
	 <p>川ICP备09150084号</p>
   </div>
   
   <script>
/*  -----  login   */
   	function checkUser(){
   	/*  ----  username      */ 
		var username=document.getElementsByName("username")[0];
   		if( username.value.length<4 || username.value.length>16 ){
   			alert("用户名错误！");
   			return false;
   		}
   	/*  ----  password      */	
		var password=document.getElementsByName("password")[0];	
   		if( password.value.length<6 || password.value.length>20 ){
   			alert("密码错误！");
   			return false;
   		}
   		return true;
   	}
   		
   </script>
</body>
</html>
