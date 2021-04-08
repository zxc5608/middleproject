<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/contentM.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/admincontent.js"></script>
<style>
.pager{
    float: left;
    margin: 5px;
    margin-left: 791px;
}
.pagination{
	width : 110px;
}
</style>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

$(function(){
	categoryPagelist(1)
	
	//페이지 번호를 클릭 이벤트 처리
	$('#pagelist').on('click', '.paging', function() {
		currentPage = $(this).text().trim();
		categoryPagelist(currentPage);
	})
	//next버튼 클릭 이벤트
	$('#pagelist').on('click', '.next', function() {
		currentPage = parseInt($('.paging').last().text()) + 1;
		categoryPagelist(currentPage);
	})

	//이전 버튼 클릭 이벤트
	$('#pagelist').on('click', '.prev', function() {
		currentPage = parseInt($('.paging').first().text()) - 1;
		categoryPagelist(currentPage);
	})
})
</script>

</head>
<body>

<nav class="navbar navbar-inverse ">
	 <img class="logo" src="../images1/넷플릭스_로고.png" alt="로고" align="left">
	 <p id="pp" >| 관리자 페이지</p>
</nav>
 

<!--  메뉴 Side Navigation  -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <p class="sidefont">Content</p>
  <a href="<%=request.getContextPath()%>/admin/content.jsp">상영작 관리</a>
  <br>
  <p class="sidefont">Member</p>
  <a href="<%=request.getContextPath()%>/admin/memberlist.jsp">회원 관리</a>
  <a href="<%=request.getContextPath()%>/admin/singo.jsp">신고 회원 관리</a>
  <a href="<%=request.getContextPath()%>/admin/payment.jsp">결제 관리</a>
  <br>
  <p class="sidefont">Service center</p>
  <a href="<%=request.getContextPath()%>/admin/qna.jsp">QnA</a>
  <a href="<%=request.getContextPath()%>/admin/fNq.jsp">FnQ</a>
  <a href="<%=request.getContextPath()%>/admin/noticeM.jsp">공지사항</a>
</div>
<span id="tt" onclick="openNav()">&#9776;</span>


 <div id="word">상영작 관리 다운로드 관리</div> 
<br><br>
<hr>
	<a href="<%=request.getContextPath() %>/admin/main.jsp" class="back">←  관리자 페이지로 돌아가기</a>
<hr>
	<h1 id="contw">상영작 관리</h1>
	
	<div><a href="<%=request.getContextPath()%>/admin/upload.jsp"><input class="bbut" type="button" value="등록"></a></div>
	<div><a href="<%=request.getContextPath()%>/admin/todayUpload.jsp"><input class="up" type="button" value="오늘의 영상 등록"></a></div>
	<div><input class="serch" type="text" value=""  placeholder="검색창" ></div>	

	<div>
	<select name="genre" class="sel">
		<option value="">장르</option>
		<option value="로맨스">로맨스</option>
		<option value="코미디">코미디</option>
		<option value="액션">액션</option>
		<option value="공포">공포</option>
		<option value="SF">SF</option>
		<option value="애니">애니</option>
		<option value="다큐">다큐</option>
		<option value="스릴러">스릴러</option>
	</select>
	</div>
	
	<!-- 이미지 div -->
	<div class="mmm">
	<!-- <div class="imagebox">
		<img class="mimg" src="../images1/영화1.jpg" alt="movie">		
    </div>
		<div class="imagebox">
		<img class="mimg" src="../images1/영화2.jpg" alt="movie">		
    </div>
    	<div class="imagebox">
		<img class="mimg" src="../images1/영화2.jpg" alt="movie">		
    </div>
    	<div class="imagebox">
		<img class="mimg" src="../images1/영화1.jpg" alt="movie">		
    </div>
    <div class="imagebox">
		<img class="mimg" src="../images1/영화1.jpg" alt="movie">		
    </div>
    <div class="imagebox">
		<img class="mimg" src="../images1/영화1.jpg" alt="movie">		
    </div>
        <div class="imagebox">
		<img class="mimg" src="../images1/영화1.jpg" alt="movie">		
    </div>
        <div class="imagebox">
		<img class="mimg" src="../images1/영화1.jpg" alt="movie">		
    </div> -->
    </div>
    
    <div id="pagelist"></div>
    
</body>
</html>