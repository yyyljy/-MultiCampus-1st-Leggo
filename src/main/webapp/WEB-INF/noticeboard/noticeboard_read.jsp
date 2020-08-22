<!DOCTYPE html>

<%@page import="com.iot.noticeboard.noticeboardVO"%>
<%@page import="java.util.ArrayList"%>

<html lang="en">
<head>
	<title>LEGGO</title>
	<meta charset="UTF-8">
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
		body {font-family: "Open Sans"}
		#line {
			border-top: 2px solid #365da2;
		}
		.watchreview{
			border-top: 2px solid #365da2;
		}
	</style> 

	
</head>

<body class="w3-light-grey"> 
		<% noticeboardVO list = (noticeboardVO)request.getAttribute("readnotice"); %>
		<div class="w3-content" style="max-width:1600px">
	
	      <div class="w3-container w3-white w3-margin w3-padding-large">
	        <div class="w3-center">
	          <h3><%= list.getTitle()%></h3>
	          <h5><%= list.getMng_id()%></h5>
	          <span><%= list.getUpdate_date()%></span>
	        </div>
			<div id="line">
				
			</div>
	        <div class="w3-justify">
	          <p>
				<%= list.getContent()%>
	          <p class="w3-right"><a href="/leggo/noticeboardmain.do" class="button">목록으로</a></p>
	       
	      </div>
      </div>
 </div>
</body> 
</html>


