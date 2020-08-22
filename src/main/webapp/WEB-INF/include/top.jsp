<%@page import="com.iot.member.kakaoVO"%>
<%@page import="com.iot.member.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
	<title>LEGGO</title>
	<style type="text/css">
	#topSize{
			height:100%;
			padding-top:20px;
			/* background-color: #365da2; */
		
		}
		#topRight{
			padding-top:20px;
			padding-bottom:-20px;
			text-align: right;
			font-family: 배달의민족 한나는 열한살;
			font-size: 20px;
			/* background-color: yellow;  */
			display: inline;
			
		}
		#topMiddle{
			/* background-color: orange; */
			padding-bottom:-20px;
		}
		#topLeft{
			padding-top:20px;
			text-align:right;
			 /* background-color: blue ; */
			 margin-bottom:-20px;
		}
		.username{
			display: inline;
		}
		.imgClass{
			width: 60px;
		}
		.imgClassLogo{
			width: 100px;
		}
		#line{
			width: 100%;
			height: 40%;
			/* background-color: red; */
			margin-bottom: -50px;
			margin-top: -50px;
		}
		
	
	</style>
</head>
<body>
	<%
	memberVO user = null;
	if(session.getAttribute("user")!=null){
		user = (memberVO)session.getAttribute("user");%>
	<div class="top-container">
	<!-- <div class="container-fluid"> -->
	  <div class="row" id="topSize">
	    <!--맨 왼쪽 메뉴입니다 -->
	    <div class="col-2" id="topLeft" >
	    	<a href="/leggo/menu.do"><img src="/leggo/images/MainLogo.png" class="imgClassLogo">
	    </a></div>
	    <!--맨 오른쪽 메뉴 3개입니다 -->
	    <div class="col-4" id="topMiddle" style="padding-top: 30px;">
	   
	    </div>
	    <div class="col-6 " id="topRight" ">
	     	<% if(user.getPass() != null){ %><!-- 일반 회원 로그인 -->
	    	<%= user.getUser_name() %>님!
	    	<a href="/leggo/logout.do"class="imgClass">로그아웃</a>
	    	<a href="/leggo/news.do"><img src="/leggo/images/news1.png" class="imgClass"></a>
	    	<a href="/leggo/myInfo.do"><img src="/leggo/images/personInfo.png" class="imgClass"></a>
	    	<a href="#"><img src="/leggo/images/chat.png" class="imgClass"></a>
	    <% }else if(user.getUser_name() != null){ %>
	    		<img src="<%= user.getPass_ans() %>" style="border-radius: 50%;width: 75px;height: 75px;">
	    	<%= user.getUser_name() %>님!
	    	    	<a href="http://developers.kakao.com/logout"class="imgClass">로그아웃</a> 
	    	    	<a href=""><img src="/leggo/images/news1.png" class="imgClass"></a>
	    	    	<a href=""><img src="/leggo/images/personInfo.png" class="imgClass"></a>
	    	    	<a href=""><img src="/leggo/images/chat.png" class="imgClass"></a>
	    <% }else{ %>
	    	로 그 인 을 안 하 고 사 용 하 시 겠 다 ?
	    <%}%>
	<%}%>
	    </div>
	    <span><br/><img id="line" src="/leggo/images/line2.png"></span>
	  </div>
	</div>
</body>
</html>