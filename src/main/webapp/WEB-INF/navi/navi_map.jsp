<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>좌표로 주소를 얻어내기</title>
	<style>
    .map_wrap {position:relative;width:100%;height:500px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;margin-left:25px; background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#des{color:fuchsia; text-align:center;}
	body{
		padding: 10px;
	}
	.info {
		position: relative;
		top: 5px;
		left: 5px;
		border-radius: 6px;
		border: 1px solid #ccc;
		border-bottom: 2px solid #ddd;
		font-size: 12px;
		padding: 5px;
		background: #fff;
		list-style: none;
		margin: 0;
	}
	
	.info:nth-of-type(n) {
		border: 0;
		box-shadow: 0px 1px 2px #888;
	}
	
	.info .label {
		display: inline-block;
		width: 50px;
	}
	
	.number {
		font-weight: bold;
		color: #00a0e9;
	}
	
	.popupWindow {
		font-family: 배달의민족 한나는 열한살;
	   margin:0;
	   width: 200px;
	   /* height: 200px; */
	   text-align: center;
	}
	#infoWindow{
	   font-family: 배달의민족 한나는 열한살;
	   font-size: 18px;
	   color:#ffff;
	   width: 147px;
	   margin: 0;
	   height: 40px;
	    padding: 5px;
	    text-align: center; 
	    background-color: orange;
	}
	
	
	#btnStyle {
		background-color: #365DA2;
		color: white;
	}
	</style>
	<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?
	appkey=be626cc1f959d4787a1d8381c33922e7&
	libraries=services,clusterer,drawing"></script>

</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:110%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
</div>


<script>
curSplit = "";
//strAddr="";
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        disableDoubleClickZoom: true,
        level: 4 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
    
//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다.
var mapTypeControl = new kakao.maps.MapTypeControl();
//마커가 표시될 위치입니다 
if (navigator.geolocation) {
	navigator.geolocation.getCurrentPosition(function(position) {
		var lat = position.coords.latitude; //위도
		var lng = position.coords.longitude; //경도
		var locPosition = new kakao.maps.LatLng(lat, lng);//마커가 표시될 위치
				
		//출발지를 현재위치로 고정
		curString = locPosition.toCoords().toString();
		curSplit = curString.split(', ');
		//alert(curSplit);
		curSplit[0] = curSplit[0].substring(1, curSplit[0].length - 1);
		curSplit[1] = curSplit[1].substring(0, curSplit[1].length - 1);
		$('#input_start_lat').val(curSplit[0]);
		$('#input_start_lng').val(curSplit[1]);
		
		//마커와 인포윈도우를 표시한다.
		displayMarker(locPosition);
	});
} else {
	consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
}    
    
//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 
//정의하는데 TOPRIGHT은 오른쪽
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
//지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다.
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);
//버튼 클릭에 따라 지도 확대,축소 기능을 막거나 풀고 싶은 경우에는
//map.setZoomable함수를 사용합니다
//마우스 휠로 지도 확대, 축소 가능여부를 설정하지 못하게 막습니다
map.setZoomable(true);    
    
    
//현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);
//마커가 표시될 위치입니다 
function currentLoc() {
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
		lat = position.coords.latitude; //위도
		lng = position.coords.longitude; //경도
		locPosition = new kakao.maps.LatLng(lat, lng), //마커가 표시될 위치
		
		//출발지를 현재위치로 고정
		curString = locPosition.toCoords().toString();
		curSplit = curString.split(', ');
		//alert(curSplit);
		curSplit[0] = curSplit[0].substring(1, curSplit[0].length - 1);
		curSplit[1] = curSplit[1].substring(0, curSplit[1].length - 1);
		$('#input_start_lat').val(curSplit[0]);
		$('#input_start_lng').val(curSplit[1]);
		
		//message = '';
		//마커와 인포윈도우를 표시한다.
		displayMarker(locPosition);
		});		    
	}
}
//지도에 마커와 인포윈도우를 표시하는 함수이다.
function displayMarker(locPosition) {		
	// 클릭한 위치를 표시할 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position : locPosition 
	});
	var infowindow = new kakao.maps.InfoWindow({zindex:1});
	//alert(locPosition.toCoords().toString());
	curString = locPosition.toCoords().toString();
	curSplit = curString.split(', ');
	//alert(curSplit);
	curSplit[0] = curSplit[0].substring(1, curSplit[0].length - 1);
	curSplit[1] = curSplit[1].substring(0, curSplit[1].length - 1);
	//alert(curSplit);
	//var strAddr = new String("서울 강남구 테헤란로 212");
	
	/* strAddr = '서울 강남구 테헤란로 212'; */
	//strAddr = '';
	
	/* strAddr = encodeURI(addr); */
	/* alert(strAddr) */
	strAddr = '';
	//alert(strAddr)
	message='<div id="infoWindow">현재위치 ' + '</div>';
	/* !!!!!!!!!!!!!!!!!!!!1 */
/* 	message='<div style="color:fuchsia; padding-left:20px;">현재위치&nbsp;&nbsp;'+
	'<input type="button" class="color2" value="출발" style="background-color: #006be0; font-size: 12pt;" onclick="start('+curSplit[0]+', '+curSplit[1]+', '+strAddr+')"/></div>'; */
	
	
    // 마커를 클릭한 위치에 표시합니다 
    marker.setPosition(locPosition);
    marker.setMap(map);
    // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
    infowindow.setContent(message);
    infowindow.open(map, marker);
	//지도 중심좌표를 접속위치로 변경한다.
	map.setCenter(locPosition);	
}
//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';        
            var content = '<div class="bAddr"><pre id="des">도착위치</pre>' +
                            '<span class="title" style="text-align:center;">법정동 주소정보</span>' + 
                            detailAddr + '</div>';         
          	/* content += '<div class="bAddr">'+ 
          	mouseEvent.latLng.getLat() + ', ' +
        	mouseEvent.latLng.getLng() + '</div><br/>'; */
        	
        	var desString = mouseEvent.latLng.toCoords().toString();
        	desSplit = desString.split(', ');
        	
        	//alert(desSplit)
        	
        	desSplit[0] = desSplit[0].substring(1, desSplit[0].length - 1);
			desSplit[1] = desSplit[1].substring(0, desSplit[1].length - 1);
			/* endAddr = result[0].address.address_name; */
			endAddr='';
			//alert(endAddr)
			//alert(desSplit)
        	
			/* onclick="end('+desSplit[0]+', '+desSplit[1]+', '+endAddr+')" */
			content += '<div style="padding: 1px; text-align:center;">&nbsp;&nbsp;'+
	            		'<input type="button" class="color2" value="도착" style="background-color: #f95c4e;font-size: 12pt;" onclick="end('+desSplit[0]+', '+desSplit[1]+', '+endAddr+')"/>'+
	            				/*'<button><a href="https://map.kakao.com/?eX='+desSplit[0]+'&eY='+desSplit[1]+'&eName=아가방빌딩&sX='+curSplit[0]+'&sY='+curSplit[1]+'&sName=멀티캠퍼스 역삼" target="_blank" style="text-decoration:none">길찾기'+
	            				'</a></button></div>'; */
	            		'<button style="background-color: #f95c4e;">'+
	            		'<a href="https://map.kakao.com/?eX='+desSplit[0]+'&eY='+desSplit[1]+'&eName='+ endAddr +'&sX='+curSplit[0]+'&sY='+curSplit[1]+'&sName=현재위치" target="_blank" style="font-size: 12pt; text-decoration:none">길찾기'+
	            		'</a></button></div>';
            //클릭한 위도, 경도 정보를 가져옵니다
            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);
            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});
function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
/*출발지 좌표*/
function start(lati, longi, address) {
	//alert("!!!" + lati +" " + longi);
	$(document).ready(function() {
		$.get("/leggo/findRoad/start.do",
				{"lati":lati,
				 "longi":longi,
				 "addr":address
				 },
				function(data) {
					startStr = lati + ", " + longi;
					//alert("???????????? " + startStr)
					alert("출발지를 선택하셨습니다.")
					$('#input_start_lat').val(lati);
					$('#input_start_lng').val(longi);
					$('#input_start').val(startStr);
					
					//$('#input_start_addr').val(address);
				},
		"text")
	});
}
/*도착지 좌표*/
function end(lati, longi, address) {
	//alert("!!!" + lati +" " + longi);
	$(document).ready(function() {
		$.get("/leggo/findRoad/end.do",
				{"lati":lati,
				 "longi":longi
				 },
				function(data) {
					endStr = lati + ", " + longi;
					//alert("???????????? " + endStr)
					alert("도착지를 선택하셨습니다.")
					$('#input_end_lat').val(lati);
					$('#input_end_lng').val(longi);
					$('#input_end').val(endStr);
					
					//$('#input_end_addr').val(address);
				},
		"text")
	});
}
</script>
</body>
</html>