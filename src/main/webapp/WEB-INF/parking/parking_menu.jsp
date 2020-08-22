<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="/leggo/css/main_jw.css">
	
	<style type="text/css">
	.searchBar{
     /* background-color: grey; */
     width: 100%;
     border-radius: 10px;
	}
	#search{
	width: 120%;
	height: 120%;
	}
	#searchClick{
	width: 120%;
	background-color: skyblue;
	}
	#currentLoc{
		color: white;
	}
	
	</style>
</head>
<body>
	<!-- Sidebar/menu -->
	<div id="freesidebar">
	 <div id="freemenubtn">
		  <!-- 	<form action="" method="get" class="searchBar">
				<div class="w3-cell-row"">
					<div class="w3-cell" id="search">
				  		<input type="text"  placeholder="검색하세요"/>
				  	</div>
				  	<div class="w3-cell" id="searchClick">
				  		<a href="#" onclick="" >검색</a>
				  	</div>
				</div>
			</form> -->
		 <button onclick="currentLoc()" class="w3-button">현재위치</button> 
		  <a href="/leggo/parking/favorite.do"><button onclick="" class="w3-button">즐겨찾기</button></a>
		  <a href="/leggo/parking/recent.do"><button onclick="" class="w3-button">최근 방문</button> </a>
		  <button onclick="showMarkers()" class="w3-button">주변 주차장<br/>(감추기)</button>  
		   <a href="/leggo/navi.do"><button onclick="" class="w3-button">길찾기로 이동</button></a>
		  <a href="/leggo/lastmile.do"><button onclick="" class="w3-button">라스트마일로 이동</button> </a>
		 
		  
		  
	  </div>
	</div>
</body>
</html>