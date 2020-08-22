<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="com.iot.member.memberVO"%>
<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="/leggo/css/top2.css">
<title>top</title>
</head>
<body>
<% memberVO user = (memberVO)session.getAttribute("user"); %>
   <div class="container-fluid">
   <div class="row">
         <!--맨 왼쪽 메뉴입니다 -->
        <div class="col-2" id="leftMenu">
        	<a href="/leggo/menu.do"><img src="/leggo/images/MainLogo.png" alt="Random Name" style="height: 70%; width: 100%; padding-left: 50px;">
	    	</a>
	    </div>
         <!--맨 오른쪽 메뉴 3개입니다 -->
         	<div class="col-10 align-right">
			    <% if(user != null){ %>
			    	<%= user.getUser_name() %>님!
			    	<a href="/leggo/logout.do">로그아웃</a> 
			    	<a href=""><img src="/leggo/images/news.png" id="rImg1" style="width:10%;"></a>
			    	<a href=""><img src="/leggo/images/personInfo.png" id="rImg2" style="width:10%;"></a>
			    	<a href=""><img src="/leggo/images/chat.png" id="rImg3" style="width:10%;"></a>
			    <% }else{%>
			    	로 그 인 을 안 하 고 사 용 하 시 겠 다 ?
			    <%}%>
      		</div>
		</div>
	</div>
   <div id="topBelow">
      &nbsp;
   </div>
</body>
</html>