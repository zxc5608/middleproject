<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>관리자 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/mainAdmin.css">	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
/* Remove the navbar's default margin-bottom and rounded borders */


</style>
</head>
<body>

<nav class="navbar navbar-inverse ">
	 <img class="logo" src="../images1/savi.png" alt="로고">
<!-- 	 <p id="pp">고객 센터</p> -->
</nav>
  
<div class="container-fluid  ">    
    <div class="hello text-left"> 
      <h3>관리자님, 안녕하세요.</h3>
    </div>
      <input type="button"  class="btn btn-danger" value="🎅  커뮤니티 🎅  " id="comuni">
    </div>
      <hr>
      <br>
  <div class="row content">
   <aside class="left">
  <div class="ww1"> <b class="b">상영작</div></b><br><br><br>
  <div class="ww1">	<a href="<%=request.getContextPath()%>/admin/content.jsp" target="ff">상영작[다운로드] 관리</a><br></div>
  
  </aside>
  
   <div class="center">
  <div class="ww"><b class="b">고객센터 관리</b><br><br><br></div>
 <div class="ww"> 	<a href="<%=request.getContextPath()%>/admin_Service/qna.jsp" target="ff">QnA</a><br><br></div>
 <div class="ww"><a  href="<%=request.getContextPath()%>/admin_Service/fNq.jsp" target="ff">자주묻는 질문</a><br><br></div>
   <div class="ww">	<a href="<%=request.getContextPath()%>/admin_Service/noticeM.jsp" target="ff">공지사항</a><br><br></div>
  </div>
  
     <aside class="right">
 <div class="ww2"> 	<b class="b">회원 관리</b><br><br></div><br>
  <div class="ww2">	<a href="<%=request.getContextPath()%>/admin_mem/memberlist.jsp" target="ff">회원 관리</a><br><br></div>
  <div class="ww2">	<a href="<%=request.getContextPath()%>/admin_mem/singo.jsp" target="ff">신고회원 관리</a><br><br></div>
 <div class="ww2"> 	<a href="<%=request.getContextPath()%>/admin_mem/payment.jsp" target="ff">결제 관리</a><br><br></div>
  </aside>
  
  
  

  
  </div>
  

 


<footer class="container-fluid text-center">
  <p class="down">회사정보</p>
  <p class="down">넷플릭스</p>
</footer>

</body>
</html>
