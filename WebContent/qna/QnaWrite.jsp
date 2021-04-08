<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<link rel="stylesheet" href="../css/Qna.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/qna.js"></script>
<%	memberVO memVo = (memberVO)session.getAttribute("user");%>
<script>
$(function(){
	
	$('#button-w').on('click',function(){
		title=$('#name').val();
		cont=$('#comments').val();
		insertqna();
	})
})
</script>
</head>
<body>
<div class="back">
	<!-- 상단바 -->
	<div id="nav">

	 <a href="../seeavi/netmain.jsp" id="logo"><img class="logo"
					src="../images1/savi.png"></a>
		<ul id="na">
			<li class="av"><a href="../seeavi/영화.jsp">영화보기</a></li>
			<li class="av"><a href="../shop/다운로드.jsp">다운로드</a></li>
			<li class="av"><a href="../community/커뮤니티.jsp">커뮤니티</a></li>

			<li class="av"><a href="../notice/notice.jsp">고객센터</a></li>
						<div class="dropdown" id="search">

				<button class="dropbtn">
					<img class="mylog" src="../images1/<%=memVo.getProfile() %>">
				</button>

				<div class="dropdown-content">
					<a href="../member/MyPage.jsp">마이페이지</a> <a
						href="../member/Logout.jsp">로그아웃</a> <a href="#">영화 이어서보기</a>
				</div>
			</div>
				<a type="button" href="../shop/shopbasket.jsp" id="search"><img
						class="search" src="../images1/장바구니흰.jpg"></a>
					<a type="button" href="#" id="search"><img class="search"
						src="../images1/흰돋보기.JPG"></a>
					<input type="text" id="searchDown" placeholder="콘텐츠 검색" value="">
		</ul>

	</div>

	<!-- 왼쪽 -->
<div class ="board">
	<div id='cssmenu'>
<ul>
   
   <li class='has-sub'><a href='#'><span>자주묻는질문</span></a>
    
   </li>
   <li class='has-sub'><a href='../qna/Qna.jsp'><span>Q&A</span></a>
  
   </li>
   
    <li class='has-sub'><a href='../notice/notice.jsp'><span>공지사항</span></a>
  
   </li>
   
   </ul>
   </div>
   </div>
   
   
<div class="review1">

         <h2>질문하기</h2>
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="제목" type="text" required>
        </div>
       
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="내용" ></textarea><br>
      <div class="row">
        <div class="form-write">
          <a href="../qna/Qna.jsp" class="a"><button id=button-w class="button-w" type="button">등록</button></a>
          <a href="../qna/Qna.jsp" class="a"><button class="button-w">취소</button></a>
        </div>
      </div>
     
   
	
</div>
		
		
		
</body>
</html>