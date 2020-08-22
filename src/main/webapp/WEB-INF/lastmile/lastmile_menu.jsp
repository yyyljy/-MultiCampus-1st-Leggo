<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- Sidebar/menu -->
	<div id="freesidebar">
		<div id="freemenubtn">
		 	<button onclick="currentLoc()" class="w3-button">현재위치</button> 
		 	
	        <a href="/leggo/lastmile.do" id="around" class="w3-button">주변 lastmile</a>
	        
			<a href="/leggo/lastmile/favorite.do" id="favorite" class="w3-button" >즐겨찾기</a>

			<a href="/leggo/lastmile/recent.do" id="recent" class="w3-button" >최근 방문</a>
	        
			<!-- <form action="" method="get">
				<div class="w3-cell-row">
	
					<div class="w3-cell">
				  		<input type="text" class="col-8" placeholder="검색하세요"/>
				  	</div>
				
				  	<div class="w3-cell">
				  		<a href="#" onclick="" class="w3-button w3-padding-small col-4">검색</a>
				  	</div>
				
				</div>
			</form> -->
		</div>
	</div>
	
<!-- 	<div>
		<a href="road_map.html" class="w3-button"
			style="width: 70%; margin: 10px; font-size: 20px;">길찾기</a><br />
		<a href="road_map.html" class="w3-button"
			style="width: 70%; margin: 10px; font-size: 20px;">주차장</a><br />
	</div> -->
	
	
</body>
</html>