<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>비밀번호 재설정 : LEGGO</title>
	<link rel="stylesheet" href="/leggo/css/member/login.css" />
	<link rel="stylesheet" href="/leggo/css/member/login1.css" />
	<link rel="stylesheet" href="/leggo/css/member/fontawesome-all.min.css" />
<body id="login" class="main_frame">
	<div class="container-flex">
		<div id="page-wrap">
			<a href="#" class="logo-center"><img src="/leggo/images/LeggoLogo.png" alt=""></a>
			<div id="page-content">
				<div class="text-center">
					<div class="auth-form-wrap" style="top: 45%">
						<br>
						<form action="/resetPwd.do" method="post" class="auth-form">
							<h1>비밀번호 재설정</h1>
							<div class="field">
								<input class="form-control" type="text" id="user_id" name="user_id" value="" placeholder='아이디' />
							</div>
							<div class="field">
								<input class="form-control" type="text" id="pass_hint" name="pass_hint" placeholder="비밀번호 힌트" />
							</div>
							<div class="field">
								<input class="form-control" type="text" id="pass_answer" name="pass_answer" placeholder="비밀번호 답변" />
							</div>
							<button type="submit" class="submit blue-btn full-width"
								onclick="ga('send', 'event', { eventCategory: 'account', eventAction: 'signed up', eventLabel: 'sign up button'});">비밀번호 재설정</button>
							<div class="text-center mt15">
								<a class="recover_email" href="#"> 이메일로 재설정 </a>
							</div>
							<div class="text-center mt15">
								<a class="recover_mobile" href="#">핸드폰으로 재설정 </a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>