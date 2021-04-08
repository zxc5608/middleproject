<%@page import="VO.memberVO"%>
<%@page import="VO.movieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/상세보기.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"></script>
<script src="<%=request.getContextPath()%>/js/detailview.js"></script>
<%
	movieVO vo = (movieVO)request.getAttribute("vo");
	memberVO memVo = (memberVO)request.getAttribute("memVo");
%>
<script>
$(function(){
	insertZzim()
	reviewlistAll(1)
	avg = <%= vo.getScore() %>;
	
	checkstart(avg);
	
	$('.play').on('click', function(){
		if(<%= memVo.getPayok() %> == 1){		
			location.href='<%= request.getContextPath() %>/GoVideo.do?mo_no=<%= vo.getMo_no() %>';
		}else{
			if(confirm('스트리밍 결제를 하셔야 이용할 수 있는 서비스입니다.<br>결제 하시겠습니까?')) {
				// 결제 페이지로 이동
			}else {
				// no click
				return false;
			}
		}
	})
})
</script>
</head>
<body>
	<div class="move">
		<img class="movie" src="<%= request.getContextPath() + vo.getMo_img().substring(2) %>" value="<%= vo.getMo_no() %>">
		<h1><%= vo.getMo_nm() %></h1>
		<p><%= vo.getMo_cont() %></p>
		<button class="play" type="button">▶재생</button>
		<button class="cont" type="button">+콘텐츠 찜하기</button>
		<br>
		<br>
		<p><%= vo.getMo_act() %><br> 장르: <%= vo.getMo_category() %><br></p>
		<br><br>
		<h2>이 영화의 별점</h2>
		<!-- 1점씩 별하나 체크하도록 -->
		<span class="fa fa-star-o" id="fa1"></span>
		<span class="fa fa-star-o" id="fa2"></span>
		<span class="fa fa-star-o" id="fa3"></span>
		<span class="fa fa-star-o" id="fa4"></span>
		<span class="fa fa-star-o" id="fa5"></span> <%= vo.getScore() %>점
	</div>

	<div class="colo">		
	  	<h2 id="mreview">영화리뷰 요약</h2>
	  	<div class="col"></div>
	</div>

</body>
</html>