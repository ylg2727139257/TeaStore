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
body{width:100%;}
</style>
<title>用户注册</title>
</head>
<body>
<!--顶部样式-->
<div class="common_top">
 <div class="Narrow">
  <div class=" left logo"><a href="#"><img src="images/logo.png" /></a></div>
  <!--电话图层-->
  <div class="phone"><label>全国服务热线：</label><em>400-345-5633</em></div>
 </div>
</div>
<!--用户注册样式-->
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
if(null==username){
	username="";
}
if(null==password){
	password="";
}
%>
<div class="registered_style Narrow clearfix">
   <div class="left_advertising">
    <img src="images/bg_03.png" />
   </div>
   <div class="right_register">
     <div class="register_Switching" id="register_Switching">
       <div class="hd">
        <ul><li> 用 户 注 册 </li></ul>
       </div>
       <div class="bd">
     <ul>
     <form action="registeredServlet" method="post" id="registered" name="form1" onsubmit="return checkUser();" > 
	   <div>
	   <div class="form clearfix"  id="form1"  >	
	    <div class="item"><label class="rgister-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</label>
	    	<input name="username" type="text"  class="text" placeholder=" 请 输 入 用 户 名  (4-16位)！" value="<%=username %>" /><b>*</b></div>
		<div class="item"><label class="rgister-label" >密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
			<input name="password" type="password"  class="text" placeholder=" 请 输 入 密 码 (6-20位) ！" value="<%=password %>" /><b>*</b></div> 
		<div class="item"><label class="rgister-label " >确认密码：</label>
			<input name="confirm" type="password"  class="text" placeholder=" 请 确 认 密 码 (再次输入密码)！" value="<%=password %>" /><b>*</b></div>
		<div class="item-ifo">
            <input type="checkbox" class="checkbox left" checked id="readme" />
            <label for="protocol" class="left">我已阅读并同意<a href="#" class="blue" id="protocol">《福际商城用户注册协议》</a></label>
        </div>
	  </div>	
	  <div class="rgister-btn">
	  <input type="submit" value="注&nbsp;&nbsp;&nbsp;&nbsp;册" class="btn_rgister"/>
	  </div>
	  <div class="Note"><span class="login_link">已是会员<a href="login.jsp">请登录</a></span></div>	  
	  </div>
	  </form>
     </ul>
       </div>
     </div>
     <script>jQuery(".register_Switching").slide({trigger:"click"});</script>
    </div>
</div>
<!--底部样式-->
 <div class="bottom_footer">
   <p><a href="#">关于我们</a> | <a href="#">联系我们</a> | <a href="#">商家入驻</a> | <a href="#">法律申明</a> | <a href="#">友情链接</a>  </p>
	 <p>Copyright©2014四川金祥保险销售有限公司.All Rights Reserved. </p>
	 <p>川ICP备09150084号</p>
 </div>

<script>
/*  -----  resgistered   */
   	var registered=document.getElementById("registered");
   	function checkUser(){
	/*  ----  username      */ 
		var username=document.getElementsByName("username")[0];
   		if( username.value.length<4 || username.value.length>16 ){
			alert(" 用 户 名 格 式 不 正 确 ！");
			return false;
		}
	/*  ----  password      */	
		var password=document.getElementsByName("password")[0];
   		if( password.value.length<6 || password.value.length>20 ){
			alert(" 密 码 格 式 不 正 确 ！ ");
			return false;
		}
	/*  ----  confirm      */
		var confirm=document.getElementsByName("confirm")[0];
   		if((confirm.value)!=(password.value)){
			alert(" 确 认 密 码 与 原 密 码 不 一  致  ！");
			return false;
		}
   	/*  ----  read      */
		var read=document.getElementById("readme");
   		if(!(read.checked)){
   			/* TODO ----  How do you user checked ?      */
   			alert(" 请 仔 细 阅 读 并 同 意《 福 际 商 城 用 户 注 册 协 议 》 ！");
   			return false;
   		} 
   		return true;
   	}



</script>
</body>
</html>
