<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/netmain.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/searchList.js"></script>
<title>검색한 영화</title>
<style>
#content{
	margin-left: 350px;
	margin-top : 200px;
}
.list-table {
	margin-top: 40px;
	position: relative;
	color:white;
	/* 배경색 */
	background:#1a1a00;
	
	
}
.list-table thead th{
	
	height:40px;
	border-top:2px solid white;
	border-bottom:1px solid white;
	font-weight: bold;
	font-size: 17px;
}
.list-table tbody td{
	
	text-align:center;
	padding:10px 0;
	border-bottom:1px solid	 white; height:20px;
	font-size: 14px 
}
.bak_item {
	height: 170px;
	margin-top: 20px;
}
.poster{
	
	width: 150px;
	height: 170px;
}
.mbutton{
	width:90px;
	margin-bottom: 5px;
}
.cart {
	width: 20px;
}
</style>
<%	memberVO memVo = (memberVO)session.getAttribute("user");%>
<script>
$(function(){
	
})
</script>
</head>
<body>
<div id="nav">

        <a href="netmain.html" id="logo"><img class="logo" src="<%= request.getContextPath() %>/images1/넷플릭.JPG"></a>
        <ul id="na">
            <li class="av"><a href="<%= request.getContextPath() %>/seeavi/영화.jsp">영화보기</a></li>
            <li class="av"><a href="<%= request.getContextPath() %>/shop/다운로드.jsp">다운로드</a></li>
            <li class="av"><a href="<%= request.getContextPath() %>/community/커뮤니티.jsp">커뮤니티</a></li>  
            <li class="av"><a href="<%= request.getContextPath() %>/notice/notice.jsp">고객센터</a></li>
        <div class="dropdown" id="search">

				<button class="dropbtn">
					<img class="mylog" src="../images1/<%=memVo.getProfile() %>">
				</button>

				<div class="dropdown-content">
					<a href="../member/MyPage.jsp">마이페이지</a> <a
						href="../member/Logout.jsp">로그아웃</a> <a href="#">영화 이어서보기</a>
				</div>
			</div>
			<a type="button" href="shopbasket.jsp" id="search"><img
				class="search" src="../images1/장바구니흰.jpg"></a>
			<a type="button" href="#" id="search"><img class="search"
				src="../images1/흰돋보기.JPG"></a>
			<input type="text" id="searchDown" placeholder="콘텐츠 검색" value="">
		</ul>

	</div>

<div id="content">
	<h2>검색한 목록</h2>
	<table class="list-table">
		<thead>
		
			<tr>
				<th width="350">상품정보</th>
				<th width="200">영화제목</th>
				<th width="200">영화줄거리</th>
				<th width="160">상품금액</th>
				<th width="160">영화번호</th>
				<th width="160">선택</th>
			</tr>
		</thead>
		<tbody id="showdbody">
				<tr>
					<td width="300">
						<div class="bak_item">
							<div class="pro_img">
								<img src="<%= request.getContextPath() %>/images1/영화2.jpg" alt="영화2" title="영화2"class="poster" />
							</div>
							<div class="pro_nt"></div>
						</div>
					<td width="200">프로스트의 비밀정원</td>
					<td width="350">프로스트의 비밀정원이 시작된다 올겨울 강타할 초대형 드라마영화 프로스트! 지금
						다운받아보세요 요로로로로로롱</td>
					<td width="150">￦4500</td>
					<td width="150">10114</td>
					<td width="100">
					<button class="mbutton" type="button" onclick="get()">
						<img class="cart" src="<%= request.getContextPath() %>/images1/장바구니.png">담기
					</button>
					<button class="mbutton" type="button" onclick="down()">
						<img class="cart" src="<%= request.getContextPath() %>/images1/다운로드.png">다운로드
					</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>

</body>
</html>