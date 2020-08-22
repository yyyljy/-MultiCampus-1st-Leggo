<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="com.iot.comment.cmtVO"%>
<%@page import="com.iot.member.memberVO"%>
<%@page import="com.iot.freeboard.freeboardVO"%>
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
	<script>
		$(function(){
			$("#tabs").tabs();
		});
		$("#viewcmtBtn").trigger("click");
	</script>
	
</head>

<body class="w3-light-grey"> 
		
		<!-- w3-content defines a container for fixed size centered content, 
		and is wrapped around the whole page content, except for the footer in this example -->
		<div class="w3-content" style="max-width:1600px">
		<% freeboardVO list = (freeboardVO)request.getAttribute("readpage"); %>
		<% memberVO user = (memberVO)session.getAttribute("user"); %>
	      <!-- Blog entry -->
	      <div class="w3-container w3-white w3-margin w3-padding-large">
	        <div class="w3-center">
	          <h3><%= list.getTitle()%></h3>
	          <h5><%= list.getUser_id()%></h5>
	          <span><%= list.getUpdate_date()%></span>
	        </div>
			<div id="line">
				
			</div>
	        <div class="w3-justify">
	          <p>
				<%= list.getContent()%>
	          <p class="w3-right"><button class="button" onclick="myFunction('demo1')" id="viewcmtBtn"><b>댓글보기</b></button></p>
	          <p class="w3-right"><a href="/leggo/freeboardmain.do" class="button">목록으로</a></p>
	          <p class="w3-right"><a href="/leggo/delete.do?brd_num=<%=list.getBrd_num() %>" class="button">삭제하기</a></p>
	          <div class="w3-row w3-margin-bottom" id="demo1" style="display:none">
	            <hr>
	            <!-- 댓글쓰기 -->
	            <% if(user!=null){ %>
	            <form action="/leggo/comment.do" method="post">
		            <input type="hidden" name="brd_num" value="<%=list.getBrd_num()%>"/>
		            <input type="hidden" name="user_id" value="<%=user.getUser_id()%>"/>
	              <div class="writecmt">
	              	<textarea name="cmt_content" class="boardwritecontent"></textarea>
	              	</div>
	              	<div class="w3-right"><button class="button" type="submit" id="cmtsubtn">등록</button>
	              </div>
	               </form>
	               <% }else{%> 
	               		<script type="text/javascript">
	               			alert("로그인을 해주세요.");
	               			document.location.href="login.do";
	               		</script>
	               		<%}%>
	              <!-- 댓글보기 -->
	           	<% ArrayList<cmtVO> cmt = (ArrayList<cmtVO>)request.getAttribute("readcmt");%>
	              <div class="w3-row w3-margin-bottom">
	              <div class="allcmt">
	              <div class="watchreview">
	               <% if(cmt != null) {
	               	  	for(int i=0;i<cmt.size();i++){ 
	                		cmtVO cmtrow = cmt.get(i);%>
	                <table class="cmttable">
	               
	                	<tr id="cmttr">
	                		<td><%= cmtrow.getCmt_num()%></td>
	                		<td><%= cmtrow.getUser_id()%></td>
	                		<td><%= cmtrow.getUpdate_date()%></td>
	                		<td><%if(cmtrow.getUser_id().equals(list.getUser_id())){ %>
	                			<p class="w3-right"><a href="/leggo/delcmt.do?brd_num=<%=cmtrow.getBrd_num() %>&cmt_num=<%=cmtrow.getCmt_num()%>"
	                			class="button">삭제하기</a>
	                			<%} %>
	                		</td>
	                	</tr>
	                	<tr>
	                		<td colspan="4"><%= cmtrow.getCmt_content()%></td>
	                	</tr>
	                </table>
	                <%} 
	                }%>
	                </div>
	              </div>
	          </div>
	        </div>
	       
	      </div>
	     <script>
		// Toggle between hiding and showing blog replies/comments
		document.getElementById("myBtn").click();
		function myFunction(id) {
		  var x = document.getElementById(id);
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else { 
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
	</script>
      </div>
 </div>
</body> 
</html>


