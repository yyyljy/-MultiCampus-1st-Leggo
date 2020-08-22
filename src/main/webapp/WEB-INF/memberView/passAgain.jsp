<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='UTF-8' />
	<title>비밀번호 재확인 : LEGGO</title>
<!-- 	<link rel="stylesheet" href="/leggo/css/member/login.css" />
	<link rel="stylesheet" href="/leggo/css/member/login1.css" /> -->
</head>
<body id="login" class="main_frame">
	<div class="container-flex">
		<div id="page-wrap">
			<a href="#" class="logo-center"><img src="/leggo/images/LeggoLogo.png" alt=""></a>
			<div id="page-content">
				<div class="text-center">
					<div class="auth-form-wrap" style="top: 45%">
						<br>
						<form action="/leggo/relogin.do" method="post" class="auth-form">
							<h1>비밀번호를 다시 입력해주세요</h1>
							<div class="field">
								<input class="form-control" type="password" id="pass" name="pass" placeholder="비밀번호" />
							</div>
							<input type="submit" class="submit blue-btn full-width"	value="확인">
							<div class="text-center mt15">
								<a href="/leggo/resetPwd.do" class="recover"> 비밀번호 찾기 </a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>