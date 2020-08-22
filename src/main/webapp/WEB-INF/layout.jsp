<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>layout practice</title>
	<link href="http://fonts.googleapis.com/css?family=Henny+Penny"
	rel="stylesheet" type="text/css" />
	
	<!-- �ʱ�ȭ -->
	<style type="text/css">
		* {margin: 0; padding: 0;}
		body {font-family: 'Times New Roman', serif;}
		li {list-style: none;}
		a {text-decoration: none;}
		img {border: 0;}
		
		#title{
			font-family: 'Henny Penny', cursive;
		}
	</style>
	<!-- ��� -->
	<style type="text/css">
		#main_header {
			/* �߾� ���� */
			width: 960px; margin: 0 auto;
			/* ���� ��ǥ */
			height: 160px; position: relative;
		}
		#main_header > #title {
			position: relative;
			left: 20px; top: 30px;
		}
		#main_header > #main_gnb {
			position: absolute;
			right: 0; top: 0;
		}
		#main_header > #main_lnb {
			position: absolute;
			right: 0; bottom: 10px;
		}
	</style>
	<!-- �޴�(1) -->
	<style type="text/css">
		#main_gnb > ul {overflow: hidden;}
		#main_gnb > ul > li {float: left;}		
		#main_gnb > ul > li > a { 
			display: block;
			padding: 2px 10px;
			border: solid 1px black;
			/* margin: 5px; */
		}
		/* ���콺 Ŀ�� ���� �� ��Ÿ���� ��ȭ ���� */
		#main_gnb > ul > li > a:hover {
			background: black;
			color: white;
		}
		#main_gnb > ul > li:first-child > a {border-radius: 10px 0 0 10px;}
		#main_gnb > ul > li:last-child > a {border-radius: 0 10px 10px 0;}	 
	</style>
	<!-- �޴�(2) -->
	<style type="text/css">
		/* overflow: �����  �ڽ��� ������ �ڽ����� �� �涧 ��� ������ �����ϴ� �Ӽ��̴�. */
		/* visible: �⺻������ ������ �� �� �״�� ���δ�.(������ �귯��ģ��.) */
		/* hidden: ������ ��ġ�� �ڸ���. �ڸ� �κ��� ������ �ʴ´�. */
		/* scroll: ������ ��ġ�� �ʾƵ� �׻� ��ũ�ѹٰ� ���δ�. */
		/* auto : ������ �߸� ���� ��ũ�ѹٰ� ���δ�. */
		#main_lnb > ul {overflow: hidden;}
		/* �������� ���� */
		#main_lnb > ul > li {float: left;}
		#main_lnb > ul > li > a {
			display: block;
			background-color: green;
			padding: 10px 20px;
			border: solid 1px black;	
		}
		/* ���콺 Ŀ�� ���� �� ��Ÿ���� ��ȭ ���� */
		#main_lnb > ul > li > a:hover {
			background: fuchsia;
			color: white;
		}
		/* border-radius : top-left, top-right, bottom-right, bottom-left sequence */
		/* ���� 3���϶� : top-left, top-right & bottom-left, bottom-right */
		/* ���� 2���϶� : top-left & bottom-right, top-right & bottom-left */
		/* ���� 1���϶� : top-left, top-right, bottom-right, bottom-left */
		/* #main_lnb > ul > li:first-child {margin-left: 10px;} */
		#main_lnb > ul > li:first-child > a {border-radius: 10px 0 0 10px;}
		#main_lnb > ul > li:last-child > a {border-radius: 0 10px 10px 0;}
}
	</style>
	<!-- ������ -->
	<style type="text/css">
		#content {
			/* �߾� ���� */
			width: 960px;
			margin: 0 auto;
			/* ���� ���̾ƿ� ���� */
			overflow: hidden;
		}
		
		#content > main_section {
			width: 750px;
			float: left;	
		}
	
		#content > main_aside {
			width: 200px;
			float: right;
		}
	</style>

	<style type="text/css">
		#main_section > article.main_article {
			margin-bottom: 10px;
			padding: 20px;
			border: solid 1px black;
		}
	</style>
	<!-- ���̵� -->
	<style type="text/css">
		/* ù ��° �� */
		input:nth-of-type(1) {display: none;}
		input:nth-of-type(1) ~ div:nth-of-type(1) {display: none;}
		input:nth-of-type(1):checked ~ div:nth-of-type(1) {display: block;}
		/*�� ��° ��*/
		input:nth-of-type(2) {display: none;}
		input:nth-of-type(2) ~ div:nth-of-type(2) {display: none;}
		input:nth-of-type(2):checked ~ div:nth-of-type(2) {display: block;}
		
		/* �� ��� ���� */
		section.buttons {overflow: hidden;}
		section.buttons > label {
			/* ���� ���� */
			display: block; float: left;
			/* ũ�� �� ���� ��ġ ���� */
			width: 14%; height: 10%;
			line-height: 30px;
			text-align: center;
			/* �׵θ� ���� */
			box-sizing: border-box;
			border: solid 1px black;
			/* ���� ���� */
			background: black;
			color: white;
		}
		/* �� �κ��� �۵� �� �ϳ׿�. */
 		input:nth-of-type(1):checked ~ seciton.buttons > label:nth-of-type(1) { 
			background: white;
			color: black; 
		}
		input:nth-of-type(2):checked ~ seciton.buttons > label:nth-of-type(2) { 
			background: white;
			color: black;
		}
		/* ������� �۵��� �� �ǿ�. �ФФ� */

	</style>
	<!-- ��� -->
	<style type="text/css">
		.item {
			overflow: hidden;
			/* margin: 5px; */
			padding: 10px;
			border: solid 1px black;
			border-top: none;
			width: 25%;
		}
		.thumbnail {
			float: left;
		}
		.description {
			float: left;
			margin-left: 20px;
		}
		.description > strong {
			display: block;
			width: 120px;
			white-space: nowrap;
			overflow: hidden;
			/* text-overflow�� �����Ѵٴ� �ǹ��̴�. */
			/* ��ġ�� ���ڴ� �����ȴ�. */
			text-overflow: ellipsis;
		}	
	</style>
	<!-- Ǫ�� -->
	<style type="text/css">
		#main_footer {
			/* �߾� ���� */
			width: 960px; margin: 0 auto;
			margin-bottom: 10px;
			height: 100%;
			position: relative;
			/* �׵θ� */
			box-sizing: border-box;
			padding: 10px;
			border: solid 1px black;
			/* ���� ���� */
			text-align: center;
		}
	</style>
</head>
<body>
	<header id="main_header">
		<div id="title">
			<h1>Rint Development</h1>
			<h2>Parking Lot �ΰ� ����</h2>
			<h2>LEGGO Parking Lot Reservation</h2>
		</div>
		<!-- gnb�� global navigation bar�� �ǹ��ϰ� lnb�� local navigation bar�� �ǹ��Ѵ�. 
		�� �������� ���� �� ���� ����ϴ� ����̹Ƿ� ����� �� �� -->
		<nav id="main_gnb">
			<ul>
				<li><a href="#">Web</a></li>
				<li><a href="#">Mobile</a></li>
				<li><a href="#">Game</a></li>
				<li><a href="#">Simulation</a></li>
				<li><a href="#">Data</a></li>
			</ul>
		</nav>
		<br/>
		<nav id="main_lnb">
			<ul>
				<li><a href="#">HTML5</a></li>
				<li><a href="#">CSS3</a></li>
				<li><a href="#">JavaScript</a></li>
				<li><a href="#">jQuery</a></li>
				<li><a href="#">Node.js</a></li>
			</ul>
		</nav>
	</header>
	<br/>
	<div id="content">
		<section id="main_section">
			<article class="main_article">
				<h1>Main Section</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
				Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
			</article>
			
			<article class="main_article">
				<h1>Main Section</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
				Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
			</article>
			
			<article class="main_article">
				<h1>Main Section</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
				Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
			</article>
		</section>
	
		<!-- ���̵� �ǹ� ���� -->
		<aside id="main_aside">	
			<input type="radio" id="first" name="tab" checked="checked" />		
			<input type="radio" id="second" name="tab" /><!-- checked="checked" -->
		<section class="buttons">	
			<label for="first">First</label>
			<label for="second">Second</label>
		</section>
			<div class="tab_item">
				<ul>
					<li class="item">
						<a href="#">
							<!-- ����� �̹��� ���� �ڽ� ���� -->
							<div class="thumbnail">
								<img src="http://placehold.it/45X45" />
							</div>
							<div class="description">
								<strong>HTML5 Canvas</strong>	
								<p>2012-03-15</p>
							</div>
						</a>
					</li>
					
					<li class="item">
						<a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45X45" />
							</div>
							<div class="description">
								<strong>HTML5 Audio</strong>	
								<p>2012-03-15</p>
							</div>
						</a>
					</li>
					
					<li class="item">
						<a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45X45" />
							</div>
							<div class="description">
								<strong>HTML5 Video</strong>	
								<p>2012-03-15</p>
							</div>
						</a>
					</li>
					
					<li class="item">
						<a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45X45" />
							</div>
							<div class="description">
								<strong>HTML5 Semantic Web</strong>	
								<p>2012-03-15</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
				
			<div class="tab_item">
				<ul>
					<li class="item">
						<a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45X45" />
							</div>
							<div class="description">
								<strong>CSS3 Transition</strong>	
								<p>2012-03-15</p>
							</div>
						</a>
					</li>
					
					<li class="item">
						<a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45X45" />
							</div>
							<div class="description">
								<strong>CSS3 Animation</strong>	
								<p>2012-03-15</p>
							</div>
						</a>
					</li>
				
					<li class="item">
						<a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45X45" />
							</div>
							<div class="description">
								<strong>CSS3 Border</strong>	
								<p>2012-03-15</p>
							</div>
						</a>
					</li>
				
					<li class="item">
						<a href="#">
							<div class="thumbnail">
								<img src="http://placehold.it/45X45" />
							</div>
							<div class="description">
								<strong>CSS3 Box</strong>	
								<p>2012-03-15</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</aside>
	</div>	
	<footer>
		<h3>HTML5 + CSS3 Basic</h3>
		<address>Website Layout Basic</address>
	</footer>
</body>
</html>