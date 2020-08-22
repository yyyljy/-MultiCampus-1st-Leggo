<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>layout practice</title>
	<link href="http://fonts.googleapis.com/css?family=Henny+Penny"
	rel="stylesheet" type="text/css" />
	
	<!-- 초기화 -->
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
	<!-- 헤더 -->
	<style type="text/css">
		#main_header {
			/* 중앙 정렬 */
			width: 960px; margin: 0 auto;
			/* 절대 좌표 */
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
	<!-- 메뉴(1) -->
	<style type="text/css">
		#main_gnb > ul {overflow: hidden;}
		#main_gnb > ul > li {float: left;}		
		#main_gnb > ul > li > a { 
			display: block;
			padding: 2px 10px;
			border: solid 1px black;
			/* margin: 5px; */
		}
		/* 마우스 커서 놓을 때 나타나는 변화 설정 */
		#main_gnb > ul > li > a:hover {
			background: black;
			color: white;
		}
		#main_gnb > ul > li:first-child > a {border-radius: 10px 0 0 10px;}
		#main_gnb > ul > li:last-child > a {border-radius: 0 10px 10px 0;}	 
	</style>
	<!-- 메뉴(2) -->
	<style type="text/css">
		/* overflow: 요소의  박스의 내용이 박스보다 더 길때 어떻게 보일지 선택하는 속성이다. */
		/* visible: 기본값으로 내용이 더 길어도 그대로 보인다.(내용이 흘러넘친다.) */
		/* hidden: 내용이 넘치면 자른다. 자른 부분은 보이지 않는다. */
		/* scroll: 내용이 넘치지 않아도 항상 스크롤바가 보인다. */
		/* auto : 내용이 잘릴 때만 스크롤바가 보인다. */
		#main_lnb > ul {overflow: hidden;}
		/* 왼쪽으로 정렬 */
		#main_lnb > ul > li {float: left;}
		#main_lnb > ul > li > a {
			display: block;
			background-color: green;
			padding: 10px 20px;
			border: solid 1px black;	
		}
		/* 마우스 커서 놓을 때 나타나는 변화 설정 */
		#main_lnb > ul > li > a:hover {
			background: fuchsia;
			color: white;
		}
		/* border-radius : top-left, top-right, bottom-right, bottom-left sequence */
		/* 값이 3개일때 : top-left, top-right & bottom-left, bottom-right */
		/* 값이 2개일때 : top-left & bottom-right, top-right & bottom-left */
		/* 값이 1개일때 : top-left, top-right, bottom-right, bottom-left */
		/* #main_lnb > ul > li:first-child {margin-left: 10px;} */
		#main_lnb > ul > li:first-child > a {border-radius: 10px 0 0 10px;}
		#main_lnb > ul > li:last-child > a {border-radius: 0 10px 10px 0;}
}
	</style>
	<!-- 콘텐츠 -->
	<style type="text/css">
		#content {
			/* 중앙 정렬 */
			width: 960px;
			margin: 0 auto;
			/* 수평 레이아웃 구성 */
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
	<!-- 사이드 -->
	<style type="text/css">
		/* 첫 번째 탭 */
		input:nth-of-type(1) {display: none;}
		input:nth-of-type(1) ~ div:nth-of-type(1) {display: none;}
		input:nth-of-type(1):checked ~ div:nth-of-type(1) {display: block;}
		/*두 번째 탭*/
		input:nth-of-type(2) {display: none;}
		input:nth-of-type(2) ~ div:nth-of-type(2) {display: none;}
		input:nth-of-type(2):checked ~ div:nth-of-type(2) {display: block;}
		
		/* 탭 모양 구성 */
		section.buttons {overflow: hidden;}
		section.buttons > label {
			/* 수평 정렬 */
			display: block; float: left;
			/* 크기 및 글자 위치 지정 */
			width: 14%; height: 10%;
			line-height: 30px;
			text-align: center;
			/* 테두리 지정 */
			box-sizing: border-box;
			border: solid 1px black;
			/* 색상 지정 */
			background: black;
			color: white;
		}
		/* 이 부분이 작동 안 하네요. */
 		input:nth-of-type(1):checked ~ seciton.buttons > label:nth-of-type(1) { 
			background: white;
			color: black; 
		}
		input:nth-of-type(2):checked ~ seciton.buttons > label:nth-of-type(2) { 
			background: white;
			color: black;
		}
		/* 여기까지 작동이 안 되요. ㅠㅠㅠ */

	</style>
	<!-- 목록 -->
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
			/* text-overflow는 생략한다는 의미이다. */
			/* 넘치는 글자는 생략된다. */
			text-overflow: ellipsis;
		}	
	</style>
	<!-- 푸터 -->
	<style type="text/css">
		#main_footer {
			/* 중앙 정렬 */
			width: 960px; margin: 0 auto;
			margin-bottom: 10px;
			height: 100%;
			position: relative;
			/* 테두리 */
			box-sizing: border-box;
			padding: 10px;
			border: solid 1px black;
			/* 글자 정렬 */
			text-align: center;
		}
	</style>
</head>
<body>
	<header id="main_header">
		<div id="title">
			<h1>Rint Development</h1>
			<h2>Parking Lot 부가 서비스</h2>
			<h2>LEGGO Parking Lot Reservation</h2>
		</div>
		<!-- gnb는 global navigation bar를 의미하고 lnb는 local navigation bar를 의미한다. 
		웹 페이지를 만들 때 자주 사용하는 용어이므로 기억해 줄 것 -->
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
	
		<!-- 사이드 탭바 구성 -->
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
							<!-- 썸네일 이미지 넣을 박스 구성 -->
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