<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="../js/titlesearch.js"></script>
<style>
</style>
<%
	memberVO memVo = (memberVO)session.getAttribute("user");
	if(memVo==null){	//세션이 없으면 
%>
<script>
alert("로그인 실패!");
// 	location.href = "Login.jsp";
history.go(-1);
</script>
<% } else {	%>
<p id="h3"><%=memVo.getMem_nm() %>님 어서오세요.</p>
<% }	%>
<script>
$(function(){
	selector()
	$.ajax({
		url : '/MiddleProject/ScoreList.do',
		type : 'post',
		dataType : 'json',
		success : function(res){
			code = "";
			$.each(res, function(i,v){
				code += '<div class=swiper-slide><a href=/MiddleProject/DetailView.do?mo_no='+ v.mo_no +'><img src='+ v.imgpath +' alt='+ v.mo_nm +'></a></div>';
			})
			$('#w2').html(code);
			
			$.ajax({
				url : '/MiddleProject/ViewsList.do',
				type : 'post',
				dataType : 'json',
				success : function(res){
					code1 = "";
					$.each(res, function(i,v){
						code1 += '<div class=swiper-slide><a href=/MiddleProject/DetailView.do?mo_no='+ v.mo_no +'><img src='+ v.imgpath +' alt='+ v.mo_nm +'></a></div>';
					})
					$('#w3').html(code1);
					
					$.ajax({
						url : '/MiddleProject/CategoryList.do',
						type : 'post',
						dataType : 'json',
						success : function(res){
							code = "";
							$.each(res, function(i,v){
								code += '<div class=swiper-slide><a href=/MiddleProject/DetailView.do?mo_no='+ v.mo_no +'><img src='+ v.imgpath +' alt='+ v.mo_nm +'></a></div>';
							})
							$('#w1').html(code);
							
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
						}
					})
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				}
			})
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
})
</script>
</head>
<body>
    <div class="jb-box">
      <video muted autoplay loop id="#bgvid">
        <source src="./trailer.mp4" type="video/mp4">
      </video>
      <!-- 여기 -->
      
         <div id="polina">
         
        <h1 id="btitle">공룡이 날아다닌다</h1>
        <p>2015년 개봉작
            <p/>
                <a href="http://google.com" id="ggtitle">영상보러가기</a>
            <p>
       [오늘의 상영작 공룡이 날아다니고 눈이온다!!!!!]
                공룡이 날아다니고 눈이오고 어떤여자가 걸어다니고
       공룡 새퀴가 쳐다본다!!! 오늘 나온 최신작 엄청재미있는
       블록버스터 애니메이션이 보려고 난리가 나나싼암ㄴ아
 
            </p>
    
    </div>
    <!-- 요기 -->
      <div class="jb-text">
      <div id="nav">

        <a href="netmain.jsp" id="logo"><img class="logo" src="../images1/savi.png"></a>
        <ul id="na">
            <li class="av"><a href="영화.jsp">영화보기</a></li>
            <li class="av"><a href="../shop/다운로드.jsp">다운로드</a></li>
            <li class="av"><a href="../community/커뮤니티.jsp">커뮤니티</a></li>
            <li class="av"><a href="../notice/notice.jsp">고객센터</a></li>
            
			<a href="../member/MyPage.jsp" id="search"><img class="search1" src="../images1/닷지차저.jpg"></a>
			<a type="button" href="#" id="search"><img class="search" src="../images1/장바구니흰.jpg"></a>
			<a type="button" href="#" id="search" class="selec"><img class="search" src="../images1/흰돋보기.JPG"></a>
			<input type="text" id="searchDown" placeholder="콘텐츠 검색">
        </ul>
        
    </div>
      </div>
    </div>

<h2 id="title">회원님의 선호 장르 영화</h2>
<div class="swiper-container" id="wc1">
	<div class="swiper-wrapper w1" id="w1"></div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<!-- <div class="swiper-pagination"></div> -->
</div>

<h2 id="title">평점이 좋은 영화</h2>
<div class="swiper-container" id="wc2">
	<div class="swiper-wrapper w2" id="w2">
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

</div>
  
<h2 id="title">사람들이 많이 보는 영화</h2>
<div class="swiper-container" id="wc3">
	<div class="swiper-wrapper w3" id="w3"></div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

</div>

</body>
</html>