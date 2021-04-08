<%@page import="VO.movieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	movieVO vo = (movieVO)request.getAttribute("vo");
%>
<title><%= vo.getMo_nm() %></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body{
	margin : 0;
	padding : 0;
	background : url (../images1/영화1.jpg) center center fixed no-repeat;
	background-color: black;
}

video{
	position : fixed;
	top : 0;
	left : 0;
	min-width : 100%;
	min-height : 100%;
	width : 100%;
	height : 90%;
	z-index : -1;
}
.logo {
	width: 5%;
	height: 70px;
	float: left;
	margin-right: 100px;
	position: absolute;
	top : 0;
	left : 0;
}
</style>
<script>
$(function(){
	
	$('.videoBox').mousemove(function(event){
		$('#logo').show().css('transition', '250ms');
	});
	
	$('#logo').hide();	

})
</script>
</head>
<body>
<div class="videoBox">
<a href="<%= request.getContextPath() %>/seeavi/netmain.jsp" target="_blank" id="logo"><img class="logo" src="<%= request.getContextPath() %>/images1/마크png.png"></a>
<video controlslist="nodownload" controls poster="<%= request.getContextPath() + vo.getMo_img().substring(2) %>" id="<%= vo.getMo_nm() %>">
	<source src="<%= request.getContextPath() + vo.getMo_path().substring(2) %>" type="video/<%= vo.getMo_path().substring(vo.getMo_path().lastIndexOf(".")+1) %>">
</video>
</div>
</body>
</html>