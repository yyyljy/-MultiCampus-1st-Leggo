<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>
</head>
<body>
	<div id="map" style="width:100%;height:500px;"></div>
	<!-- 카카오 지도 -->
	<script type="text/javascript">
	//마커를 클릭하면 장소명을 표출할 인포윈도우이다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	//지도를 담을 영역의 DOM 래퍼런스(지도를 표시할 div)
	var mapContainer = window.document.getElementById('map'),
	//지도를 생성할 때 필요한 기본 옵션
	mapOptions = {
		//지도의 중심 좌표
		center: new kakao.maps.LatLng(36.332326,127.434211),	
		level: 3 //지도의 확대 레벨
	};
	//지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer,mapOptions);
	
	//장소 검색 객체를 생성합니다.
	var ps = new kakao.maps.services.Places();
	
	//키워드로 장소의 주변 범위를 재설정해서 장소를 마크해준다.
	ps.keywordSearch("대전역", placeSearchCB);
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

	//커스텀 오버레이에 표시할 컨텐츠입니다
	var content = '<div class="map-info-panel">'+
				   '<div class="heading">'+
				   '<strong><?=$view->title?></strong>'+
				   '<div class="close" onclick="closeOverlay()" title="닫기"></div>'+
				   '</div>'+
				   '<div class="body">'+
				   '<div class="cont">'+
				   '<i class="fa fa-map-marker"></i><?=mb_substr($view->address,5)?>'+
				   '</div>'+
				   '<a href="https://map.kakao.com/link/to/대전역,36.332326,127.434211" target="_blank" class="btn btn-primary btn-sm" role="button" target="_blank"><i class="fa fa-pencil hidden-xs hidden-sm"></i>길찾기</a>'+
				   '</div>'+
				   '</div>';
	
	
	
	//마커 위에 커스텀 오버레이를 표시합니다
	//마커를 중심으로 커스텀 오버레이를 표시하기 위해 CSS를 이용해 위치를 설정합니다
	var overlay = new kakao.maps.CustomOverlay({
		content: content,	
		map: map,
		position: marker.getPosition()
	});
	//마커를 클릭했을 때 커스텀 오버레이를 표시한다
	kakao.maps.event.addListener(marker,'click',function(){
		overlay.setMap(map);
	});
	//커스텀 오버레이를 닫기 위해 호출하는 함수이다
	function closeOverlay() {
		overlay.setMap(null);
	}
	}	
	
	
	
/* 	//커스텀 오버레이에 표시할 컨텐츠입니다
	var content = '<div class="map-info-panel">'+
				   '<div class="heading">'+
				   '<strong><?=$view->title?></strong>'+
				   '<div class="close" onclick="closeOverlay()" title="닫기"></div>'+
				   '</div>'+
				   '<div class="body">'+
				   '<div class="cont">'+
				   '<i class="fa fa-map-marker"></i><?=mb_substr($view->address,5)?>'+
				   '</div>'+
				   '<a href="https://map.kakao.com/link/to/대전역,36.332326,127.434211" target="_blank" class="btn btn-primary btn-sm" role="button" target="_blank"><i class="fa fa-pencil hidden-xs hidden-sm"></i>길찾기</a>'+
				   '</div>'+
				   '</div>'; */	
	
	
	
	
/* 	
	//커스텀 오버레이에 표시할 컨텐츠입니다
	var content = '<div class="map-info-panel">'+
				   '<div class="heading">'+
				   '<strong><?=$view->title?></strong>'+
				   '<div class="close" onclick="closeOverlay()" title="닫기"></div>'+
				   '</div>'+
				   '<div class="body">'+
				   '<div class="cont">'+
				   '<i class="fa fa-map-marker"></i><?=mb_substr($view->address,5)?>'+
				   '</div>'+
				   '<a href="https://map.kakao.com/link/to/대전역,36.332326,127.434211" target="_blank" class="btn btn-primary btn-sm" role="button" target="_blank"><i class="fa fa-pencil hidden-xs hidden-sm"></i>길찾기</a>'+
				   '</div>'+
				   '</div>';
	
	//마커 위에 커스텀 오버레이를 표시합니다
	//마커를 중심으로 커스텀 오버레이를 표시하기 위해 CSS를 이용해 위치를 설정합니다
	var overlay = new kakao.maps.CustomOverlay({
		content: content,	
		map: map,
		position: marker.getPosition()
	});
	//마커를 클릭했을 때 커스텀 오버레이를 표시한다
	kakao.maps.event.addListener(marker,'click',function(){
		overlay.setMap(map);
	});
	//커스텀 오버레이를 닫기 위해 호출하는 함수이다
	function closeOverlay() {
		overlay.setMap(null);
	} */
	</script>

</body>
</html>