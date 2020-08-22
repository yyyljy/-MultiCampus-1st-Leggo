<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>지도 타입 바꾸기</title>
		<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>
	
</head>
<body>
	<div id="map" style="width:100%;height:500px;"></div>
	<p>
	<input type="button" value="교통정보 보기" onclick="setOverlayMapTypeId('traffic')" />
	<input type="button" value="로드뷰 도로정보 보기" onclick="setOverlayMapTypeId('roadview')" />
	<input type="button" value="지형정보 보기" onclick="setOverlayMapTypeId('terrain')" />
	<input type="button" value="지적편집도 보기" onclick="setOverlayMapTypeId('use_district')" />
	</p>

	<script>
	//지도 띄어주기
	var mapContainer = document.getElementById('map'),
	//지도를 표시할 div
	mapOption = {
		center: new kakao.maps.LatLng(37.5279, 127.0055),	
		level: 4 //지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); //지도를 생성한다.

	//지도에 추가된 지도타입정보를 가지고 잇을 변수이다.
	var currentTypeId;
	//버튼이 클릭되면 호출되는 함수이다.
	function setOverlayMapTypeId(maptype){
		var changeMaptype;
		
		//maptype에 따라 지도에 추가할 지도타입을 결정한다.
		if(maptype==='traffic') {
			//교통정보 지도타입
			changeMaptype = kakao.maps.MapTypeId.TRAFFIC;			
		} else if(maptype==='roadview') {
			//로드뷰 도로정보 지도타입
			changeMaptype = kakao.maps.MapTypeId.ROADVIEW;
		} else if(maptype==='terrain') {
			//지형정보 지도타입
			changeMaptype = kakao.maps.MapTypeId.TERRAIN;
		} else if(maptype==='use_district') {
			//지적편집도 지도타입
			changeMaptype = kakao.maps.MapTypeId.USE_DISTRICT;
		} 
		
		//이미 등록된 지도 타입이 있으면 제거합니다
		if(currentTypeId) {
			map.removeOverlayMapTypeId(currentTypeId);
		}
		
		//maptype에 해당하는 지도타입을 지도에 추가해준다.
		map.addOverlayMapTypeId(changeMaptype);
		
		//지도에 추가된 타입정보를 갱신한다.
		currentTypeId = changeMaptype;	
	}
	
	</script>

</body>
</html>