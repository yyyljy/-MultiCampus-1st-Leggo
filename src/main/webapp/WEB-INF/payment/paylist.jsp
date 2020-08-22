<%@page import="com.iot.parkingAPI.parkingInfoVO"%>
<%@page import="com.iot.parkingAPI.parkingjsonVO"%>
<%@page import="com.iot.pay.payVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제내역 : LEGGO</title>
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
<%List<payVO> paylist = (List<payVO>)request.getAttribute("paylist");%>
<%-- <%List<parkingInfoVO> pinfolist = (List<parkingInfoVO>)request.getAttribute("pinfolist");  %> --%>
	<div class="container" style="height: 100%; width: 100%;">
	<h2>결제정보</h2>
		<table class="table table-bordered" id="parking_list" style="border: 1px solid; text-align: center">
			<tr>
				<th>번호</th>
				<th>주차장이름</th>
				<th>결제날짜</th>
				<th>사용포인트</th>
			</tr> 
				<%for(int i=paylist.size()-1;i>=0;i--){ 
					payVO list = paylist.get(i);
					
					if(paylist!=null){%>
				<tr>
					<td><%=list.getPm_num() %></td>
					<td><%=list.getPm_method_code() %></td>
					<td><%=list.getPm_date() %></td>
					<td><%=list.getUse_point()%></td>
				</tr>
				<%}else{ %>
				<h2>결제 내역이 없습니다.</h2>
				<%}} %>
		</table>
		
	</div>
</body>
</html>