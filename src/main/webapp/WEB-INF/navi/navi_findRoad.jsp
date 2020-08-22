<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <div>
		<input type="text" id="findmap" class="color2" value="길찾기" style="color:black; width:100%; background-color:#ffffff; font-size: 14pt;"/>
		
	</div> -->
	
	
	<!-- <div>
		<input type="text" id="findmap" class="color2" value="길찾기 결과" style="color:black; width:100%; background-color:#ffffff; font-size: 14pt;"/>	
	</div> -->
		<script type="text/javascript">
		<%String findmap=(String)request.getAttribute("findmap"); %>
	
		<%-- alert("<%=findmap%>"); --%>
		$(document).ready(function(){
			if(findmap=="") {
				findmap="all";
			}	
		});	
		</script>
		<a id="chk" href ="<%=findmap%>" class="w3-button" target="_self">길찾기 결과</a>
		<script type="text/javascript">
		chk.click();
		</script>
</body>
</html>