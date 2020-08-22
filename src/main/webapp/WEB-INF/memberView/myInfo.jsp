<%@page import="com.iot.member.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 : LEGGO</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#accnthead {
	font-size: 20px;
	font-weight: bold;
	background-color: #2f5597;
	color: white;
	text-align: center;
	width: 10%;
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
.ans {
	width: 40%;
}
.q {
	width: 10%;
}
</style>
</head>
<body id="myInfoBody">
	<%memberVO user = null;%>
	<%
	if(session.getAttribute("user")!=null){
		user = (memberVO) session.getAttribute("user");
	%>
	<%if(user.getPass()!=null){ %>
	<div class="container" style="height: 100%; width: 100%;">
		<h2>회원정보</h2>
		<form name="sign_up" action="/leggo/modifyMyInfo.do" method="post"
			class="auth-form">
			<table class="table table-bordered">
				<tr>
					<td id="accnthead" rowspan="7"><br/><br/><br/><br/>내정보</td>
					<td class="q">아이디:</td>
					<td class="ans"><input type="text" id="user_id" name="user_id"
						disabled="disabled" value="<%=user.getUser_id()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">비밀번호:</td>
					<td class="ans"><input type="password" id="pass" name="pass"
						disabled="disabled" value="<%=user.getPass()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">질문:</td>
					<td class="ans"><input type="text" id="pass_hint"
						name="pass_hint" required="required"
						value="<%=user.getPass_hint()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">답변:</td>
					<td class="ans"><input type="text" id="pass_ans"
						name="pass_ans" required="required"
						value="<%=user.getPass_ans()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">이름:</td>
					<td class="ans"><input type="text" id="user_name"
						name="user_name" disabled="disabled"
						value="<%=user.getUser_name()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">생년월일:</td>
					<td class="ans"><input type="text" id="birth" name="birth"
						disabled="disabled" value="<%=user.getBirth()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">성별:</td>
					<td class="ans">
						<%if (user.getGender().equals("M")) {%>
							<option value="M" selected="selected">남자</option>
						<%} else {%>
							<option value="F" selected="selected">여자</option>
						<%}%>
					</td>
				</tr>
				<tr>
					<td id="accnthead" rowspan="4"><br /> <br />내 연락처</td>
					<td class="q">집 전화번호:</td>
					<td class="ans"><input type="text" id="tel" name="tel"
						value="<%=user.getTel()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">휴대폰 번호:</td>
					<td class="ans"><input type="tel" id="mobile" name="mobile"
						required="required" value="<%=user.getMobile()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">이메일</td>
					<td class="ans"><input type="text" id="email" name="email"
						required="required" value="<%=user.getEmail()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">수신 여부
					</td>
					<td class="ans">
						<%if (user.getRecv_email().equals("Y")) {%>
						이메일 : 
						 <input type="radio" name="recv_email" value="Y" checked="checked" /> 수신
						 <input type="radio" name="recv_email" value="N" /> 비수신
						<%} else {%>
						이메일 :
						 <input type="radio" name="recv_email" value="Y" /> 수신 <input
						type="radio" name="recv_email" value="N" checked="checked" /> 비수신
						<%}%><br/>
						<%if (user.getRecv_text().equals("Y")) {%>
						문자  :
						 <input type="radio" name="recv_text" value="Y" checked="checked" /> 수신
						 <input type="radio" name="recv_text" value="N" /> 비수신
						<%} else {%>
						문자  :
						 <input type="radio" name="recv_text" value="Y" /> 수신
						 <input	type="radio" name="recv_text" value="N" checked="checked" /> 비수신
						<%}%>
					</td>
				</tr>
				<tr>
					<td id="accnthead" rowspan="3"><br />주소</td>
					<td class="q">우편번호 찾기:</td>
					<td class="ans">
						<button type="button" class="blue-btn half-width mb15"
							onclick="execDaumPostcode()">우편번호 찾기</button>
					</td>
				</tr>
				<tr>
					<td class="q">주소:</td>
					<td class="ans"><input type="text" id="addr" name="addr"
						value="<%=user.getAddr()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">우편번호:</td>
					<td class="ans">
						<input type="text" id="postcode"
						name="postcode" value="<%=user.getPostcode()%>"/>
					</td>
				</tr>
				</tbody>
			</table>
			<div style="text-align: right;">
				<a href="/leggo/withdrawal.do" style="font-size: 0.5em; margin-right: 25px;">탈퇴하기</a>
				<input type="submit" id="submitBtn" value="수정하기">
			</div>
		</form>
	</div>
	<%}else{ %>
	<div class="container" style="height: 70%; width: 100%;">
		<h2>회원정보</h2>
		<form name="sign_up" action="/leggo/modifyMyInfo.do" method="post"
			class="auth-form">
			<h2>KAKAO 로그인으로 접속하셨습니다.</h2>
			<table class="table table-bordered">
				<tr>
					<td id="accnthead" rowspan="7"><br/><br/>내정보<br/><br/></td>
					<td class="q">아이디:</td>
					<td class="ans"><input type="text" id="user_id" name="user_id"
						disabled="disabled" value="<%=user.getUser_id()%>"/>
					</td>
				</tr>
				<tr>
					<td class="q">닉네임:</td>
					<td class="ans"><input type="text" id="user_name"
						name="user_name" disabled="disabled"
						value="<%=user.getUser_name()%>"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%} %>
	<%}else{%>
	로그인 정보 어디갔냐?! 오류났다!!!
	<%} %>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("addr").value = roadAddr;
				}
			}).open();
		}
	</script>
</body>
</html>
