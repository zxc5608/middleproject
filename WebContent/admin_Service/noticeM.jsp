<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/noticeM.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/noticeM.js"></script>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
currentPage=1;
$(function() {
// 	noticeList();
	listPage(1);
	
	  //페이지 번호를 클릭 이벤트 처리 
	  $('#pagelist').on('click', '.paging', function(){
		  currentPage =    $(this).text().trim();
		  console.log(currentPage);
		  listPage(currentPage);
	  })
	  //next버튼 클릭 이벤트 
	  $('#pagelist').on('click', '.next', function(){
		
		  //$('.paging:last')
		   currentPage =  parseInt( $('.paging').last().text() ) + 1; 
		   listPage(currentPage);
	  })
	  
	  //이전 버튼 클릭 이벤트 
	  $('#pagelist').on('click', '.prev', function(){
		 
		  //$('.paging:first')
		   currentPage =  parseInt( $('.paging').first().text() ) - 1; 
		   listPage(currentPage);
	  })
	  

})
</script>
</head>
<body>

<nav class="navbar navbar-inverse ">
	 <img class="logo" src="../images1/savi.png"  alt="로고" align="left">
	 <p id="pp" >| 관리자 페이지</p>
</nav>
 

<!--  메뉴 Side Navigation  -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <p class="sidefont">Content</p>
   <a href="<%=request.getContextPath()%>/admin/content.jsp">상영작 관리</a>
  <br>
  <p class="sidefont">Member</p>
  <a href="<%=request.getContextPath()%>/admin_mem/memberlist.jsp">회원 관리</a>
  <a href="<%=request.getContextPath()%>/admin_mem/singo.jsp">신고 회원 관리</a>
  <a href="<%=request.getContextPath()%>/admin_mem/payment.jsp">결제 관리</a>
  <br>
  <p class="sidefont">Service center</p>
  <a href="<%=request.getContextPath()%>/admin_Service/qna.jsp">QnA</a>
  <a href="<%=request.getContextPath()%>/admin_Service/fNq.jsp">FnQ</a>
  <a href="<%=request.getContextPath()%>/admin_Service/noticeM.jsp">공지사항</a>
</div>
<span id="tt" onclick="openNav()">&#9776;</span>

<div id="word">고객센터</div> 
<br><br>
<hr>
	<a href="<%=request.getContextPath() %>/admin/main.jsp" class="back">←  관리자 페이지로 돌아가기</a>

<hr>
  <a href="<%=request.getContextPath() %>/admin_Service/noticeNEW.jsp"> <button type="button" idx="20" name="" id="btnn"class="btn btn-info action1">새글작성</button></a>
<div class="review">
<!-- 	<h1 id="contw">공지사항</h1> -->
</div>
		<div id="pagelist">
		
		</div>
</body>
</html>