<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>클릭한 위치에 마커 표시하기</title>
	<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>
	
</head>
<body>
	<div id="map" style="width:100%;height:500px;"></div>
	<p><em>지도를 클릭해주세요!</em></p>
	<div id="clickLatlng"></div>
	<script>
		//지도를 표시할 div
		var mapContainer = document.getElementById('map'),
		mapOptions = {
			center: new kakao.maps.LatLng(37.5279, 127.0055),	
			level: 3// 지도의 확대 레벨
		};
		//지도를 생성합니다.
		var map = new kakao.maps.Map(mapContainer,mapOptions);
		
		//지도를 클릭한 위치에 표출한 마커입니다.
		var marker = new kakao.maps.Marker({
			//지도 중심좌표에 마커를 생성합니다.	
			position: map.getCenter()
		});
		//지도에 마커를 표시합니다.
		marker.setMap(map);
		
		//지도에 클릭 이벤트를 등록합니다.
		//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map,'click', function(mouseEvent) {
			//클릭한 위도, 경도 정보를 가져옵니다
			var latlng = mouseEvent.latLng;
			//마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);
			var message = '클릭한 위치의 위도는' + latlng.getLat() + '이고,';
			message += '경도는' + latlng.getLng() + '입니다';
			
			var resultDiv = document.getElementById('clickLatlng');
			resultDiv.innerHTML = message;
		});
	</script>	
</body>
</html>