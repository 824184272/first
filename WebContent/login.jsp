<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    int port = request.getServerPort();
    String basePath  = null;
    if(port==80){
        basePath = request.getScheme()+"://"+request.getServerName()+path;
    }else{
        basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    }
    request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
*{
    padding: 0 ;
    margin: 0 ;
    font-family: "微软雅黑" ;
}
.header {
    height: 72px ;
    background: #458fce ;
}
.header .logo {
    color: #fff ;
    line-height: 72px ;
    font-size: 30px ;
    margin-left: 20px ;
    display:inline-block ;
    font-weight:500 ;
    float: left ;
}
 ul li {
    list-style: none;
}
.header ul li {
    float: left ;
    display: inline-block;
    line-height: 72px ;
}
.header ul li.first {
    margin-left: 30px ;
}
.header ul li {
    float: left ;
    color: #fff ;
    display: inline-block ;
    width: 112px ;
    height: 72px ; 
    text-align: center ;
    line-height:72px ;
    cursor: pointer ;
}
a {
    color: #fff ;
    text-decoration: none ;
}
.header ul li:hover {
    background:#74b0e2 ;
}
.header ul li.first {
    margin-left: 30px ;
    background: #74b0e2 ;
}
body {
	background:#96b6d2;
	overflow:hidden;
}
.content {
	width: 368px;
    height: 396px;
    margin: 60px 400px auto auto ;
    background: #bfcbd8;
    background: rgba(84, 144, 218, 0.35);
    border-radius: 6px;
}
.content .logo {
	text-align: center;
	line-height: 90px; 
	color: #fff;
	font-size:30px;
	position: relative;
   	top: 26px;
}
.content .inputBox {
	height: 30px;
   	opacity: 0.6;
}
.content .inputBox input{
	width: 280px;
    height: 50px;
    padding-left: 16px;
    line-height: 38px;
    font-size: 22px;
    background: #e2e9f9;
    color: #464242;
    border: none;
    border-radius: 2px;
}
.content .login_btn{
    width: 88%;
    height: 46px;
    font-size: 20px;
    text-align: center;
    color: #fff;
    font-family: 微软雅黑;
    background: #458fce;
    border-radius: 3px;
    border: none;
    cursor: pointer;
}
.content .login_btn:hover {
	 background: #3499da;
}
.show {
	width:600px;
	height:400px;
	position:absolute;
	left:100px;
	top:60px;
}
.mt50 {margin-top: 50px}
.ml32 {margin-left: 32px}
</style>
<script src="static/js/jQuery.js"></script>
</head>
<body>
 <div class="header">
       <div class='logo'>原创文字</div>
         <ul>
          <li class='first'><a href="javascript:void(0)">首页</a></li>
          <li><a href="javascript:void(0)">原创故事</a></li>
          <li><a href="javascript:void(0)">热门专题</a></li>
          <li><a href="javascript:void(0)">欣赏美文</a></li>
          <li><a href="javascript:void(0)">赞助</a></li>
        </ul>
</div>
<div class='show'>
		<img src="static/img/msg.png "/>
</div>
<!-- 登陆框 -->
	<div class='content'>
		<div class='logo'>用户登录</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="username"  maxlength="60" placeholder="请输入账号/邮箱/手机号">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="password" id="password" maxlength="60" placeholder="请输入密码">
		</div>
		
		<div class='mt50 ml32'>
			<button class="login_btn" onclick="login()">登陆</button>
		</div>
	</div>
	<script>
		function login(){
			var username = $('#username').val();
	    	var password = $('#password').val(); 
			$.ajax({
	        	type:"post",//请求方式
	        	url:"LoginServlet",//请求地址
	        	data:{"username":username,"password":password},//传递给controller的json数据
	        	error:function(){//如果出错了，将事件重新绑定
					alert("登陆出错！");
				},
				success:function(data){ //返回成功执行回调函数。
					if(data==1){
						alert("登录成功");
						window.location.href = 'index.jsp';
					}
					else{
						alert("登陆失败");
						window.location.href = 'loginfaiure.jsp';
					}
				}
	    	});
	    }
	</script>
</body>
</html>