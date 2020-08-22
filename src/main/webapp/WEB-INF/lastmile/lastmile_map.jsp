<%@page import="com.iot.lastmile.LastmileVO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
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

/*      .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border-bottom: 2px solid #ddd;background-color:#fff;}  */
/*     .overlay_info a {display: block; background: #d95050; background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0} */
/*     .overlay_info a strong {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png) no-repeat; padding-left: 27px;} */
/*     .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 56px} */
/*     .overlay_info img {vertical-align: top;} */
/*     .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 24px; white-space: normal} */
/*     .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}  */

</style>

</head>
<body>
<!--======================================================HTML===================================================-->
	<div id="map" style="width: 100%; height: 500px;"></div>
	<p>
		<!-- <button onclick="currentLoc()">현재위치</button>
		<button onclick="showMarkers()">주변 주차장</button> -->
		<!-- <button onclick="hideMarkers()">주변 주차장 감추기</button> -->
		<!-- button onclick="removeCircles()">반경 모두 지우기</button> -->
		<br>
	</p>
	<!-- 지도 사이즈 -->
	
<!--=========================================================================================================-->
<!-- java 쓰기 -->
	<%
		List<LastmileVO> list = (List<LastmileVO>) request.getAttribute("aroundLastmile");
		int size = list.size();
	%>
<!--=========================================================================================================-->
<!-- JQuery 쓰기 -->
	<script type="text/javascript">
	open = false
/*=======================================지도 생성입니다========================================  */	
	// 지도를 표시할 div 
	var mapContainer = document.getElementById('map'), 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.501427, 127.039697), // 지도의 중심좌표
	    disableDoubleClickZoom: true,
	    level: 3 // 지도의 확대 레벨
	};
	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	
/*==============================================일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다===============  */
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
/*==============================================================================================================================*/	
	// 원이 그려지고 있는 상태를 가지고 있을 변수입니다
	var drawingFlag = false; 
	var centerPosition; // 원의 중심좌표 입니다
	var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
	var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
	var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
	var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

	var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다
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
			         	
			message='<div id="infoWindow">현재위치 ' + '</div>';
		
		
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
	
	//마커가 표시될 위치입니다 
	function currentLoc() {
		if(navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude; //위도
			lng = position.coords.longitude; //경도
			locPosition = new kakao.maps.LatLng(lat, lng), //마커가 표시될 위치
			//message = '';
			//마커와 인포윈도우를 표시한다.
			displayMarker(locPosition);
			});		    
		}
	}

	// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
	// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {

	    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';

	    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';

	    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="info">';
	    content += '    <li>';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'

	    return content;
	}

	
var imageSrc = '/leggo/images/BikeMark.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(54, 59), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),<%-- ,
    markerPosition1 = new kakao.maps.LatLng(37.5033, 127.0387); // 마커가 표시될 위치입니다
    markerPosition2 = new kakao.maps.LatLng(<%=(double)list.get(0).getLat()%>, 
    		<%=(double)list.get(0).getLng()%>); // 마커가 표시될 위치입니다
--%>	
	    <%for (int i = 0; i < size; i++) {
				LastmileVO vo = list.get(i);
				if (vo == null)
					continue;
				double lat = vo.getStationLatitude();
				double lng = vo.getStationLongitude();
				String name = vo.getStationName();
				String splitName = name.substring(name.indexOf(" ")+1);
		%>
		// 마커가 표시될 위치입니다
		markerPosition<%=i%> = new kakao.maps.LatLng(<%=lat%>,<%=lng%>); 
	        
		    // 마커를 생성합니다	
		    var marker<%=i%> = new kakao.maps.Marker({
		        position: markerPosition<%=i%>,
		        image: markerImage // 마커이미지 설정 
		     });
/*==========================================주차장 info window==============================================*/    		
		 // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			 var iwContent<%=i%> = 
				 '<strong><%=splitName%></strong>' +
				 '<div class="popupWindow">' +
					'총 거치대 개수 : <%=vo.getRackTotCnt()%>개<br/>' +
					'사용 가능 자전거 : <%=vo.getParkingBikeTotCnt()%>대<br/>' +
					'<a href="/leggo/findRoad/setEnd.do?lati=' + <%=vo.getStationLatitude()%> 
								+ '&longi=' + <%=vo.getStationLongitude()%> + '&name=' + encodeURI(encodeURIComponent("<%= splitName %>")) + '">' +
					'<button id="btnStyle" style="color:white;">도착</button>' +
					'</a>' + 
				'</div>',
			    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

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
				LastmileVO vo = list.get(i);
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

  /*   // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
    function hideMarkers() {
        setMarkers(null);    
    } */
    
 /*    kakao.maps.event.addListener(map, 'idle', function() {
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    }); */

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
    }

    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
/*     function displayCenterInfo(result, status) {
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
    } */
    
    
    
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