<%@page import="com.iot.point.pointVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>포인트 : LEGGO</title>
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
<% List<pointVO> plist = null;
if((request.getAttribute("plist")!=null)&&(pointVO)request.getAttribute("userpoint")!=null){
	plist = (List<pointVO>)request.getAttribute("plist");
	pointVO userpoint = (pointVO)request.getAttribute("userpoint");
%>
	<div class="container" style="height: 100%; width: 100%;">
	<h2 style="margin-top: 0px;">포인트</h2>
	<div class="field">
		<table class="table table-bordered" id="myPoint" style="border: 1px solid; text-align: center">
			<tr>
				<th>보유 포인트</th>
				<th>만료일자</th>
				<th>회원등급</th>
				<th>충전/선물</th>
			</tr>
			<tr>
				<td><%=userpoint.getPointAvail() %></td>
				<td><%=userpoint.getPointExpDate() %></td>
				<td><%=userpoint.getUserGrade() %></td>
				<td>
					<form action="/leggo/point/totalPoint.do" method="post" target="_blank" style="margin-bottom: 0px;">
						<input type="hidden" name="user_id" value="<%=userpoint.getUser_id() %>">
						<input type="hidden" name="userGrade" value="<%=userpoint.getUserGrade() %>">
						<input type="hidden" name="pointAvail" value="<%=userpoint.getPointAvail() %>">
						<input type="submit" value="충전">
					<a href="##"><button>선물</button></a>
					</form>
				</td>
			</tr>
		</table>
	</div>
		<table class="table table-bordered" id="parking_list" style="border: 1px solid; text-align: center">
			<tr>
				<th>번호</th>
				<th>잔여 포인트</th>
				<th>변동 포인트</th>
				<th>발생일</th>
				<th>만료일자</th>
				<th>회원등급</th>
			</tr>
			<% int listSize = plist.size(); %>
			<%for(int i=listSize-1;i>=0;i--){ %>
				<tr>
					<td><%=i+1 %></td>
					<td><%=plist.get(i).getPointAvail() %></td>
					<td><%=plist.get(i).getPointChange() %></td>
					<td><%=plist.get(i).getPointDate() %></td>
					<td><%=plist.get(i).getPointExpDate() %></td>
					<td><%=plist.get(i).getUserGrade() %></td>
				</tr>
			<%}%>
		</table>
	</div>
	<%}else{ %>
	<h2>포인트 이용내역이 없습니다.</h2>
	<%} %>
	<!-- <script type="text/javascript">
		$(document).ready(function() {
			/* 팝업창 종료시점 감지하기 */
			var g_oWindow = null;
			var g_oInterval = null;
			var popup = function() {
			    g_oWindow = window.open('http://localhost:8088/leggo/point/totalPoint.do', '포인트 충전 : LEGGO');
			    g_oInterval = window.setInterval(function() {
			        try {
			            if( g_oWindow == null || g_oWindow.closed ) {
			                window.clearInterval(g_oInterval);
			                g_oWindow = null;
			                alert('창 close');
			            }
			        } catch (e) { }
			    }, 500);
			};
			popup()
		})
	</script> -->
</body>
</html>