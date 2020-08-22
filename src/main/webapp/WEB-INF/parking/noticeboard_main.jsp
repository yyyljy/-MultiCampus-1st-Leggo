<!DOCTYPE html>

<%@page import="com.iot.noticeboard.noticeboardVO"%>
<%@page import="com.iot.member.memberVO"%>
<%@page import="com.iot.freeboard.freeboardVO"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
	<title>LEGGO</title>
	<meta charset="UTF-8">
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<!-- jQuery받아오기 위해서 --> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<!-- 합쳐지고 최소화된 최신 CSS --> 
	<meta name="viewport">
</head> 
<body> 
<%ArrayList<noticeboardVO> list = (ArrayList<noticeboardVO>)request.getAttribute("noticelist"); %>
<% memberVO user = (memberVO)session.getAttribute("user"); %>
	<div class="boardouter">
		<div class="boardtop">
		
		</div>
		<div class="boardcontainer"> 
			<table class="boardtable table-hover table table-striped"> 
				<thead>
					<tr>
						<th id="freehead" colspan="4">공지사항</th>
					</tr>
				</thead>
				<tbody>
					<tr> 
						<td>번호</td> 
						<td>제목</td> 
					<!-- 	<td>작성자</td>  -->
						<td>등록일</td> 
					</tr>
					<%for(int i=0;i<list.size();i++){
						noticeboardVO row = list.get(i);	
						%>
					
					<tr> 
						<td><%=row.getBrd_num() %></td>  
						<td><a href="/leggo/noticeboardread.do?brd_num=<%=row.getBrd_num() %>"><%=row.getTitle() %></td> 
						<%-- <td><%=row.getMng_id()%></td>  --%>
						<td><%=row.getUpdate_date()%></td> 
					</tr>
					<% } %> 
				</tbody>
				<tfoot >
					<tr>
						<th id="freefoot" colspan="4"></th>
					</tr>
				</tfoot>
			</table> 
		</div> 
	</div>
</body> 
</html>


