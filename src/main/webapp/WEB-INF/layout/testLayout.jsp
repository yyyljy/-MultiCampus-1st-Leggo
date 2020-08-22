<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LEGGO</title>
</head>
<body>
	<div>
		<!-- CONTENT -->
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>
</body>
<!-- Scripts -->
<script src="/leggo/js/jquery.min.js"></script>
<script src="/leggo/js/browser.min.js"></script>
<script src="/leggo/js/breakpoints.min.js"></script>
<script src="/leggo/js/main.js"></script>
</html>