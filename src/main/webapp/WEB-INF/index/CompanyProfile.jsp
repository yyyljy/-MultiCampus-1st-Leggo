<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="/leggo/css/CompanyProfile.css">
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>CompanyProfile</title>
</head>
<body>
	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="/leggo/menu.do"
				class="w3-bar-item w3-button"><b>LEGGO</b> What makes you
				connected?</a>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="#projects" class="w3-bar-item w3-button">Vission &
					Mission</a> <a href="#about" class="w3-bar-item w3-button">About</a> <a
					href="#contact" class="w3-bar-item w3-button">Contact</a>
			</div>
		</div>
	</div>
	<!-- Header -->
	<div class="slidershow middle" id="header">
		<div class="slides">
			<input type="radio" name="r" id="r1" checked> <input
				type="radio" name="r" id="r2"> <input type="radio" name="r"
				id="r3"> <input type="radio" name="r" id="r4">
			<div class="slide s1">
				<img alt="" src="/leggo/images/car_5_1.jpg">
			</div>
			<div class="slide">
				<img alt="" src="/leggo/images/car_3_1.jpg">
			</div>
			<div class="slide">
				<img alt="" src="/leggo/images/car_4_1.jpg">
			</div>
			<div class="slide">
				<img alt="" src="/leggo/images/car_2_1.jpg">
			</div>
		</div>

		<div class="navigation">
			<label for="r1" class="bar"></label> <label for="r2" class="bar"></label>
			<label for="r3" class="bar"></label> <label for="r4" class="bar"></label>
		</div>
	</div>
	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px">
		<div id="bgImg">
			<!-- �����̵� �������� ���� �ڸ� -->
		</div>
		<!-- Project Section -->
		<div class="w3-container w3-padding-32" id="projects">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Vission
				& Mission</h3>
			<h4 id="text1">ȸ�簳��</h4>
			<p>(��)������� 2019�� 5���� 4�� ������� ���� ���� ���� ������ ���ѹα� �ִ� ������
				Connectivity Solution Provider�Դϴ�.</p>
			<br />
			<h4 id="text1">Vission</h4>
			<p>�ΰ��� ���� �� �� �����ϰ� ���ϰ�</p>
			<br />
			<h4 id="text1">Mission</h4>
			<p>���� �ְ��� Connectivity Solution Provider</p>
		</div>
		<!-- About Section -->
		<div class="w3-container w3-padding-24" id="about">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-4">About</h3>
			<p>�ΰ��߽����̰� ȯ��ģȭ���� ���� ����� ������ ���񽺸� ������� �ֻ��� �̵����� �����Ͽ� ���� ���� ���ϰ�
				��̰� ������ �� �ִ� ���ο� ������ �����Ѵ�.�ΰ��߽����̰� ȯ��ģȭ���� ���� ����� ������ ���񽺸� ������� �ֻ���
				�̵����� �����Ͽ� ���� ���� ���ϰ� ��̰� ������ �� �ִ� ���ο� ������ �����Ѵ�.�ΰ��߽����̰� ȯ��ģȭ���� ���� �����
				������ ���񽺸� ������� �ֻ��� �̵����� �����Ͽ� ���� ���� ���ϰ� ��̰� ������ �� �ִ� ���ο� ������
				�����Ѵ�.�ΰ��߽����̰� ȯ��ģȭ���� ���� ����� ������ ���񽺸� ������� �ֻ��� �̵����� �����Ͽ� ���� ���� ���ϰ�
				��̰� ������ �� �ִ� ���ο� ������ �����Ѵ�.</p>
		</div>
		<div class="row">
			<div class="col">
				<img src="/leggo/images/park.jpg" alt="John" style="width: 100%">
				<h4>
					�ڼ���
					</h3>
					<p class="w3-opacity">����</p>
					<p>�ڱ�Ұ� �� ��</p>
					<p>
						<button class="w3-button w3-light-grey w3-block">Contact</button>
					</p>
			</div>
			<div class="col">
				<img src="/leggo/images/jeong.jpg" alt="Jane" style="width: 100%">
				<h4>������</h4>
				<p class="w3-opacity">��¯</p>
				<p>�ڱ�Ұ� �� ��</p>
				<p>
					<button class="w3-button w3-light-grey w3-block">Contact</button>
				</p>
			</div>
			<div class="col">
				<img src="/leggo/images/JYH.jpg" alt="Mike" style="width: 100%">
				<h4>Ȳ����</h4>
				<p class="w3-opacity">����</p>
				<p>�ڱ�Ұ� �� ��</p>
				<p>
					<button class="w3-button w3-light-grey w3-block">Contact</button>
				</p>
			</div>
			<div class="col">
				<img src="/leggo/images/jun.jpg" alt="Dan" style="width: 100%">
				<h4>���ؼ�</h4>
				<p class="w3-opacity">����</p>
				<p>�ڱ�Ұ� �� ��</p>
				<p>
					<button class="w3-button w3-light-grey w3-block">Contact</button>
				</p>
			</div>
			<div class="col">
				<img src="/leggo/images/woo.jpg" alt="Mike" style="width: 100%">
				<h4>���ؿ�</h4>
				<p class="w3-opacity">����</p>
				<p>�ڱ�Ұ� �� ��</p>
				<p>
					<button class="w3-button w3-light-grey w3-block">Contact</button>
				</p>
			</div>
		</div>
		<!-- Contact Section -->
		<div class="w3-container w3-padding-32" id="contact">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
			<p>�����ϱ�</p>
			<form action="/action_page.php" target="_blank">
				<input class="w3-input w3-border" type="text" placeholder="�̸�"
					required name="Name"> <input
					class="w3-input w3-section w3-border" type="text" placeholder="�̸���"
					required name="Email"> <input
					class="w3-input w3-section w3-border" type="text" placeholder="����"
					required name="Subject"> <input
					class="w3-input w3-section w3-border" type="text" placeholder="�ڸ�Ʈ"
					required name="Comment">
				<button class="w3-button w3-black w3-section" type="submit">
					<i class="fa fa-paper-plane"></i> ������
				</button>
			</form>
		</div>
		<!-- Image of location/map -->
		<div class="w3-container" align="center">
			<img src="/leggo/images/MainLogo.png" class="w3-image"
				style="width: 8%">
		</div>
		<!-- End page content -->
	</div>
	<!-- Footer -->
	<footer class="w3-center w3-black w3-padding-16">
		<p>
			Powered by <a href="/leggo/menu.do"
				title="W3.CSS" target="_blank" class="w3-hover-text-green">LEGGO</a>
		</p>
	</footer>
</body>
</html>