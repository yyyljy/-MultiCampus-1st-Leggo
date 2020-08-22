<%@page import="com.iot.point.pointVO"%>
<%@page import="com.iot.member.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="width: 500px;height: 500px;">
<head>
<meta charset="UTF-8">
<title>포인트 충전 : LEGGO</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body class="main_frame" style="background-color: #02aab0;">
<% pointVO point = (pointVO)request.getAttribute("point"); %>
	<h2 style="margin-top: 0px; color: white;">포인트 충전</h2>
	<form class="table table-bordered" action="/leggo/point/chargePoint.do" method="post" style="border: 1px solid; text-align: center">
		<div class="field">
			<input type="text" name="id" disabled="disabled" value="<%=point.getUser_id() %>">
			<input type="hidden" name="user_id" value="<%=point.getUser_id() %>">
		</div>
		<div class="field">
			<input type="text" name="point" disabled="disabled" value="<%=point.getPointAvail() %>">
			<input type="hidden" name="pointAvail" value="<%=point.getPointAvail() %>">
		</div>
		<div class="field">
			<input type="number" name="pointChange" placeholder="충전 금액">
		</div>
		<div class="field">
			<input type="text" name="grade" disabled="disabled" value="<%=point.getUserGrade() %>">
			<input type="hidden" name="userGrade" value="<%=point.getUserGrade() %>">
		</div>
		<div class="field">
			<input type="submit" id="submitBtn">
		</div>
	</form>
</body>
<!-- <script type="text/javascript">
$(document).ready(function(){
	$("#submitBtn").on("click",function(){
		self.close();
	})
})
</script> -->
</html>