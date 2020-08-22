<%@page import="com.iot.parkingAPI.parkingjsonVO"%>	
<%@page import="java.util.ArrayList"%>
<%@page import="com.iot.parking.parkingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>다른 이미지로 마커 생성하기</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be626cc1f959d4787a1d8381c33922e7&libraries=services,clusterer,drawing">
	</script>
<style type="text/css">
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
	font-family: Adobe 명조 Std M;
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

</head>
<body>
<!--======================================================HTML===================================================-->
	<div id="map" style="width: 100%; height: 500px;"></div>
	<p>
		<!-- <button onclick="currentLoc()">현재위치</button>
		<button onclick="showMarkers()">주변 주차장</button> -->
		<br>
	</p>
	<!-- 지도 사이즈 -->
<!--=========================================================================================================-->
<!-- java 쓰기 -->
	<%
		List<parkingVO> list = (List<parkingVO>) request.getAttribute("parkingInfo");
		int size = list.size();
		ArrayList<parkingjsonVO> jsonList = (ArrayList<parkingjsonVO>)request.getAttribute("parkingjson");
	%>
<!--=========================================================================================================-->
<!-- JQuery 쓰기 -->
	<script type="text/javascript">
	open = false;
	curSplit = "";

/*=======================================지도 생성입니다========================================  */	
	// 지도를 표시할 div 
	var mapContainer = document.getElementById('map'), 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.501427, 127.039697), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};
	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
/*==============================================일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다===============  */
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
/*========================================================현재위치===================================================== */	
	//마커가 표시될 위치입니다 
	function currentLoc() {
		if(navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude; //위도
			lng = position.coords.longitude; //경도
			locPosition = new kakao.maps.LatLng(lat, lng), //마커가 표시될 위치
			message = '';
			//마커와 인포윈도우를 표시한다.
			displayMarker(locPosition,message);
			});
	 	
			 var level = map.getLevel();
			    
			    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
			    map.setLevel(level - 2);
			    
			    }
	}
	//지도에 마커와 인포윈도우를 표시하는 함수이다.
	function displayMarker(locPosition, message){
						
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position : locPosition 
			});
			//출발지 처리                                         
			var curString = locPosition.toCoords().toString();
			    curSplit = curString.split(', ');
			         
			    curSplit[0] = curSplit[0].substring(1, curSplit[0].length - 1);
			    curSplit[1] = curSplit[1].substring(0, curSplit[1].length - 2);
			         
			    message='<div id="infoWindow">현재위치 ';
			
			//인포윈도우에 표시할 내용
			var iwContent = message,
				iwRemoveable = true;
			//인포윈도우를 생성한다.
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});
			  function showCurrent() {
					if(close==false){
						setMarkers(map) 
						infowindow.open(map)
						close=true;
					}
					else{
						infowindow.open(null)
						close=false
					}
				}
			
			
			//인포윈도우를 마커위에 표시한다.
			infowindow.open(map,marker);
			//지도 중심좌표를 접속위치로 변경한다.
			map.setCenter(locPosition);
	}	
/* ============================================================================================= */	
	// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
	function removeCircles() {         
	    for (var i = 0; i < circles.length; i++) {
	        circles[i].circle.setMap(null);    
	        circles[i].polyline.setMap(null);
	        circles[i].overlay.setMap(null);
	    }         
	    circles = [];
	}

var imageSrc = '/leggo/images/parking_icon.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(54, 59), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),<%-- ,
    markerPosition1 = new kakao.maps.LatLng(37.5033, 127.0387); // 마커가 표시될 위치입니다
    markerPosition2 = new kakao.maps.LatLng(<%=(double)list.get(0).getLat()%>, 
    		<%=(double)list.get(0).getLng()%>); // 마커가 표시될 위치입니다
--%>	
	    <%for (int i = 0; i < size; i++) {
				parkingVO vo = list.get(i);
				parkingjsonVO jsonVO = jsonList.get(i);	
				int curAvaliable = (int)(jsonVO.getCapacity() - jsonVO.getCur_parking());		//현재 주차 가능 대수 계산
				
				if (vo == null)
					continue;
				double lat = vo.getLat();
				double lng = vo.getLng();
				String name = vo.getParking_name();
		%>
		// 마커가 표시될 위치입니다
		markerPosition<%=i%> = new kakao.maps.LatLng(<%=lat%>,<%=lng%>); 
	        
		    // 마커를 생성합니다	
		    var marker<%=i%> = new kakao.maps.Marker({
		        position: markerPosition<%=i%>,
		        image: markerImage // 마커이미지 설정 
		     });
/*==========================================주차장 info window==============================================*/ 

            var iwContent<%=i%> = 	
                '<div class="popupWindow">'+	
                '<strong><%=name%> 공영 주차장</stro<br/>'+	
                '<table>' + 	
                	'<tr>' + 	
                		'<th>총 주차 자리</th>' +	
                		'<th>현재 주차 가능</th>' +	
                		'<th>기본주차요금</th>' +	
                	'</tr>' +	
                	'<tr>' + 	
	            		'<td><%= (int)jsonVO.getCapacity() %></td>' +	
	            		'<td><%= curAvaliable %></td>' +	
	            		'<td><%= (int)jsonVO.getRates() %>원</td>' +	
	            	'</tr>' +	
	            	'<tr>' + 	
	            		'<th colspan="3">주간 운영시간</th>' +	
	            	'</tr>' +	
	            	'<tr>' + 	
	            		'<td colspan="3"><%= jsonVO.getWeekday_begin_time() %> ~ <%= jsonVO.getWeekday_end_time() %></td>' +	
	            	'</tr>' +	
	            	'<tr>' + 	
	            		'<th colspan="3">주말 운영시간</th>' +	
	            	'</tr>' +	
	            	'<tr>' + 	
	            		'<td colspan="3"><%= jsonVO.getWeekend_begin_time() %> ~ <%= jsonVO.getWeekend_end_time() %></td>' +	
	            	'</tr>' +	
	            	'<tr>' + 	
	            		'<th colspan="3">휴일 운영시간</th>' +	
	            	'</tr>' +	
	            	'<tr>' + 	
	            		'<td colspan="3"><%= jsonVO.getHoliday_begin_time() %> ~ <%= jsonVO.getHoliday_end_time() %></td>' +	
	            	'</tr>' +	
                '</table>' +	
                '<br/><a href="/leggo/getParkingJsonVO.do?parking_code=' + <%= jsonVO.getParking_code() %> + '"><button id="btnStyle" style="color:white;">예약하기</button></a>'+	
                '<button style="background-color: #f95c4e;">'+	
                '<a href="/leggo/findRoad/setEnd.do?lati='+<%=lat%>+'&longi='+<%=lng%>+'&name='+encodeURI(encodeURIComponent("<%= name %>"))+'">길찾기'+	
                '</a></button></div>';

			// 인포윈도우를 생성합니다
			var infowindow<%=i%> = new kakao.maps.InfoWindow({
			    content : iwContent<%=i%>,
			});
			    
		 	// 마커가 지도 위에 표시되도록 설정합니다
		    marker<%=i%>.setMap(map);
   		  
 /*=========================================================================================================*/    		
	 

// 마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker<%=i%>, 'click', function() {
      // 마커 위에 인포윈도우를 표시합니다
      if(open==false){
      infowindow<%=i%>.open(map, marker<%=i%>);
      open=true;
      }
      else{
      infowindow<%=i%>.close(map, marker<%=i%>); 
      open=false;
      }
});
	function closeall(map){
	infowindow<%=i%>.close(map, marker<%=i%>); 
	}
<%}%>
	
/*=====*/
 // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
    function setMarkers(map) {
        <%for (int i = 0; i < size; i++) {
				parkingVO vo = list.get(i);
				if (vo == null)
					continue;%> marker<%=i%>.setMap(map);
            	
          <%}%>
     }
 // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
    function showMarkers() {
		if(open==false){
			setMarkers(map) 
			open=true;
		}
		else{
			setMarkers(null);  
			open=false;
		}
	}
/*===============================================출발도착 메서드=================================================  */
     
     function end(lati, longi) {
        //alert("!!!" + lati +" " + longi);
        $.get("/leggo/findRoadP/end.do",
              {"lati":lati,
               "longi":longi},
              function(data) {
                 endStr = lati + ", " + longi;
                 alert("도착지를 선택하셨습니다.");
                 alert("길찾기를 원하시면 '길찾기 버튼을 눌러주세요'");
                 $('#input_end_lat').val(lati);
                 $('#input_end_lng').val(longi);   
              },
        "text")
     }

</script>
</body>
</html>