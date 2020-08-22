<!DOCTYPE html>

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
<%ArrayList<freeboardVO> list = (ArrayList<freeboardVO>)request.getAttribute("boardlist"); %>
	<div class="boardouter">
		<div class="boardtop">
		
		</div>
		<div class="boardcontainer"> 
			<table class="boardtable table-hover table table-striped"> 
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
						<td>번호</td> 
						<td>제목</td> 
						<td>작성자</td> 
						<td>등록일</td> 
					</tr>
					<%for(int i=0;i<list.size();i++){
						freeboardVO row = list.get(i);	
						%>
					
					<tr> 
						<td><%=row.getBrd_num() %></td>    <!--String brd_num = row.getBrd_num-->
						<td><a href="/leggo/freeboardread.do?brd_num=<%=row.getBrd_num() %>"><%=row.getTitle() %></a></td> 
						<td><%=row.getUser_id() %></td> 
						<td><%=row.getUpdate_date() %></td> 
					</tr>
					<% } %> 
				</tbody>
				<tfoot >
					<tr>
						<th id="freefoot" colspan="4"></th>
					</tr>
				</tfoot>
			</table> 
				<!-- 글쓰기 버튼 -->
			<div class="boardallbtn">
				<%if(list!=null) {%>
				<a class="w3-button" href="/leggo/freeboardwrite.do">글쓰기</a>
			</div>
				<%} else{%>
						<script type="text/javascript">
							alert("로그인을 해주세요.");
							document.location.href="login.do";
						</script>
				<%}%>
		</div> 
	</div>
</body> 
</html>


