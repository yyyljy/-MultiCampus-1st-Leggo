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
							<h1>주차장 정보</h1>
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
								</div>
							</div>
							<div class="btn-wrap align-center">
								<input type="submit" id="submitBtn" value="전송" class="blue-btn">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#user_id").on("keyup", function() {
			alert("정답이 뭐냐"+$(this).val())
			$.ajax({
				url:"/leggo/getPInfo.do",
				type:"get",
				data:{
					"parking_code": $(this).val()
				},
				success: function(result){
					alert("썽꼬오옹:"+result)
					/* if(result.toString()=="사용 불가능한 아이디 입니다"){
						$("#idCheckResult").attr("style", 'color:red');
					}
					else{
						$("#idCheckResult").attr("style", 'color:black');
					}
					$("#idCheckResult").empty();
					$("#idCheckResult").append(result); */
				}
			})
		})
	})
</script>
</body>
</html>
