<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				url: "/leggo/getLastmileAPI.do",
				type: "get",
				data: { },
				success:function(lastmileList) {
					rows = "";
					for(i=0;i<lastmileList.length;i++) {
						rows = rows + 
								"<tr><td>" + lastmileList[i].stationId + "</td>"
								+ "<td><a href='/leggo/index.do'>" + lastmileList[i].stationName + "</a></td>"
								+ "<td>" + lastmileList[i].rackTotCnt + "</td>"
								+ "<td>" + lastmileList[i].parkingBikeTotCnt + "</td>"
								+ "<td>" + lastmileList[i].shared + "</td>"
								+ "<td>" + lastmileList[i].stationLatitude + "</td>"
								+ "<td>" + lastmileList[i].stationLongitude + "</td></tr>"
					}
					
					$('#lastmileListTable_body').empty();
					$('#lastmileListTable_body').append(rows);
				}
			});
		});
	</script>
</head>
<body>
<!-- "table table-dark table-sm d-none"  -->
	<table class="hide" id="lastmileListTable" style="font-size:15px;">
	  	<thead>
	    	<tr>
		      	<th scope="col">대여소 ID</th>
		     	<th scope="col">대여소 이름</th>
		      	<th scope="col">거치대 개수</th>
		      	<th scope="col">주차 총 건수</th>
		     	<th scope="col">거치율</th>
		      	<th scope="col">위도</th>
		      	<th scope="col">경도</th>
	    	</tr>
	  	</thead>
	  	<tbody id="lastmileListTable_body">
	    	<tr>
	      		<td>Mark</td>
	      		<td>Mark</td>
	      		<td>Otto</td>
	      		<td>@mdo</td>
	      		<td>Mark</td>
	      		<td>Otto</td>
	      		<td>@mdo</td>
	    	</tr>
		    <tr>
		      	<td>Jacob</td>
		      	<td>Jacob</td>
		      	<td>Thornton</td>
		      	<td>@fat</td>
		      	<td>Jacob</td>
		      	<td>Thornton</td>
		      	<td>@fat</td>
		    </tr>
		    <tr>
		      	<td>Larry</td>
		      	<td>Larry</td>
		      	<td>the Bird</td>
		      	<td>@twitter</td>
		      	<td>Larry</td>
		      	<td>the Bird</td>
		      	<td>@twitter</td>
		    </tr>
		</tbody>
	</table>
	

</body>
</html>