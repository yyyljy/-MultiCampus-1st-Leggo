<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>������ ����� ��Ʈ�� �ø���</title>
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
	font-family: 'Malgun Gothic', '���� ���', sans-serif;
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
		<!-- ����Ÿ�� ��Ʈ�� div�Դϴ� -->
		<div class="custom_typecontrol raidus_border" style="background-color: yellow;">
			<span id="btnRoadmap" class="selected_btn"
			onclick="setMapType('roadmap')">����</span>
			<span id="btnSkyview" class="btn"
			onclick="setMapType('skyview')">��ī�̺�</span>
			<span id="btnRoadview" class="btn"
			onclick="setMapType('roadview')">�ε��</span>
		</div>
		
		<!-- ���� Ȯ��, ��� ��Ʈ�� div�Դϴ� -->
		<!-- <div class="custom_zoomcontrol radius_border">
			<span onclick="zoomIn()"><img src="http://t1.daumcdn.net/
			localimg/localimages/07/mapapidoc/ico_plus.png" alt="Ȯ��">
			</span>
			<span onclick="zoomOut()"><img src="http://t1.daumcdn.net/
			localimg/localimages/07/mapapidoc/ico_minus.png" alt="���">
			</span>	
		</div> -->
	</div>
	<script>
	
	var mapContainer = document.getElementById('map'),
	//������ ǥ���� div
	mapOptions = {
		center: new kakao.maps.LatLng(37.5279, 127.0055),
		//������ �߽���ǥ
		level: 3 //������ Ȯ�� ����
	}
	//������ �����մϴ�.
	var map = new kakao.maps.Map(mapContainer,mapOptions);
	
	//������ �߰��� ����Ÿ�������� ������ ���� �����̴�.
	var currentTypeId;
	
	//����Ÿ�� ��Ʈ���� ���� �Ǵ� ��ī�̺� ��ư�� Ŭ���ϸ� ȣ��Ǿ� ����Ÿ���� �ٲٴ� �Լ��̴�.
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
		//�̹� ��ϵ� ���� Ÿ���� ������ �����Ѵ�.
		if(changeMaptype) {
			map.removeOverlayMapTypeId(changeMaptype);
		}
		//maptype�� �ش��ϴ� ����Ÿ���� ������ �߰����ش�.
		map.addOverlayMapTypeId(changeMaptype);
		//������ �߰��� Ÿ�������� �����Ѵ�.
		currentTypeId = changeMaptype;
		
	}
	
	
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);
	
	// ���� Ȯ��, ��� ��Ʈ�ѿ��� Ȯ�� ��ư�� ������ ȣ��Ǿ� ������ Ȯ���ϴ� �Լ��Դϴ�
	/* function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	} */

	// ���� Ȯ��, ��� ��Ʈ�ѿ��� ��� ��ư�� ������ ȣ��Ǿ� ������ Ȯ���ϴ� �Լ��Դϴ�
	/* function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	} */
		
	</script>
</body>
</html>