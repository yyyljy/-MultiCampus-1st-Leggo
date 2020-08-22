<%@page import="com.iot.freeboard.freeboardVO"%>
<%@page import="com.iot.member.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='UTF-8' />
	<style type="text/css">
	</style>
</head> 
<body>

<% memberVO user = (memberVO)session.getAttribute("user"); %>
	<form action="/leggo/freeboardwrite.do" method="post">
	<div class="outer">
		<div class="top">
		</div>
		<div class="container">
		    <input type="hidden" name="user_id" value="<%=user.getUser_id()%>"/>
			<table class="table"> 
			<!-- table-hover클래스는 마우스를 올리면 회색이 생기게
			table-striped클래스는 홀수번째 테이블에 회색이 생겨있게-->
			<!-- table table-bordered 이 클래스는 테이블의 선 그어주기--> 
				<thead>
					<tr>
						<th id="freehead" colspan="4">자유게시판</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="title">글제목</th>
						<td><textarea class="boardwritecontent" rows="1" name="title"></textarea></td>
					</tr>
					<tr>
						<th class="title">글내용</th>
						<td><textarea class="boardwritecontent" rows="10" name="content"></textarea></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td id="freefoot" colspan="2"></td>
					</tr>
				</tfoot>
			</table>
			
			<!-- 버튼 -->
			<div class="allbtn">
				<button type="submit" id="brdsubtn">등록</button>
				<button type="button" id="delbtn" onclick="window.location.href='http://localhost:8088/leggo/freeboardmain.do'">취소</button>
			</div>
		</div> 
	</div>
	</form>
</body> 
</html>


