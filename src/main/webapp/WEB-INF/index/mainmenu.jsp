<%@page import="com.iot.member.memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/leggo/css/mainmenu.css">
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Menu Page</title>
</head>
<body>
<%	memberVO user;
	if(session.getAttribute("user")!=null){
		user = (memberVO)session.getAttribute("user");
	}else{
		user=null;
	}
%>
 	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1">
 				<div id="myNav" class="overlay">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<div class="overlay-content">
						<%if(user!=null){ %>
						<a href="/leggo/logout.do" id="logoutBtn" >로그아웃</a>
						<%}else{ %>
						<a href="/leggo/login.do">로그인</a>
						<%} %> 
						<a href="/leggo/profile.do">회사소개</a>
						<a href="/leggo/news.do">뉴스</a>
						<%if(user!=null){ %>
						<a href="/leggo/myInfo.do">회원정보</a>
						<%} %>
						<a href="/leggo/inbox.do">쪽지함</a>
					</div>
				</div>
				<span style=" cursor: pointer" onclick="openNav()">
					<img id="openBtn" src="/leggo/images/header-logo.png">
				</span>
				<script>
					function openNav() {
						document.getElementById("myNav").style.width = "100%";
					}
					function closeNav() {
						document.getElementById("myNav").style.width = "0%";
					}
				</script>

			</div>
			<div class="col-sm-11">
				<div id="secondLogo">
					<a href="/leggo/menu.do"> <img
						src="/leggo/images/MainLogo.png" width=10% height=10%>
					</a>
				</div>
			</div>
		</div>
		<div id="content2">
			<div class="menuBtn">
				<a
					href="/leggo/navi.do">
					<img src="/leggo/images/Picture5.png" alt="location"
					class="menuImg">
				</a>
			</div>
			<div class="menuBtn">
				<a
					href="/leggo/parking.do">
					<img src="/leggo/images/Picture2.png" alt="parking"
					class="menuImg">
				</a>
			</div>
			<div class="menuBtn">
				<a href="/leggo/lastmile.do"> <img
					src="/leggo/images/Picture3.png" alt="lastMile" class="menuImg">
				</a>
			</div>
			<div class="menuBtn">
				<a href="/leggo/freeboardmain.do">
					<img src="/leggo/images/Picture4.png" alt="community"
					class="menuImg">
				</a>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6" id="left">
					<a href="http://localhost:8088/leggo/index.do"> <img
						src="/leggo/images/left.png" alt="leftNext" id="leftNext">
					</a>

				</div>
				<div class="col-md-6" id="right">
					<a href="https://www.youtube.com"> <img
						src="/leggo/images/right.png" alt="rightNext" id="rightNext">
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	Kakao.init('058c8dd884377b38875fd39e9587e919');
	$("#logoutBtn").on("click", function() {
		Kakao.Auth.logout()
	})
})
</script>
</html>