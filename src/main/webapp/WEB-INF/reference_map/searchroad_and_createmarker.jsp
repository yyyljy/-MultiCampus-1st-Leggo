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
	<!-- īī�� ���� -->
	<script type="text/javascript">
	//��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� �����������̴�
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	//������ ���� ������ DOM ���۷���(������ ǥ���� div)
	var mapContainer = window.document.getElementById('map'),
	//������ ������ �� �ʿ��� �⺻ �ɼ�
	mapOptions = {
		//������ �߽� ��ǥ
		center: new kakao.maps.LatLng(36.332326,127.434211),	
		level: 3 //������ Ȯ�� ����
	};
	//������ �����մϴ�
	var map = new kakao.maps.Map(mapContainer,mapOptions);
	
	//��� �˻� ��ü�� �����մϴ�.
	var ps = new kakao.maps.services.Places();
	
	//Ű����� ����� �ֺ� ������ �缳���ؼ� ��Ҹ� ��ũ���ش�.
	ps.keywordSearch("������", placeSearchCB);
	//Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�.
	function placeSearchCB(data,status,pagination){
		if(status == kakao.maps.services.Status.OK) {
			//�˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
			//LatLngBounds��ü�� ��ǥ�� �߰��մϴ�
			var bounds = new kakao.maps.LatLngBounds();
			for(var i=0; i<data.length; i++){
				displayMarker(data[i]);
				bounds.extend(new kakao.maps.LatLng(data[i].y,data[i].x));
			}
			//�˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
			map.setBounds(bounds);
		}
	}	
	
	//������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
	function displayMarker(place) {
		//��Ŀ�� �����ϰ� ������ ǥ���մϴ�
		var marker = new kakao.maps.Marker({
			map: map,
			position: new kakao.maps.LatLng(place.y, place.x)
		})
		
		//��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(marker,'click',function() {
			//��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
			infowindow.setContent('<div style="padding:5px;font-size:12px;">'
			+place.place_name+'</div>');
			infowindow.open(map, marker);
		});

	//Ŀ���� �������̿� ǥ���� �������Դϴ�
	var content = '<div class="map-info-panel">'+
				   '<div class="heading">'+
				   '<strong><?=$view->title?></strong>'+
				   '<div class="close" onclick="closeOverlay()" title="�ݱ�"></div>'+
				   '</div>'+
				   '<div class="body">'+
				   '<div class="cont">'+
				   '<i class="fa fa-map-marker"></i><?=mb_substr($view->address,5)?>'+
				   '</div>'+
				   '<a href="https://map.kakao.com/link/to/������,36.332326,127.434211" target="_blank" class="btn btn-primary btn-sm" role="button" target="_blank"><i class="fa fa-pencil hidden-xs hidden-sm"></i>��ã��</a>'+
				   '</div>'+
				   '</div>';
	
	
	
	//��Ŀ ���� Ŀ���� �������̸� ǥ���մϴ�
	//��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ� ���� CSS�� �̿��� ��ġ�� �����մϴ�
	var overlay = new kakao.maps.CustomOverlay({
		content: content,	
		map: map,
		position: marker.getPosition()
	});
	//��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���Ѵ�
	kakao.maps.event.addListener(marker,'click',function(){
		overlay.setMap(map);
	});
	//Ŀ���� �������̸� �ݱ� ���� ȣ���ϴ� �Լ��̴�
	function closeOverlay() {
		overlay.setMap(null);
	}
	}	
	
	
	
/* 	//Ŀ���� �������̿� ǥ���� �������Դϴ�
	var content = '<div class="map-info-panel">'+
				   '<div class="heading">'+
				   '<strong><?=$view->title?></strong>'+
				   '<div class="close" onclick="closeOverlay()" title="�ݱ�"></div>'+
				   '</div>'+
				   '<div class="body">'+
				   '<div class="cont">'+
				   '<i class="fa fa-map-marker"></i><?=mb_substr($view->address,5)?>'+
				   '</div>'+
				   '<a href="https://map.kakao.com/link/to/������,36.332326,127.434211" target="_blank" class="btn btn-primary btn-sm" role="button" target="_blank"><i class="fa fa-pencil hidden-xs hidden-sm"></i>��ã��</a>'+
				   '</div>'+
				   '</div>'; */	
	
	
	
	
/* 	
	//Ŀ���� �������̿� ǥ���� �������Դϴ�
	var content = '<div class="map-info-panel">'+
				   '<div class="heading">'+
				   '<strong><?=$view->title?></strong>'+
				   '<div class="close" onclick="closeOverlay()" title="�ݱ�"></div>'+
				   '</div>'+
				   '<div class="body">'+
				   '<div class="cont">'+
				   '<i class="fa fa-map-marker"></i><?=mb_substr($view->address,5)?>'+
				   '</div>'+
				   '<a href="https://map.kakao.com/link/to/������,36.332326,127.434211" target="_blank" class="btn btn-primary btn-sm" role="button" target="_blank"><i class="fa fa-pencil hidden-xs hidden-sm"></i>��ã��</a>'+
				   '</div>'+
				   '</div>';
	
	//��Ŀ ���� Ŀ���� �������̸� ǥ���մϴ�
	//��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ� ���� CSS�� �̿��� ��ġ�� �����մϴ�
	var overlay = new kakao.maps.CustomOverlay({
		content: content,	
		map: map,
		position: marker.getPosition()
	});
	//��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���Ѵ�
	kakao.maps.event.addListener(marker,'click',function(){
		overlay.setMap(map);
	});
	//Ŀ���� �������̸� �ݱ� ���� ȣ���ϴ� �Լ��̴�
	function closeOverlay() {
		overlay.setMap(null);
	} */
	</script>

</body>
</html>