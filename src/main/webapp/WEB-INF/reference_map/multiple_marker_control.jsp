<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <meta charset="utf-8">
    <title>������ ��Ŀ �����ϱ�</title>
    <script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<p>
    <button onclick="hideMarkers()">��Ŀ ���߱�</button>
    <button onclick="showMarkers()">��Ŀ ���̱�</button>
</p> 
<em>Ŭ���� ��ġ�� ��Ŀ�� ǥ�õ˴ϴ�!</em>

<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.5279, 127.0055), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

// ������ Ŭ�������� Ŭ���� ��ġ�� ��Ŀ�� �߰��ϵ��� ������ Ŭ���̺�Ʈ�� ����մϴ�
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    // Ŭ���� ��ġ�� ��Ŀ�� ǥ���մϴ� 
    addMarker(mouseEvent.latLng);             
});

// ������ ǥ�õ� ��Ŀ ��ü�� ������ ���� �迭�Դϴ�
var markers = [];

// ��Ŀ �ϳ��� �������� ǥ���մϴ� 
addMarker(new kakao.maps.LatLng(37.5279, 127.0055));

// ��Ŀ�� �����ϰ� �������� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position) {
    
    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
        position: position
    });

    // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
    marker.setMap(map);
    
    // ������ ��Ŀ�� �迭�� �߰��մϴ�
    markers.push(marker);
}

// �迭�� �߰��� ��Ŀ���� ������ ǥ���ϰų� �����ϴ� �Լ��Դϴ�
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}

// "��Ŀ ���̱�" ��ư�� Ŭ���ϸ� ȣ��Ǿ� �迭�� �߰��� ��Ŀ�� ������ ǥ���ϴ� �Լ��Դϴ�
function showMarkers() {
    setMarkers(map)    
}

// "��Ŀ ���߱�" ��ư�� Ŭ���ϸ� ȣ��Ǿ� �迭�� �߰��� ��Ŀ�� �������� �����ϴ� �Լ��Դϴ�
function hideMarkers() {
    setMarkers(null);    
}
</script>
</body>
</html>