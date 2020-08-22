<%@page import="com.iot.parkingAPI.parkingjsonVO"%>
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
			font-size: 15px;
			font-weight: bold;
			background-color: #2f5597;
			color: white;
			text-align: center;
			width: 15%;
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
	<%	/* pointVO point = (pointVO)request.getAttribute("mypoint"); */
	String user_id = (String)session.getAttribute("user_id");
	/* String parking_code = (String)request.getAttribute("parking_code"); */
	parkingjsonVO resvPInfo = (parkingjsonVO)request.getAttribute("parkingjsonVO");
	if(/* point == null || */ user_id ==null){
		System.out.println("point정보가 없거나 로그인 정보가 없다");
	%>
		잘못된 접근입니다. 관리자에게 문의하세요!
	<%
	}else{
	%>
	<!-- 전체 틀 -->
	<div class="outer">
			<!-- 예약 전체 틀 -->
		<div class="head" >
				<!-- 신청정보 테이블-->
			<div class="parkinfo" >
				<table class="table table-bordered" style="border: 1px solid;">
					<tr>
						<th>주차장 명</th>
						<td colspan="3"><%=resvPInfo.getParking_name()%></td>
					</tr>
					<tr>
						<th rowspan="6">운영시간</th>
						<th rowspan="2">평일</th>
						<th>오전</th>
						<td><%=resvPInfo.getWeekday_begin_time() %></td>
					</tr>
					<tr>
						<th>오후</th>
						<td><%=resvPInfo.getWeekday_end_time() %></td>
					</tr>
					<tr>
						<th rowspan="2">주말</th>
						<th>오전</th>
						<td><%=resvPInfo.getWeekend_begin_time()%></td>
					</tr>
					<tr>
						<th>오후</th>
						<td><%=resvPInfo.getWeekend_end_time()%></td>
					</tr>
					<tr>
						<th rowspan="2">공휴일</th>
						<th>오전</th>
						<td><%=resvPInfo.getHoliday_begin_time()%></td>
					</tr>
					<tr>
						<th>오후</th>
						<td><%=resvPInfo.getHoliday_end_time()%></td>
					</tr>
					<tr>
						<th colspan="4">[이용시 주의사항]</th>
					</tr>
					<tr>
						<td colspan="4">입,출차 시 1회만 적용</td>
						
					</tr>
					<tr>
						<th colspan="4">[이용방법]</th>
					
					</tr>
					<tr>
						<td colspan="4">기본요금 선 결제 후 출차 시 나머지 결제</td>
					</tr>
					<tr>
						<th colspan="4">[기타 안내사항]</th>
					</tr>
					<tr>
						<td colspan="4">현장상황에 따라 입차가 불가할 수 있습니다.</td>
					</tr>
					<tr>
						<td colspan="4">유의사항 미확인으로 인한 피해는 책임지지 않습니다.</td>
					</tr>
				</table>
			</div>
				<!-- 예약정보 테이블-->
				<div id="reserve" >
					<form action="/leggo/resvInsert.do" method="post">
					 	<input type="hidden" name="user_id" value="<%=user_id%>">
						<input type="hidden" name="parking_code" value="<%=resvPInfo.getParking_code()%>">
						<input type="hidden" name="license_plate" value="서울 가 2345">
						<input type="hidden" name="rv_code" value="0">
						<input type="hidden" name="rv_price" value="<%=resvPInfo.getRates()%>">
					<table class="table table-bordered" style="border: 1px solid;">
						<tr>
							<th>예약자 ID</th>
							<td><%=user_id %></td>
						</tr>
						<tr>
							<th>예약시간</th>
							<td>
								<input type="radio" value="0" name="rv_time"> 즉시&emsp;
								<input type="radio" value="15" name="rv_time"> 15분 후&emsp;
								<input type="radio" value="30" name="rv_time"> 30분 후&emsp;
								<input type="radio" value="45" name="rv_time"> 45분 후
							</td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td><%=(int)resvPInfo.getRates() %> 원(포인트)</td>
						</tr>
						<tr>
							<th colspan="2">[이용약관]</th>
						</tr>
						<tr>
							<td colspan="2">총칙 1. LEGGO 임직원은 성실합니다.</td>
							
						</tr>
						<tr>
							<td colspan="2" style="text-align: right;">
								<input type="reset" value="예약취소">
								<input type="submit" value="결제하기">
							</td>
						</tr>
					</table> 
					</form>
				</div>
		</div>
	</div>
	<%}%>
</body>
</html>