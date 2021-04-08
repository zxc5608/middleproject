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
	<h1 id="contw">FNQ 자주 묻는 질문 </h1>




<div class="review">

<!-- 아코디언 게시판 만들기  -->
<div class="container">
  <h2 class="title">자주 묻는 질문</h2>
  
  
<br>
<br>
<br>  
  
 <table>
 	<th></th>
 </table>
  <div class="panel-group" id="accordion">
    <div class="panel panel-success">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse20" class="acco">
          	1      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   자주묻는 질문
          
          
          </a>
        </h4>
      </div>
      <div id="collapse20" class="panel-collapse collapse "> <!-- in이 있으면 열려있는거 -->
        <div class="panel-body">
          
         
          <p  class="p1">
                      질문 번호: 3   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     
                   게시날짜 : 2020.12.02      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
          <br><br><br>  
                      내용 : 영상다운로드하기
           </p>
           
       
     
        
        
        <!--답변  -->
          <hr>
          <p class="p1">
          	<b>답변 </b><br>
          	 영상다운로드는 영상 다운로드 페이지에서 <br>
          	 장바구니에 담아서 
          </p>
           <p class="p2">
             <button type="button" onclick="buttup()" idx="20" name="" class="action">수정하기</button>
             <button type="button"onclick="buttdel()" idx="20" name="" class="action">삭제하기</button>
          </p>
        </div>
      </div>
    </div>
  </div> 
</div>

<br>
<div>
	<a href="<%=request.getContextPath() %>/admin/fnqReply.jsp"><input class="btn btn-warning" type="button" value="등록"></a>
</div>
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
	
</div>
		
		














</body>
</html>