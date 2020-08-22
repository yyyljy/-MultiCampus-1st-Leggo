<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='UTF-8' />
	<title>회원가입 : LEGGO</title>
   	<link rel="stylesheet" href="/leggo/css/member/login.css" />
	<link rel="stylesheet" href="/leggo/css/member/login1.css" />
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<style type="text/css">
		#signForm{
		    background: #fff;
		    border: 0 solid #ebebeb;
		    border-radius: 5px;
		    padding: 15px 15px 15px;
		    width: 90%;
		    max-width: 800px;
		    text-align: left;
		}
		.input-wrap{
			padding: 10px;
		}
		.align-right{
			text-align: right;
		}
		.align-center{
			text-align: center;
		}
	</style>
</head>
<body style="background-color: #09214F;">
	<div class="row">
		<div class="page-wrap align-center">
			<div id="image-wrap">
				<a href="/leggo/index.do" class="logo-center"><img src="/leggo/images/LeggoLogo.png" alt=""></a>
			</div>
			<div id="page-content">
				<div class="text-center">
					<div class="auth-form-wrap" style="top: 50%">
						<div class="text" style="color: white;">
							<h1>회원가입</h1>
							<br/>
						</div>
						<form name="sign_up" action="/leggo/signUpSucc.do" method="post" class="auth-form" id="signForm">
        					<div class="inputWrap" style="background-color: skyblue;">
	        					<div class="col-xs-6">
									<div class="field">
										<input type="text" id="user_id"
											name="user_id" required="required"
											placeholder="아이디" class="form-control" />
										<label id="idCheckResult"></label>
									</div>
									<div class="field">
										<input type="password" id="pass"
											name="pass" required="required"
											placeholder="비밀번호" class="form-control"/>
									</div>
									<div class="field">
										<input type="password" id="pass_second"
											required="required"
											placeholder="비밀번호 확인" class="form-control" />
										<label id="passCheckResult"></label>
									</div>
									<div class="field">
										<input type="text" id="pass_hint"
											name="pass_hint" required="required"
											placeholder="비밀번호 힌트" class="form-control" />
									</div>
									<div class="field">
										<input type="text" id="pass_ans"
											name="pass_ans" required="required"
											placeholder="비밀번호 답변" class="form-control" />
									</div>
									<div class="field">
										<input type="text" id="user_name"
											name="user_name" required="required"
											placeholder="이름" class="form-control" />
									</div>
									<div class="field">
										<input type="text" id="date"
											name="birth" required="required"
											placeholder="YYYYMMDD" class="form-control" />
<!-- 										<input type="text" id="birth"
											name="birth" required="required"
											placeholder="YYYYMMDD" class="form-control" /> -->
									</div>
								</div>
	                       		<div class="col-xs-6">
									<div class="field">
			                            <select id="gender" name="gender" class="form-control" aria-label="성별" required="required">
	                                        <option value="">성별</option>
	                                        <option value="M">남자</option>
	                                        <option value="F">여자</option>
			                            </select>
		                       		</div>
									<div class="field">
										<input type="text" id="tel"
											name="tel" placeholder="일반전화 번호" class="form-control" />
									</div>
									<div class="field">
										<input type="tel" id="mobile"
											name="mobile" required="required"
											placeholder="휴대전화 번호" class="form-control" />
									</div>
									<div class="field">
										<button type="button" class="blue-btn half-width mb15" onclick="execDaumPostcode()">우편번호 찾기</button>
										<input type="text" id="postcode"
											name="postcode" placeholder="우편번호" class="form-control half-width" />
									</div>
									<div class="field">
										<input type="text" id="addr"
											name="addr" placeholder="주소" class="form-control" />
									</div>
									<div class="field">
										<input type="text" id="email"
											name="email" required="required"
											placeholder="본인 확인 이메일" class="form-control" />
									</div>
								</div>
							</div>
							<div class="radio-wrap align-center">
								<div class="col-xs-6">
									<label for="recv_email">이메일 수신 여부</label>
									<input type="radio" name="recv_email" value="Y" checked="checked"/> 수신
									<input type="radio" name="recv_email" value="N" /> 비수신
								</div>
								<div class="col-xs-6">
									<label for="recv_text">문자 수신 여부</label>
									<input type="radio" name="recv_text" value="Y" checked="checked"/> 수신
									<input type="radio" name="recv_text" value="N" /> 비수신
								</div>
							</div>
							<div class="term-wrap align-left" style="text-align: right;">
								<a	href="/leggo/signUpTerms.do" target="_blank"> 개인정보 사용</a>,
								<a	href="/leggo/signUpTerms.do" target="_blank"> 위치정보 제공</a>과 
								<a	href="/leggo/signUpTerms.do" target="_blank"> 개인정보 보호 정책 </a>
								<br/>
								<input type="checkbox" id="trader_sign_up_agree" value="test" required="required"/>
									해당 약관을 읽었으며, 동의합니다
							</div>
							<div class="btn-wrap align-center">
								<input type="submit" id="submitBtn" value="가입하기" class="blue-btn" disabled="disabled">
								<div class="text-wrap">
									이미 계정이 있으신가요?
									<a class="recover" href="/leggo/login.do">로그인 하기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr").value = roadAddr;
            }
        }).open();
    }
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#user_id").on("keyup", function() {
			$.ajax({
				url:"/leggo/idCheck.do",
				type:"get",
				data:{
					"user_id": $(this).val()
				},
				success: function(result){
					if(result.toString()=="사용 불가능한 아이디 입니다"){
						$("#idCheckResult").attr("style", 'color:red');
					}
					else{
						$("#idCheckResult").attr("style", 'color:black');
					}
					$("#idCheckResult").empty();
					$("#idCheckResult").append(result);
				}
			})
		})
		$("#user_id").on("blur", function() {
			var user_id = $("#user_id").val();
			var re = /(?=.*\d)(?=.*[a-zA-Z]).{4,20}/;
			if(!fn_check(re, user_id, "아이디는 4~20자로 반드시 영문자와 숫자를 포함해야 합니다.")){
				$("#idCheckResult").attr("style", 'color:red');
				$("#submitBtn").attr("disabled","disabled");
				$("#idCheckResult").empty();
				$("#idCheckResult").append("4~20자로 영문자와 숫자를 포함해야 합니다.");
				return;
			}else{
				$("#submitBtn").removeAttr("disabled");
			}
		})
		$("#date").on("blur", function() {
			var date = $("#date").val();
			var re = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
			if(!fn_check(re, date, "생년월일형식(YYYYMMDD)에 맞게 작성해주세요")){
				$("#date").attr("style", 'color:red');
				return;
			}else{
				$("#submitBtn").removeAttr("disabled");
				$("#date").removeAttr("style");
			}
		})
		$("#pass").on("keyup", function() {
			result = "";
			if($(this).val()!=$("#pass_second").val()){
				$("#passCheckResult").attr("style", 'color:red');
				result = "비밀번호 불일치";
			}
			else{
				$("#passCheckResult").attr("style", 'color:black');
				result = "비밀번호 일치";
			}
			$("#passCheckResult").empty();
			$("#passCheckResult").append(result);
		})
		$("#pass_second").on("keyup", function() {
			result = "";
			if($(this).val()!=$("#pass").val()){
				$("#passCheckResult").attr("style", 'color:red');
				$("#submitBtn").attr("disabled","disabled");
				result = "비밀번호 불일치";
			}
			else{
				$("#passCheckResult").attr("style", 'color:black');
				$("#submitBtn").removeAttr("disabled");
				result = "비밀번호 일치";
			}
			$("#passCheckResult").empty();
			$("#passCheckResult").append(result);
		})
		$("#pass").on("blur", function() {
			var user_id = $("#pass").val();
			var re = /(?=.*\d)(?=.*[a-zA-Z]).{4,20}/;
			if(!fn_check(re, user_id, "비밀번호는 4~20자로 반드시 영문자와 숫자를 포함해야 합니다.")){
				$("#pass").attr("style", 'color:red');
				$("#submitBtn").attr("disabled","disabled");
				return;
			}else{
				$("#submitBtn").removeAttr("disabled");
				$("#pass").removeAttr("style");
			}
		})
		function fn_check(re, what, message) {
		if(re.test(what)) {
			return true;
		}
		alert(message);
	}
	})
</script>
</body>
</html>
