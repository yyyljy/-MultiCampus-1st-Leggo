<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>지도에 사용자 컨트롤 올리기</title>
	<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 500px;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 195px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}
</style>
</head>
<body>
	<div class="map_wrap">
		<div id="map" style="width:100%; height:100%; 
		position:relative; overflow: hidden;"></div>
		<!-- 지도타입 컨트롤 div입니다 -->
		<div class="custom_typecontrol raidus_border" style="background-color: yellow;">
			<span id="btnRoadmap" class="selected_btn"
			onclick="setMapType('roadmap')">지도</span>
			<span id="btnSkyview" class="btn"
			onclick="setMapType('skyview')">스카이뷰</span>
			<span id="btnRoadview" class="btn"
			onclick="setMapType('roadview')">로드뷰</span>
		</div>
		
		<!-- 지도 확대, 축소 컨트롤 div입니다 -->
		<!-- <div class="custom_zoomcontrol radius_border">
			<span onclick="zoomIn()"><img src="http://t1.daumcdn.net/
			localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대">
			</span>
			<span onclick="zoomOut()"><img src="http://t1.daumcdn.net/
			localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소">
			</span>	
		</div> -->
	</div>
	<script>
	
	var mapContainer = document.getElementById('map'),
	//지도를 표시할 div
	mapOptions = {
		center: new kakao.maps.LatLng(37.5279, 127.0055),
		//지도의 중심좌표
		level: 3 //지도의 확대 레벨
	}
	//지도를 생성합니다.
	var map = new kakao.maps.Map(mapContainer,mapOptions);
	
	//지도에 추가된 지도타입정보를 가지고 잇을 변수이다.
	var currentTypeId;
	
	//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수이다.
	function setMapType(maptype) {
		var changeMaptype;
		var roadmapControl = document.getElementById('btnRoadmap');
		var skyviewControl = document.getElementById('btnSkyview');
		var roadviewControl = document.getElementById('btnRoadview');
		if(maptype === 'roadmap'){
			changeMaptype = kakao.maps.MapTypeId.ROADMAP;
			roadmapControl.className = 'selected_btn';
			skyviewControl.className = 'btn';
			roadviewControl.className = 'btn';
		}  else if(maptype === 'skyview') {
			changeMaptype = kakao.maps.MapTypeId.HYBRID;
			roadmapControl.className = 'btn';
			skyviewControl.className = 'selected_btn';
			roadviewControl.className = 'btn';
		} else {
			changeMaptype = kakao.maps.MapTypeId.ROADVIEW;
			roadmapControl.className = 'btn';
			skyviewControl.className = 'btn';
			roadviewControl.className = 'selected_btn';
		}
		//이미 등록된 지도 타입이 있으면 제거한다.
		if(changeMaptype) {
			map.removeOverlayMapTypeId(changeMaptype);
		}
		//maptype에 해당하는 지도타입을 지도에 추가해준다.
		map.addOverlayMapTypeId(changeMaptype);
		//지도에 추가된 타입정보를 갱신한다.
		currentTypeId = changeMaptype;
		
	}
	
	
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);
	
	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	/* function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	} */

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	/* function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	} */
		
	</script>
</body>
</html>