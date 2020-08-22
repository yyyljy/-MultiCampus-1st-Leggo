<!DOCTYPE html>

<html lang="en">
<head>
	<title>LEGGO</title>
	<meta charset="UTF-8">
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<!-- jQuery받아오기 위해서 --> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<!-- 합쳐지고 최소화된 최신 CSS --> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../css/main.css">  
	<link rel="stylesheet" href="../css/readboard.css"> 
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	  $( function() {
	    $( "#tabs" ).tabs();
	  } );
	  
 	</script>
 	
</head> 
<body> 
	<div class="outer">
		<div class="top">
		
		</div>
		<div class="container"> 
			<table class="table table-hover table table-striped"> 
			<!-- table-hover클래스는 마우스를 올리면 회색이 생기게
			table-striped클래스는 홀수번째 테이블에 회색이 생겨있게-->
			<!-- table table-bordered 이 클래스는 테이블의 선 그어주기--> 
				<thead>
					<tr>
						<th id="freehead" colspan="4">자유게시판</th>
					</tr>
				</thead>
			</table>
				
		
			<div class="w3-content" style="max-width:1600px">   

	      <!-- Blog entry -->
	      <div class="mainview w3-container w3-white w3-margin w3-padding-large">
	        <div id="readtitle">
	         	<table class="readtable table table-striped">
	         		<tr>
	         			<th colspan="3" style="text-align: center">게시글 제목</th>
	         		</tr>
	         		<tr>
	         			<td>회원 아이디</td>
	         			<td>회원 계급</td>
	         			<td>게시날짜</td>
	         		</tr>
	         	</table>
	        </div>
			<div id="line">
				
			</div>
	        <div class="w3-justify">
		        <div class="view">
		        	<br>게시자가 쓴 글, 게시물<br/>
		        	<br>게시자가 쓴 글, 게시물<br/>
		        	<br>게시자가 쓴 글, 게시물<br/>
		        	<br>게시자가 쓴 글, 게시물<br/>
		        </div>
	        	<div id="btn">
		          <button class="button" onclick="myFunction('demo1')" id="reviewBtn"><b>댓글보기</b></button>
		          <button class="button" onclick="showPopup()" id="reviewBtn"><b>댓글쓰기</b></button>
		          <button class="button" onclick="" id="reviewBtn"><b>목록으로</b></button>
	          	</div>
		          <div class="w3-row w3-margin-bottom" id="demo1" style="display:none">
		            <hr>
		            <!-- 댓글보기 -->
		            <div class="allreview">
		              <div class="watchreview">
		              	<table class="table">
		              		<tr>
			         			<th>회원 계급</th>
			         			<th>회원 아이디</th>
			         			<th>게시날짜및시간</th>
			         			<th></th>
		         			</tr>
		         			<tr>
			         			<td colspan="4">회원이 쓴 댓글 내용</td>
		         			</tr>
		              	</table>
		              </div>
		              <div class="watchreview">
		              	<table class="table">
		              		<tr>
			         			<th>회원 계급</th>
			         			<th>회원 아이디</th>
			         			<th>게시날짜및시간</th>
			         			<th></th>
		         			</tr>
		         			<tr>
			         			<td colspan="4">회원이 쓴 댓글 내용</td>
		         			</tr>
		              	</table>
		              </div>
		              <div class="watchreview">
		              	<table class="table">
		              		<tr>
			         			<th>회원 계급</th>
			         			<th>회원 아이디</th>
			         			<th>게시날짜및시간</th>
			         			<th></th>
		         			</tr>
		         			<tr>
			         			<td colspan="4">회원이 쓴 댓글 내용</td>
		         			</tr>
		              	</table>
		              </div>
		              <div class="watchreview">
		              	<table class="table">
		              		<tr>
			         			<th>회원 계급</th>
			         			<th>회원 아이디</th>
			         			<th>게시날짜및시간</th>
			         			<th></th>
		         			</tr>
		         			<tr>
			         			<td colspan="4">회원이 쓴 댓글 내용</td>
		         			</tr>
		              	</table>
		              </div>
	   	        	 </div>
	         	 </div>
	        </div>
	      </div>
      </div>
      <script>
		//댓글 숨겼다 보이게 하는 자바스크립트
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
	<script type="text/javascript">
		//팝업창 띄우는 자바스크립트
		function showPopup() { window.open("review_popup.jsp", "a", "width=300, height=500, left=100, top=50"); }
	</script>	
		
		</div>
	</div>
</body> 
</html>


