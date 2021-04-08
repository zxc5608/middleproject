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
<script src="../js/jquery.serializejson.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/basket.js"></script>
<title>Insert title here</title>

<link rel="stylesheet" href="../css/shop.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">
<style>
.pager{
    float: left;
    width: 120px;
    margin: 5px;
    margin-left: 791px;
}
</style>

<%	memberVO memVo = (memberVO)session.getAttribute("user");%>

<script>
$(function(){
	deletebasket()
	basketPageList(1)
	
	//페이지 번호를 클릭 이벤트 처리
	$('#pagelist').on('click', '.paging', function() {
		currentPage = $(this).text().trim();
		zzimPageList(currentPage);
	})
	//next버튼 클릭 이벤트
	$('#pagelist').on('click', '.next', function() {
		currentPage = parseInt($('.paging').last().text()) + 1;
		zzimPageList(currentPage);
	})

	//이전 버튼 클릭 이벤트
	$('#pagelist').on('click', '.prev', function() {
		currentPage = parseInt($('.paging').first().text()) - 1;
		zzimPageList(currentPage);
	})
})
</script>
</head>
<body>
<div class="back">
	<!-- 상단바 -->
	<div id="nav">

		<a href="../seeavi/netmain.jsp" id="logo"><img class="logo"
			src="../images1/넷플릭.JPG"></a>
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
			<a type="button" href="shopbasket.jsp" id="search"><img
				class="search" src="../images1/장바구니흰.jpg"></a>
			<a type="button" href="#" id="search"><img class="search"
				src="../images1/흰돋보기.JPG"></a>
			<input type="text" id="searchDown" placeholder="콘텐츠 검색" value="">
		</ul>

	</div>
	
<div class ="board">
	<div id='cssmenu'>
		<ul>
   			<li class='has-sub'><a href='../shop/shopbasket.jsp'><span>장바구니</span></a></li>
   			<li class='has-sub'><a href='../member/laterview.jsp'><span>나중에 보기(찜)</span></a></li>
   		</ul>
   </div>
</div>

<div class="section_contents">
	<p class="title_s"></p>

	<div class="order2_step">
		<ul>
			<li class="active"><h3>STEP 1 장바구니<span></span></h3></li>
			<li><h3>STEP 2 결제<span></span></h3></li>
			<li><h3>STEP 3 결제완료<span></span></h3></li>
		</ul>
	</div>

<!--cart products-->		
<table class="table_basic cart_table n-cart-table">
	<tr>
		<th class="col2">번호</th>
		<th class="col2">영화 이름</th>
		<th class="col2">포스터</th>
		<th class="col2">가격</th>
		<th class="col2">선택</th>
	</tr>
	<tbody>
		<tr class="cart-group">				
			<td colspan="9" class="cart_cont">
				<table class="table_basic cart_table">
					<tbody id="showtbody">
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>
<br><br>
<div id="pagelist"></div>
<!--//cart products-->
<div class="btngroup">
	<button type="button" class="accent btn btn-info">구매하기</button>
	<button type="button" class="accent btn btn-info" id="deletebas">삭제하기</button>
</div>
	
<!--cart button-->
<!--//cart button-->
</div>

</div>
</body>
</html>