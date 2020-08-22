<%@page import="com.iot.parkingAPI.parkingInfoVO"%>
<%@page import="com.iot.reservation.resvVO"%>
<%@page import="java.util.List"%>
<%@page import="com.iot.parking.parkingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약조회 : LEGGO</title>
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
	</style>
</head>
<body id="myInfoBody">
<% List<resvVO> rlist = null;
if(request.getAttribute("resvlist")!=null){
	rlist = (List<resvVO>)request.getAttribute("resvlist");  
	List<parkingInfoVO> pinfolist = (List<parkingInfoVO>)request.getAttribute("pinfolist");  
%> 
	<div class="container" style="height: 100%; width: 100%;">
	<h2 style="margin-top: 0px;">예약정보</h2>
		<table class="table table-bordered" id="parking_list" style="border: 1px solid; text-align: center">
			<tr>
				<th>예약번호</th>
				<th>주차장 이름</th>
				<th>위치</th>
				<th>금액</th>
				<th>예약날짜</th>
				<th>이용시간</th>
			</tr>
			<% int listSize = rlist.size(); %>
			<%for(int i=listSize-1;i>=0;i--){ %>
				<tr>
					<td><%=rlist.get(i).getRv_id() %></td>
					<td><%=pinfolist.get(i).getPARKING_NAME() %></td>
					<td><%=pinfolist.get(i).getADDR() %></td>
					<td><%=(int)rlist.get(i).getRv_price() %></td>
					<td><%=rlist.get(i).getRv_date() %></td>
					<td><%=rlist.get(i).getRv_time() %></td>
				</tr>
			<%}%>
		</table>
	</div>
	<%}else{ %>
	<h1>예약 내역이 없습니다.</h1>
	<%} %>
</body>
</html>