<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/movie.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%	memberVO memVo = (memberVO)session.getAttribute("user");%>
<script>
new Swiper('.swiper-container', {

	slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 10, // 슬라이드간 간격
	slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},

});
$(function(){
	$('#categ').on('change', function(){
		cvalue = $(this).val().trim();
		
		$.ajax({
			url : '/MiddleProject/CategetScoreRank.do',
			type : 'post',
			data : {"a" : cvalue},
			success : function(res){
				code1 = "";
				$.each(res, function(i,v){
					code1 += '<div class=swiper-slide><a href=/MiddleProject/DetailView.do?mo_no='+ v.mo_no +'><img src='+ v.imgpath +' alt='+ v.mo_nm +'></a></div>';
				})
				$('#w1').html(code1);
				
				$.ajax({
					url : '/MiddleProject/CategetViewsRank.do',
					type : 'post',
					data : {"a" : cvalue},
					success : function(res){
						code2 = "";
						$.each(res, function(i,v){
							code2 += '<div class=swiper-slide><a href=/MiddleProject/DetailView.do?mo_no='+ v.mo_no +'><img src='+ v.imgpath +' alt='+ v.mo_nm +'></a></div>';
						})
						$('#w2').html(code2);
						
						$.ajax({
							url : '/MiddleProject/selectcategory.do',
							type : 'post',
							data : {"a" : cvalue},
							success : function(res){
								code3 = "";
								$.each(res, function(i,v){
									code3 += '<div class=swiper-slide><a href=/MiddleProject/DetailView.do?mo_no='+ v.mo_no +'><img src='+ v.imgpath +' alt='+ v.mo_nm +'></a></div>';
								})
								$('#w3').html(code3);
								
								new Swiper('.swiper-container', {

									slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
									spaceBetween : 10, // 슬라이드간 간격
									slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

									// 그룹수가 맞지 않을 경우 빈칸으로 메우기
									// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
									loopFillGroupWithBlank : true,

									loop : true, // 무한 반복

									pagination : { // 페이징
										el : '.swiper-pagination',
										clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
									},
									navigation : { // 네비게이션
										nextEl : '.swiper-button-next', // 다음 버튼 클래스명
										prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
									},

								});
							},
							error : function(xhr){
								alert("상태 : " + xhr.status);
							},
							dataType : 'json'
						})
					},
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					dataType : 'json'
				})
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
})
</script>
</head>
<body>

<div id="nav">

        <a href="netmain.jsp" id="logo"><img class="logo"
					src="../images1/savi.png"></a>
				<ul id="na">
					<li class="av"><a href="영화.jsp">영화보기</a></li>
					<li class="av"><a href="../shop/다운로드.jsp">다운로드</a></li>
					<li class="av"><a href="../community/커뮤니티.jsp">커뮤니티</a></li>
					<li class="av"><a href="index.jsp">고객센터</a></li>
					<!--기존 마이페이지 위치  -->

					<div class="dropdown" id="search">

						<button class="dropbtn">
							<img class="mylog" src="<%=memVo.getProfile() %>">
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
	
	<aside id="left">
		
		<div>
		<h2 id = "cate">작품 상영 카테고리</h2>
		
		<select id="categ">
    		<option value="선택">---카테고리 선택---</option>
    		<option value="로맨스">로맨스</option>
    		<option value="코미디">코미디</option>
    		<option value="스릴러">스릴러</option>
		    <option value="액션">액션</option>
		    <option value="공포">공포</option>
		    <option value="SF">SF</option>
		    <option value="애니">애니</option>
		    <option value="다큐멘터리">다큐멘터리</option>
		</select>
		</div>
	</aside>

<!-- Swiper -->
<h2 id="title">추천영화</h2>
<div class="swiper-container" id="wc1">
	<div class="swiper-wrapper w1" id="w1"></div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<!-- <div class="swiper-pagination"></div> -->
</div>
  
<h2 id="title">사람들이 많이 보는 영화</h2>
<div class="swiper-container" id="wc2">
	<div class="swiper-wrapper w2" id="w2">
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

</div>
  
<h2 id="title">전체</h2>
<div class="swiper-container" id="wc3">
	<div class="swiper-wrapper w3" id="w3"></div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

</div>

</body>
</html>