<%-- <%@page import="com.iot.point.pointVO"%>
<%@page import="com.iot.member.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약하기 : LEGGO</title>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style type="text/css">
		table {
			width: 100%;
			background-color: white;
			color : black;
		}
		h2 {
			margin-top: 0px;
			color: white;
		}
	</style>
</head>
<body class="main_frame" style="background-color: #02aab0;">
<%	pointVO point = (pointVO)request.getAttribute("mypoint");
	String user_id = (String)session.getAttribute("user_id");
	String parking_code = (String)request.getAttribute("parking_code");
	if(point == null && user_id ==null){
		System.out.println("둘다 널값");
%>	로그인하고 오세요~
<%
	}else{
%>
	<form action="/leggo/resvInsert.do" method="post" style="border: 1px solid; text-align: center">
		<div class="field">
 			<input type="text" name="id" disabled="disabled" value="<%=user_id %>">
			<input type="hidden" name="user_id" value="<%=user_id %>">
		</div>
		<div class="field">
			<input type="text" name="point" disabled="disabled" value="<%=point.getPointAvail() %>">
			<input type="hidden" name="pointAvail" value="<%=point.getPointAvail() %>">
			<input type="text" name="license_plate" placeholder="차 번호">
		</div>
		<div class="field">
			<input type="number" name="rv_price" placeholder="예약금액">
		</div>
		<div class="field">
			<input type="hidden" name="parking_code" value="<%=parking_code %>">
		</div>
		<!-- <div class="field">
			<input type="text" name="rv_time" placeholder="예약시간">
		</div> -->
		<div class="field">
			<input type="submit" id="submitBtn">
		</div>
	</form>
<%}%>
</body>
</html>  --%>
<%@page import="com.iot.point.pointVO"%>
<%@page import="com.iot.member.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약하기 : LEGGO</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style type="text/css">
		th{
			font-size: 20px;
			font-weight: bold;
			background-color: #2f5597;
			color: white;
			text-align: center;
		}
		table {
			width: 100%;
			background-color: white;
			color : black;
		}
		h2 {
			margin-top: 0px;
			color: white;
		}
		.even{
			background-color: #d6dad6;
		}
		.paybtn {
		background-color: #2f5597;
		font-family: 배달의민족 한나는 열한살;
		border-radius: 20px;
		color: white;
		padding: 10px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 20px;
		margin: 4px 30px;
		cursor: pointer;
		padding: 10px 40px 10px 40px;
	</style>
</head>
<body>
	<h2 style="margin-top: 0px;">주차장 예약</h2>
	<%	pointVO point = (pointVO)request.getAttribute("mypoint");
	String user_id = (String)session.getAttribute("user_id");
	String parking_code = (String)request.getAttribute("parking_code");
	if(point == null && user_id ==null){
		System.out.println("둘다 널값");
%>	로그인하고 오세요~
<%
	}else{
%>
	<div >
		<form action="/leggo/resvInsert.do" method="post">
		<div id="myInfoBody" style="margin:auto">
			<div id="page-content">
				<div class="text-center">
					<div class="auth-form-wrap" style="top: 45%">
						<br>
						<table class="table table-bordered" id="parkinsg_list" style="border: 1px solid; text-align: center;">
							<tr>
								<th colspan='3'>예약하기</th>
							</tr>
							<tr class="even">
								<td>이용자 아이디</td>
								<td colspan='2'><input type="text" name="id" disabled="disabled" value="<%=user_id %>"></td>
								
							</tr>
							<tr>
								<td>자동차 번호</td>
								<td colspan='2'><input type="text" name="license_plate" placeholder="차 번호를 입력하세요"></td>
							</tr>
							<tr class="even">
								<td>보유포인트</td>
								<% if(point != null) {%>
								<td colspan='2'><input type="text" name="point" disabled="disabled" value="<%=point.getPointAvail() %>"></td>
								<%} %>
							</tr>
							<tr>
								<td>이용 금액</td>
								<td colspan='2'><input type="number" name="rv_price" placeholder="예약금액"></td>
							</tr>
						</table>
						<input type="submit" class="paybtn" id="submitBtn" value="결제페이지로">
					</div>
					<input type="hidden" name="user_id" value="<%=user_id %>">
					<% if(point != null) {%>
					<input type="hidden" name="pointAvail" value="<%=point.getPointAvail()%>">
					<% } %>
					<input type="hidden" name="parking_code" value="<%=parking_code%>">
				</div>
			</div>
		</div>
		</form>
		<%}%>
	</div>
</body>
</html>
