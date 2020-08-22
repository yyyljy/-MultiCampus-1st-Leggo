<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Leggo</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="/leggo/css/main_jw.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <!-- 지우니까 jw css 먹힘 -->
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
	<!-- 카카오맵 -->
	<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be626cc1f959d4787a1d8381c33922e7&libraries=services,clusterer,drawing">
	</script>
	<style type="text/css">
		body {
			font-family: 배달의민족 한나는 열한살;				
			/* background: #02AAB0;   */
			/* background: -webkit-linear-gradient(to top, #00CDAC, #02AAB0);  */
			background: linear-gradient(to top, #ede574, #e1f5c4); 
			background-repeat: no-repeat;
			background-size: cover;  
			/* background-color: red; */    
			}
	</style>
</head>
<body>
	<div class="container" id="navi">
		<div class="row">	
			<div class="col-md-12">
				<!-- TOP -->
				<tiles:insertAttribute name="top"></tiles:insertAttribute>
			</div>
			<div class="col-md-3">
				<!-- MENU -->
				<tiles:insertAttribute name="menu"></tiles:insertAttribute>
			</div>
			<div class="col-md-9">
				<!-- CONTENT -->
				<tiles:insertAttribute name="content"></tiles:insertAttribute>
			</div>
		</div>
	</div>
</body>

<!-- Scripts -->
<script src="/leggo/js/jquery.min.js"></script>
<script src="/leggo/js/browser.min.js"></script>
<script src="/leggo/js/breakpoints.min.js"></script>
<script src="/leggo/js/main.js"></script>
</html>