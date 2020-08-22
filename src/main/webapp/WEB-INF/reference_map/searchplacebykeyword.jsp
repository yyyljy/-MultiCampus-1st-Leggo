<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>키워드로 장소검색하기</title>
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>
	
</head>
<body>
<div id="map" style="width:100%;height:500px;"></div>
	<script>
	//마커를 클릭하면 장소명을 표출할 인포윈도우이다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	//지도를 담을 영역의 DOM 래퍼런스(지도를 표시할 div)
	var mapContainer = window.document.getElementById('map'),
	//지도를 생성할 때 필요한 기본 옵션
	mapOptions = {
		//지도의 중심 좌표
		center: new kakao.maps.LatLng(37.5279, 127.0055),
		level: 4//지도의 확대 레벨
	};
	//지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOptions);
	//장소 검색 객체를 생성합니다.
	var ps = new kakao.maps.services.Places();
	//키워드로 장소를 검색합니다
	ps.keywordSearch("이태원 맛집", placeSearchCB);
	//키워드 검색 완료 시 호출되는 콜백함수 입니다.
	function placeSearchCB(data,status,pagination){
		if(status == kakao.maps.services.Status.OK) {
			//검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			//LatLngBounds객체에 좌표를 추가합니다
			var bounds = new kakao.maps.LatLngBounds();
			for(var i=0; i<data.length; i++){
				displayMarker(data[i]);
				bounds.extend(new kakao.maps.LatLng(data[i].y,data[i].x));
			}
			//검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	}
	
	//지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
		//마커를 생성하고 지도에 표시합니다
		var marker = new kakao.maps.Marker({
			map: map,
			position: new kakao.maps.LatLng(place.y, place.x)
		})
		
		//마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker,'click',function() {
			//마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			infowindow.setContent('<div style="padding:5px;font-size:12px;">'
			+place.place_name+'</div>');
			infowindow.open(map, marker);
		});
	}
	</script>
</body>
</html>