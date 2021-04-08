<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/qnaM.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
$(function() {
	
$('#write').on('click', function() {
	//외부 스크립트의 idcheck()함수를 호출하여 공백,길이,정규식체크하여 올바른 데이터로 검증될 때만 ajax를 수행
	name = $('#name').val().trim();
	cont= $('#comments').val().trim();
	$.ajax({
		url : '/MiddleProject/newNotice.do',
		type : 'post',
		data : {
			"name" : name,
			"comments" : cont
		},
		success : function(res) {
			alert("작성 성공");
			location.href = "noticeM.jsp";
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})

})
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

<div id="word">고객센터</div> 
<br><br>
<hr>
	<a href="<%=request.getContextPath() %>/admin/main.jsp" class="back">←  관리자 페이지로 돌아가기</a>

<hr>
	<h1 id="contw">New Notice</h1>

<!-- 작성폼 -->

<div class="review1">
<%-- 		<form action="<%=request.getContextPath() %>/newNotice.do"> --%>
		<div class="panel panel-warning" id="yellow">
			<div class="panel-heading" id="yyy">공지사항 새 글 작성</div>
		</div>
		
		<div class="row">
        <div class="col-sm-5 form-group">
          <input class="form-control" id="name" name="name" placeholder="제목" type="text" required>
        </div>
       
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="내용" ></textarea><br>
      <div class="row">
        <div class="form-write">
          <button class="button-w" type="submit" id="write" >등록</button>
          <a href="<%=request.getContextPath() %>/admin/noticeM.jsp" class="a"><button class="button-w">취소</button></a>
<!--           </form> -->
        </div>
      </div>
     
   
	
</div>

</body>
</html>