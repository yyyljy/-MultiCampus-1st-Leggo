<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="color1 span-1">
		<ul class="actions stacked">
			<li>
			<li>
			<li>
			<li>
			<li>
			<li><a href="/leggo/myInfo.do" class="w3-button">회원정보</a></li>
			<li><a href='/leggo/point/select.do?user_id=<%=(String)session.getAttribute("user_id") %>' class="w3-button">포인트</a></li>
			<!-- <li><input type="submit" value="차량 정보" class="button fit color2" style="font-size: 20pt"/></li> -->
			<li><a href="/leggo/myResvList.do" class="w3-button">예약내역</a></li>
			<li><a href='/leggo/paylist.do?user_id=<%=(String)session.getAttribute("user_id") %>' class="w3-button">결제내역</a></li>
		</ul>
		<div id="adv" >
			<pre><code>
Advertise
Advertise
Advertise
			</code></pre>
		</div>
	</div>
</body>
</html>