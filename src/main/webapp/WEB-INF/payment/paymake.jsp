<%@page import="com.iot.reservation.resvVO"%>
<%@page import="com.iot.parkingAPI.parkingjsonVO"%>
<%@page import="java.util.List"%>
<%@page import="com.iot.point.pointVO"%>
<%@page import="com.iot.pay.payVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제하기 : LEGGO</title>
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
	<h2>결제하기</h2>
	<%pointVO point = (pointVO)request.getAttribute("mypoint");%>
	<%parkingjsonVO paypoint = (parkingjsonVO)session.getAttribute("resvPInfo");%>
	<%resvVO resv = (resvVO)request.getAttribute("resv");%>
	<div >
		<form method="post" action="/leggo/pay.do">
		<div id="myInfoBody" style="margin:auto">
			<div id="page-content">
				<div class="text-center">
					<div class="auth-form-wrap" style="top: 45%">
						<br>
						<table class="table table-bordered" id="parkinsg_list" style="border: 1px solid; text-align: center;">
							<tr>
								<th colspan='3'>주차장 결제</th>
							</tr>
							<tr class="even">
								<td>주차장 이름</td>
								<td colspan='2'><input type="text" id="park_id" disabled="disabled" value="<%=paypoint.getParking_name()%>"/></td>
							</tr>
						 	<tr>
								<td>예약시간</td>
								<td colspan='2'><input type="text" id="resv_time" disabled="disabled" value="결제 완료 시점에서 <%=resv.getRv_time()%> 분 후"/></td>
							</tr> 
							<tr class="even">
								<td>보유포인트</td>
								<td colspan='2'><input type="text" id="availpoint" disabled="disabled" value="<%=point.getPointAvail()%>"/></td>
							</tr>
							<tr>
								<td>이용 요금</td>
								<td colspan='2'><input type="text" id="paypoint" disabled="disabled" value="<%=(int)paypoint.getRates()%> 원(포인트)"/></td>
							</tr>
							<tr class="even">
								<td>잔여 포인트</td><!-- 잔여포인트가 마이너스이면 충전 페이지로 넘어가기 -->
								 <%double val = point.getPointAvail() - (double)paypoint.getRates();%>
								<td colspan='2'><%if(val>=0){%><input type="text" id="leftpoint" value="<%=(int)val%>"><%}
												else{%>
												<script type="text/javascript">alert("충전을 해주세요.");
														document.location.href="point/chargePoint.do";
														</script><%}%></td>
							</tr>
						</table><!-- 잔여포인트가 부족하면 결제실패라는 메세지 띄우기 -->
							<%if(val>0){ %><input type="submit" class="paybtn"	value="결제하기"><%}
							else{ %><script type="text/javascript">
								alert("충전을 해주세요.");
								document.location.href="point/chargePoint.do";
								</script> <%}%>
						<input type="submit" class="paybtn" value="결제취소" onclick="window.location.href='http://localhost:8088/leggo/navi.do'">
					</div>
					<input type="hidden" name="rv_id" value="<%=resv.getRv_id() %>"/>
					<input type="hidden" name="user_id" value="<%=point.getUser_id()%>"/>
					<input type="hidden" name="rv_id" value="<%=resv.getRv_id() %>"/>
					<input type="hidden" name="pm_confirm" value="0"/>
					<input type="hidden" name="pm_method_code" value="<%=paypoint.getParking_name()%>"/>
					<input type="hidden" name="pm_price_plus" value="0"/>
					<input type="hidden" name="pm_price" value="<%=(int)resv.getRv_price()%>"/>
					<input type="hidden" name="use_point" value="<%=(int)paypoint.getRates()%>"/>
					<input type="hidden" name="discount" value="0"/>
					<input type="hidden" name="card_grant_num" value="10"/>
					<input type="hidden" name="pointChange" value="<%=point.getPointChange()%>"/>
					<input type="hidden" name="userGrade" value="<%=point.getUserGrade()%>"/>
				</div>
<%-- pm_num_seq.nextval,
	#{rv_id},
	#{user_id},
	#{pm_method_code},
	#{pm_price},
	sysdate,
	#{pm_price_plus},
	#{use_point},
	#{discount},
	#{card_grant_num},
	#{pm_confirm} --%>
			</div>
		</div>
		</form>
	</div>
</body>
</html>