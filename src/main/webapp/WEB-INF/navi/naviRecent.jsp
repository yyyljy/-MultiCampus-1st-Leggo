<%@page import="com.iot.lastmile.RecentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iot.lastmile.FavoriteVO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
</head>
<body>
<!-- 	<div id="map" style="width: 100%; height: 600px;"> -->
		<% ArrayList<RecentVO> recentList = (ArrayList<RecentVO>)request.getAttribute("recentList"); %>
		<table class="boardtable table-hover table table-striped" id="NaviRecentTable">
		  	<thead>
		    	<tr>
			     	<th scope="col">대여소 이름</th>
			      	<th scope="col">위도</th>
			      	<th scope="col">경도</th>
			      	<th scope="col">길찾기로 이동</th>
		    	</tr>
		  	</thead>
		  	<tbody id="NaviRecentTable_body">
		  	<% for(int i=0;i<recentList.size();i++) { 
		  		String name = recentList.get(i).getLocation_name();
		  		String location_name = name.substring(name.lastIndexOf(".")+1);
		  		String url = "/leggo/findRoad/setEnd.do?lati=" + String.valueOf(recentList.get(i).getLatitude())
		  				+ "&longi=" + String.valueOf(recentList.get(i).getLongitude()) + "&name=" + URLEncoder.encode(location_name);%>
		    	<tr>
		    		<form action="" method="">
			      		<td><%= location_name %></td>
			      		<td><%= recentList.get(i).getLatitude() %></td>
			      		<td><%= recentList.get(i).getLongitude() %></td>
		    		</form>
		    		
		      		<td>
		      			<a href="<%= url %>">
		      				<button id="btnStyle" style="color:#365da2;">도착</button>
		      			</a>
		      		</td>
		    	</tr>
		    <% } %>
			</tbody>
		</table>
<!-- 	</div> -->
</body>
</html>