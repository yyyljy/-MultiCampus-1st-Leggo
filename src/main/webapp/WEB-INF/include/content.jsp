<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="update_info" method="post" class="auth-form">
		<!-- <div class="horizontalSort"> -->
		<!-- <h3 class="major">회원 정보 수정</h3> -->
		<div class="horizontalSort">
			<div id="id_info" class="field quarter">
				<label for="sign_up_id">아이디</label> <input type="text"
					name="sign_up_id" id="sign_up_id" value="ABC123" class="fit"
					disabled="disabled" />
			</div>
			<div id="user_pass" class="field quarter">
				<label for="user_pass">비밀번호</label> <input type="password"
					name="user_pass" id="user_pass" value="qwerty" class="fit" />
			</div>
			<div id="user_pass_confirm" class="field quarter">
				<label for="user_pass_confirm">비밀번호 확인</label> <input
					type="password" name="user_pass_confirm" id="user_pass_confirm"
					class="fit" />
			</div>
			<div id="pass_hint" class="field quarter">
				<label for="pass_hint">비밀번호 힌트</label>
				<div class="select-wrapper fit">
					<select name="pass_hint" id="pass_hint">
						<optgroup label="비밀번호 힌트 질문">
							<option value="1">나의 홈타운은?</option>
							<option value="1">가장 인상 깊게 읽은 책 제목은?</option>
							<option value="1">나의 보물은?</option>
							<option value="1">내가 가장 좋아하는 장소는?</option>
						</optgroup>
					</select>
				</div>
			</div>
			<div id="pass_hint_answer" class="field quarter">
				<label for="pass_hint_answer">비밀번호 답변</label> 
				<input type="text" name="pass_hint_answer" id="pass_hint_answer" value="ABC123"
					class="fit" />
			</div>		
		</div>
		<div class="horizontalSort">
			<div id="user_name" class="">
				<label for="user_name">이름</label> 
				<input type="text" name="user_name" id="user_name" value="홍길동" class="fit" />
		</div>
		<div id="user_gender" class="field quarter">
			<label for="user_gender">성별</label>
				<div class="select-wrapper fit">
					<select name="user_gender" id="user_gender">
						<option value="1">남자</option>
						<option value="1">여자</option>
					</select>
				</div>
		</div>

			<div id="sign_up_tel" class="field quarter">
				<label for="sign_up_tel">생년월일</label> <input type="text"
					name="sign_up_tel" id="sign_up_tel" value="1990/01/31" class="fit"
					required="required" placeholder="생년월일" />
			</div>
			<div id="sign_up_tel" class="field quarter">
				<label for="sign_up_tel">일반 전화</label> <input type="text"
					name="sign_up_tel" id="sign_up_tel" value="02-999-9999" class="fit"
					required="required" placeholder="일반전화" />
			</div>
			<div id="sign_up_postcode" class="field quarter">
				<label for="sign_up_postcode">우편번호</label>
				<ul class="actions fit">
					<li><input type="text" name="sign_up_postcode"
						id="sign_up_postcode" value="01234" required="required"
						placeholder="우편번호" /></li>
					<li><input type="button" id="sign_up_getaddr"
						name="sign_up[getaddr]" onclick="execDaumPostcode()"
						value="우편번호 찾기" class="button fit align-center"
						style="font-size: 15pt;"></li>
				</ul>
			</div>
			<div id="sign_up_address" class="field quarter">
				<label for="sign_up_address">주소</label> <input type="text"
					name="sign_up_address" id="sign_up_address" value="주소" class="fit"
					required="required" placeholder="주소입력란" />
			</div>
			<div id="sign_up_email" class="field quarter">
				<label for="sign_up_email">이메일</label> <input type="text"
					name="sign_up_email" id="sign_up_email" value="이메일" class="fit"
					required="required" placeholder="본인 확인 이메일" />
			</div>
		</div>
		<div class="align-center" style="align-content: center;">
			<input type="submit" value="수정" class="button quarter color2" style="font-size: 10pt"/>
			<input type="reset" value="취소" class="button quarter color2" style="font-size: 10pt"/>
			<a href="#">탈퇴하기</a>
		</div>	
	</form>
</body>
</html>