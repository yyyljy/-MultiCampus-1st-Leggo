<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Ŭ���� ��ġ�� ��Ŀ ǥ���ϱ�</title>
	<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>
	
</head>
<body>
	<div id="map" style="width:100%;height:500px;"></div>
	<p><em>������ Ŭ�����ּ���!</em></p>
	<div id="clickLatlng"></div>
	<script>
		//������ ǥ���� div
		var mapContainer = document.getElementById('map'),
		mapOptions = {
			center: new kakao.maps.LatLng(37.5279, 127.0055),	
			level: 3// ������ Ȯ�� ����
		};
		//������ �����մϴ�.
		var map = new kakao.maps.Map(mapContainer,mapOptions);
		
		//������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�.
		var marker = new kakao.maps.Marker({
			//���� �߽���ǥ�� ��Ŀ�� �����մϴ�.	
			position: map.getCenter()
		});
		//������ ��Ŀ�� ǥ���մϴ�.
		marker.setMap(map);
		
		//������ Ŭ�� �̺�Ʈ�� ����մϴ�.
		//������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
		kakao.maps.event.addListener(map,'click', function(mouseEvent) {
			//Ŭ���� ����, �浵 ������ �����ɴϴ�
			var latlng = mouseEvent.latLng;
			//��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
			marker.setPosition(latlng);
			var message = 'Ŭ���� ��ġ�� ������' + latlng.getLat() + '�̰�,';
			message += '�浵��' + latlng.getLng() + '�Դϴ�';
			
			var resultDiv = document.getElementById('clickLatlng');
			resultDiv.innerHTML = message;
		});
	</script>	
</body>
</html>