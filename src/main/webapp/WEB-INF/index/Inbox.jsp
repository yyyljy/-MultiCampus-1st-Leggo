<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href='https://fonts.googleapis.com/css?family=RobotoDraft'
		rel='stylesheet' type='text/css'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/leggo/css/Inbox.css">
<title>메세지</title>
</head>
<body>
	<!-- 사이드메뉴 -->
	<nav
		class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card"
		style="z-index: 3; width: 320px;" id="mySidebar">
		<div id="sideLogo">
			<a href="/leggo/menu.do"><img
				src="/leggo/images/MainLogo.png" style="width: 60%;"><br />
				Don't Stop, Lets go</a>
		</div>
		<a href="javascript:void(0)" onclick="w3_close()"
			title="Close Sidemenu"
			class="w3-bar-item w3-button w3-hide-large w3-large">닫기 <i
			class="fa fa-remove"></i></a> <a href="javascript:void(0)"
			class="w3-bar-item w3-button w3-button w3-hover-black"
			onclick="document.getElementById('id01').style.display='block'"
			id="text"> <i class="w3-padding fa fa-pencil"></i>쪽지 쓰기
		</a> <a id="text" onclick="myFunc('Demo1')" href="javascript:void(0)"
			class="w3-bar-item w3-button"><i
			class="fa fa-inbox w3-margin-right"></i>쪽지함 (3) <i
			class="fa fa-caret-down"></i></a>

		<div id="Demo1" class="w3-hide w3-animate-left">
			<a href="javascript:void(0)"
				class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey"
				onclick="openMail('Borge');w3_close();" id="firstTab">
				<div class="w3-container">
					<img class="w3-round w3-margin-right" src="/w3images/avatar3.png"
															
						style="width: 15%;"><span class="w3-opacity w3-large">레고
						운영진</span>
					<h6>제목: 주차장 이용 안내</h6>
					<p>2020년 1월 25일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다.</p>
				</div>
			</a> <a href="javascript:void(0)"
				class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey"
				onclick="openMail('Jane');w3_close();">
				<div class="w3-container">
					<img class="w3-round w3-margin-right" src="/w3images/avatar5.png"
						style="width: 15%;"><span class="w3-opacity w3-large">레고
						운영진</span>
					<h6>제목: 주차장 이용 안내</h6>
					<p>2020년 1월 26일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다.</p>
				</div>
			</a> <a href="javascript:void(0)"
				class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey"
				onclick="openMail('John');w3_close();">
				<div class="w3-container">
					<img class="w3-round w3-margin-right" src="/w3images/avatar2.png"
						style="width: 15%;"><span class="w3-opacity w3-large">레고
						운영진</span>
					<h6>제목: 주차장 이용 안내</h6>
					<p>2020년 1월 27일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다.</p>
				</div>
			</a>
		</div>
		<a href="#" class="w3-bar-item w3-button"><i
			class="fa fa-paper-plane w3-margin-right"></i>보낸 쪽지함</a> <a href="#"
			class="w3-bar-item w3-button"><i
			class="fa fa-hourglass-end w3-margin-right"></i>임시보관함</a> <a href="#"
			class="w3-bar-item w3-button"><i
			class="fa fa-trash w3-margin-right"></i>휴지통</a>
	</nav>

	<!-- 쪽지쓰기 누르면 뜨는 창 -->
	<div id="id01" class="w3-modal" style="z-index: 4">
		<div class="w3-modal-content w3-animate-zoom">
			<div class="w3-container w3-padding" id="text">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-right w3-xxlarge"><i
					class="fa fa-remove"></i></span>
				<h2>쪽지쓰기</h2>
			</div>
			<div class="w3-panel">
				<label>받는 사람</label> <input
					class="w3-input w3-border w3-margin-bottom" type="text" /> <label>보내는
					이</label> <input class="w3-input w3-border w3-margin-bottom" type="text" />
				<label>제목</label> <input class="w3-input w3-border w3-margin-bottom"
					type="text" /> <input class="w3-input w3-border w3-margin-bottom"
					style="height: 150px" placeholder="입력하세요" />
				<div class="w3-section">
					<a class="w3-button" id="text"
						onclick="document.getElementById('id01').style.display='none'">취소
						  <i class="fa fa-remove"></i>
					</a> <a class="w3-button w3-light-grey w3-right"
						onclick="document.getElementById('id01').style.display='none'">보내기
						  <i class="fa fa-paper-plane"></i>
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Overlay effect when opening the side navigation on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="Close Sidemenu"
		id="myOverlay"></div>

	<!-- 페이지 콘텐츠 -->
	<div class="w3-main" style="margin-left: 320px;">
		<i
			class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left 
	w3-margin-top"
			onclick="w3_open()"></i> <a href="javascript:void(0)"
			class="w3-hide-large w3-blue w3-button w3-right 
	w3-margin-top w3-margin-right"
			onclick="document.getElementById('id01').style.display='block'">
			<i class="fa fa-pencil"></i>
		</a>

		<div id="Borge" class="w3-container person">
			<br>
			<img class="w3-round  w3-animate-top" src="/leggo/images/user.png"
				class="w3-image" style="width: 8%">
			<h5 class="w3-opacity">제목: 주차시간 안내</h5>
			<h4>
				<i class="fa fa-clock-o"></i> From 레고 운영진, 2020년 1월 25일
			</h4>
			<a class="w3-button w3-light-grey" href="#">답장<i
				class="w3-margin-left fa fa-mail-reply"></i></a> <a
				class="w3-button w3-light-grey" href="#">전달<i
				class="w3-margin-left fa fa-arrow-right"></i></a> <br /> <img
				src="/leggo/images/line2.png" id="line">
			<p>
				2020년 1월 25일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다. <br />10분내로 주차장으로 도착하시 않을 시
				주차예약이 취소될 수 있으며 관련 패널티가 적용될 예정입니다.
			</p>
			<p>
				감사합니다 <br>레고 운영진
			</p>
		</div>

		<div id="Jane" class="w3-container person">
			<br>
			<img class="w3-round  w3-animate-top" src="/leggo/images/user.png"
				class="w3-image" style="width: 8%">
			<h5 class="w3-opacity">제목: 주차시간 안내</h5>
			<h4>
				<i class="fa fa-clock-o"></i> From 레고 운영진, 2020년 1월 26일
			</h4>
			<a class="w3-button w3-light-grey">답장<i
				class="w3-margin-left fa fa-mail-reply"></i></a> <a
				class="w3-button w3-light-grey">전달<i
				class="w3-margin-left fa fa-arrow-right"></i></a> <br /> <img
				src="/leggo/images/line2.png" id="line">
			<p>
				2020년 1월 26일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다. <br />10분내로 주차장으로 도착하시 않을 시
				주차예약이 취소될 수 있으며 관련 패널티가 적용될 예정입니다.2020년 1월 26일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다. <br />10분내로 주차장으로 도착하시 않을 시
				주차예약이 취소될 수 있으며 관련 패널티가 적용될 예정입니다.2020년 1월 26일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다. <br />10분내로 주차장으로 도착하시 않을 시
				주차예약이 취소될 수 있으며 관련 패널티가 적용될 예정입니다.
			</p>
			<p>
				감사합니다 <br>레고 운영진
			</p>
		</div>

		<div id="John" class="w3-container person">
			<br>
			<img class="w3-round  w3-animate-top" src="/leggo/images/user.png"
				class="w3-image" style="width: 8%">
			<h5 class="w3-opacity">제목: 주차시간 안내</h5>
			<h4>
				<i class="fa fa-clock-o"></i> From 레고 운영진, 2020년 1월 27일
			</h4>
			<a class="w3-button w3-light-grey">답장<i
				class="w3-margin-left fa fa-mail-reply"></i></a> <a
				class="w3-button w3-light-grey">전달<i
				class="w3-margin-left fa fa-arrow-right"></i></a> <br /> <img
				src="/leggo/images/line2.png" id="line">
			<p>
				2020년 1월 27일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다. <br />10분내로 주차장으로 도착하시 않을 시
				주차예약이 취소될 수 있으며 관련 패널티가 적용될 예정입니다.2020년 1월 27일 오후 3시 멀티캠퍼트 주자창 안내 메세지입니다. <br />10분내로 주차장으로 도착하시 않을 시
				주차예약이 취소될 수 있으며 관련 패널티가 적용될 예정입니다.
			</p>
			<p>
				감사합니다 <br>레고 운영진
			</p>
		</div>

	</div>

	<script>
		var openInbox = document.getElementById("myBtn");
		openInbox.click();

		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}

		function myFunc(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " #2F5597";
			} else {
				x.className = x.className.replace(" w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-red", "");
			}
		}

		openMail("Borge")
		function openMail(personName) {
			var i;
			var x = document.getElementsByClassName("person");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x = document.getElementsByClassName("test");
			for (i = 0; i < x.length; i++) {
				x[i].className = x[i].className.replace(" w3-light-grey", "");
			}
			document.getElementById(personName).style.display = "block";
			event.currentTarget.className += " w3-light-grey";
		}
	</script>

	<script>
		var openTab = document.getElementById("firstTab");
		openTab.click();
	</script>
</body>
</html>