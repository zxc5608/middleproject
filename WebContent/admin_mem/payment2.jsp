<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/payM.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/memberList.js"></script>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

list = {};
$(function() {
	downList();
})

</script>
</head>
<body>

<nav class="navbar navbar-inverse ">
	 <img class="logo" src="<%=request.getContextPath() %>/images1/넷플릭스_로고.png" alt="로고" align="left">
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

<div id="word">결제</div> 
<br><br>
<hr>
	<a href="<%=request.getContextPath() %>/admin/main.jsp" class="back">←  관리자 페이지로 돌아가기</a>

<hr>
	<h1 id="contw">결제 관리</h1>




	<div id="first">

		<select class="sel" onchange="location.href=this.value">
			<option >선택</option>
			<option value="payment.jsp">회원</option>
			<option value="payment2.jsp">다운로드</option>
		</select>
	</div>

<!-- 	 <form method="get" action="" class="for"> -->
<!--       <div  class="for"> -->
<!--       <label><input type="radio" name="cheinfo"  value="whole" id="nnnn">  전체 </label>  -->
<!--       <label><input type="radio" name="cheinfo" value="month">  월별  </label> -->
     
<!--     </div> -->
<!--     </form> -->
    
    
    <br><br><br>
<!-- 게시판 테이블 -->
	<div class="gesi">
	
</div>





<div class="page">
		<ul class="pagination pagination-sm">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
		</div>


































</body>
</html>