<%@page import="VO.memberVO"%>
<%@page import="VO.noticeVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/커뮤니티.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/notice.js"></script>

<%	memberVO memVo = (memberVO)session.getAttribute("user");%>
  
<script>
$(function(){
	
	$('#button-w').on('click',function(){
		
		//$('#uModal').modal('hide');
		//$('#uform .txt').val("");
		$('#uform .txt').modal('show');
	});
	
	$('#button-u').on('click',function(){
		
		//$('#uModal').modal('hide');
		$('#upform .tt').modal('show');
		//$('#upform .tt').val("");
	});
	
	listAll(<%= request.getParameter("no")%>);

});

</script>
  
<title>Insert title here</title>



</head>
<body>
<!--리뷰작성  -->
<!-- 상단바 -->





<div id="nav">

       <a href="netmain.jsp" id="logo"><img class="logo"
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
 <div class ="board">
 
	<div id='cssmenu'>
<ul>
   
   <li class='has-sub'><a href='#'><span>자주묻는질문</span></a>
    
   </li>
   <li class='has-sub'><a href='#'><span>Q&A</span></a>
  
   </li>
   
    <li class='has-sub'><a href='../notice/notice.jsp'><span>공지사항</span></a>
  
   </li>
   
   </ul>
</div>
<div class="review-2"></div>


<div class="tabtab">
<div class="box1">

</div>
   </div>
       
    </div>

</body>
</html>