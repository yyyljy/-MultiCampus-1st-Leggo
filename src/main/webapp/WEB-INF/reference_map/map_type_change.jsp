<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>���� Ÿ�� �ٲٱ�</title>
		<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>
	
</head>
<body>
	<div id="map" style="width:100%;height:500px;"></div>
	<p>
	<input type="button" value="�������� ����" onclick="setOverlayMapTypeId('traffic')" />
	<input type="button" value="�ε�� �������� ����" onclick="setOverlayMapTypeId('roadview')" />
	<input type="button" value="�������� ����" onclick="setOverlayMapTypeId('terrain')" />
	<input type="button" value="���������� ����" onclick="setOverlayMapTypeId('use_district')" />
	</p>

	<script>
	//���� ����ֱ�
	var mapContainer = document.getElementById('map'),
	//������ ǥ���� div
	mapOption = {
		center: new kakao.maps.LatLng(37.5279, 127.0055),	
		level: 4 //������ Ȯ�� ����
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); //������ �����Ѵ�.

	//������ �߰��� ����Ÿ�������� ������ ���� �����̴�.
	var currentTypeId;
	//��ư�� Ŭ���Ǹ� ȣ��Ǵ� �Լ��̴�.
	function setOverlayMapTypeId(maptype){
		var changeMaptype;
		
		//maptype�� ���� ������ �߰��� ����Ÿ���� �����Ѵ�.
		if(maptype==='traffic') {
			//�������� ����Ÿ��
			changeMaptype = kakao.maps.MapTypeId.TRAFFIC;			
		} else if(maptype==='roadview') {
			//�ε�� �������� ����Ÿ��
			changeMaptype = kakao.maps.MapTypeId.ROADVIEW;
		} else if(maptype==='terrain') {
			//�������� ����Ÿ��
			changeMaptype = kakao.maps.MapTypeId.TERRAIN;
		} else if(maptype==='use_district') {
			//���������� ����Ÿ��
			changeMaptype = kakao.maps.MapTypeId.USE_DISTRICT;
		} 
		
		//�̹� ��ϵ� ���� Ÿ���� ������ �����մϴ�
		if(currentTypeId) {
			map.removeOverlayMapTypeId(currentTypeId);
		}
		
		//maptype�� �ش��ϴ� ����Ÿ���� ������ �߰����ش�.
		map.addOverlayMapTypeId(changeMaptype);
		
		//������ �߰��� Ÿ�������� �����Ѵ�.
		currentTypeId = changeMaptype;	
	}
	
	</script>

</body>
</html>