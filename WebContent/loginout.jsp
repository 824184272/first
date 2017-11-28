<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>首页</title>
<script src="${basePath}/static/js/jQuery.js"></script>
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
.header .login {
    float: right ; 
    color: #fff ;
    line-height: 72px ;
    margin-right: 20px ;
}
.header ul li.first {
    margin-left: 30px ;
    background: #74b0e2 ;
}
.banner {
    height: 380px;
    background: #ccc;
    margin-top: 20px;
    position: relative;
    overflow: hidden;
}
.banner .content {
    width: 1060px;
    height: 450px;
    margin: 20px auto;
    position: relative;
}
.banner ul li img {
    width: 1024px ;
    height: 380px ;
}
.fl {float: left;}
.fr {float: right;}
.banner .content ul{
    width: 10000px;
    margin-left: -1024px;
}
.banner_left, .banner_right{
	width: 160px;
    height: 360px;
    display: inline-block;
    position: absolute;
    background: #7fa5ea;
    left: -160px;
    top: 0;
    opacity: 0.6;
}

.banner_right{
    width: 200px;
    height: 360px;
    display: inline-block;
    position: absolute;
    background: #7fa5ea;
    left: 1023px;
    top: 0;
    opacity: 0.6;
}

.btn_left ,.btn_right{
	display: inline-block;
	width: 21px;
	height: 150px;
	 background: url(${basePath}/static/img/banner_tb.png) no-repeat;
	position: absolute;
	left: 120px;
	top: 112px;
	opacity: 0;
	transition: all ease 0.6s;
	cursor: pointer;
}

.btn_right{
	background-position: -29px 0;
	position: absolute;
	left: 16px;
	top: 112px;
}

.banner .content:hover .btn_left{
	opacity: 1;
}

.banner .content:hover .btn_right{
	opacity: 1;
}

.banner .content ul{
    width: 10000px;
    margin-left: -1024px;
}
</style>
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
         <div class='login'>
    <c:choose>
        <c:when  test="${empty sessionScope.username}">
            <span><a href="login.jsp">登陆</a></span>  
            <span>|</span>
            <span><a href="javascript:void(0)">注册</a></span>
        </c:when>
        <c:otherwise>
            <span><a href="javascript:void(0)">欢迎您，${sessionScope.username}</a></span>  
            <span> | </span>
            <span><a href="javascript:void(0)">登出</a></span>
        </c:otherwise>
    </c:choose>
</div>
    </div>
    <div class='banner'>
        <div class='content'>
           <ul>
            <li class='fl'>
                <a href="javascript:void(0)"><img src="static/img/5.png "/></a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)"><img src="static/img/1.png "/></a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)"><img src="static/img/2.png "/></a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)"><img src="static/img/3.png "/></a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)"><img src="static/img/4.png "/></a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)"><img src="static/img/5.png "/></a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)"><img src="static/img/1.png "/></a>
            </li>
        </ul>
        <!-- 按钮区 -->
		<span class='banner_left'><i class='btn_left'></i></span>
		<span class='banner_right'><i class='btn_right'></i></span>
        </div>
   </div>
   <script>
    var leftBtn = $('.btn_left').eq(0); //左按钮
	var rightBtn = $('.btn_right').eq(0);//右按钮
	
	var ul = $('.banner .content ul').eq(0); 
	
	var index = 0;
	var timer = null; 
	
	var imgwidth = $('.banner .content ul li').width(); //获取轮播图片的宽度
	var len =  $('.banner .content ul li').length - 2//获取总共的图片数量
	
	//下一张
	rightBtn.on('click',function(){
		clearTimeout(timer); //定时器清零
		timer = setTimeout(function(){
			index ++;
			movePicture();
		},500);
		
	});
	
	//上一张
	leftBtn.on('click',function(){
		clearTimeout(timer); //定时器清零
		timer = setTimeout(function(){
			index --;
			movePicture();
		},500);
	});
			
	//移动图片
	function movePicture(){
		$('.banner .content ul').animate({'margin-left':-imgwidth * (index+1)},1000,function(){
			if(index == len){
				$(this).css('margin-left',-imgwidth);
				index = 0;
			}
			if(index == -1){
				$(this).css('margin-left',-imgwidth * len);
				index = len - 1;
			}
		});
	}
   </script>
</body>
</html>