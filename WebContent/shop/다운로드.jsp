<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/download.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/netmain.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%	memberVO memVo = (memberVO)session.getAttribute("user");%>

<script type="text/javascript">
function get(){
	mvalue = $('.mbutton').attr('idx'); 
	$.ajax({
		url : '/MiddleProject/InsertBasket.do',
		type : 'post',
		data : {"mo_no" : mvalue},
		dataType : 'json',
		success : function(res){
			if(confirm('장바구니에 담았습니다. 쇼핑을 계속 하겠습니까?')) {
				// Yes click
				return;
			}else {
				// no click
				location.href="./shopbasket.jsp";
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})

}
function down(){
	alert("결제창으로 이동합니다")
	
}
$(function(){
	$.ajax({
		url : '/MiddleProject/GetDownList.do',
		type : 'post',
		success : function(res){
			code = "";
			$.each(res, function(i,v){
				code += '<tr>';
				code += '	<td width=300>';
				code += '		<div class=bak_item>';
				code += '			<div class=pro_img>';
				code += '				<img src='+ v.imgpath +' alt=' + v.mo_nm + ' title=' + v.mo_nm + ' class=poster />';
				code += '			</div>';
				code += '			<div class=pro_nt></div>';
				code += '		</div>';
				code += '	<td width=200>' + v.mo_nm + '</td>';
				code += '	<td width=350>' + v.mo_cont + '</td>';
				code += '	<td width=150>￦' + v.mo_price + '</td>';
				code += '	<td width=150>' + v.mo_no + '</td>';
				code += '	<td width=100>';
				code += '	<button class=mbutton type=button idx='+ v.mo_no +' onclick=get()>';
				code += '		<img class=cart src=../images1/장바구니.png>담기';
				code += '	</button>';
				code += '	<button class=mbutton type=button onclick=down()>';
				code += '		<img class=cart src=../images1/다운로드.png>다운로드</button>';
				code += '	</td>';
				code += '</tr>'; 
			})
			$('#showdbody').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	$('.atag').on('click', function(){
		cvalue = $(this).attr('value');
		$.ajax({
			url : '/MiddleProject/GetDownList.do',
			type : 'post',
			data : {"category" : cvalue},
			success : function(res){
				code = "";
				$.each(res, function(i,v){
					code += '<tr>';
					code += '	<td width=300>';
					code += '		<div class=bak_item>';
					code += '			<div class=pro_img>';
					code += '				<img src='+ v.imgpath +' alt=' + v.mo_nm + ' title=' + v.mo_nm + ' class=poster />';
					code += '			</div>';
					code += '			<div class=pro_nt></div>';
					code += '		</div>';
					code += '	<td width=200>' + v.mo_nm + '</td>';
					code += '	<td width=350>' + v.mo_cont + '</td>';
					code += '	<td width=150>￦' + v.mo_price + '</td>';
					code += '	<td width=150>' + v.mo_no + '</td>';
					code += '	<td width=100>';
					code += '	<button class=mbutton type=button idx='+ v.mo_no +' onclick=get()>';
					code += '		<img class=cart src=../images1/장바구니.png>담기';
					code += '	</button>';
					code += '	<button class=mbutton type=button onclick=down()>';
					code += '		<img class=cart src=../images1/다운로드.png>다운로드</button>';
					code += '	</td>';
					code += '</tr>';
				})
				$('#showdbody').html(code);
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

	<aside id="left">
		<h2>카테고리</h2>
		<ul id="leftbar">
			<li><a href="#" value="로맨스" class="atag">로맨스</a></li>
			<li><a href="#" value="코미디" class="atag">코미디</a></li>
			<li><a href="#" value="스릴러" class="atag">스릴러</a></li>
			<li><a href="#" value="액션" class="atag">액션 </a></li>
			<li><a href="#" value="공포" class="atag">공포 </a></li>
			<li><a href="#" value="SF" class="atag">SF </a></li>
			<li><a href="#" value="애니메이션" class="atag">애니메이션 </a></li>
			<li><a href="#" value="다큐멘터리" class="atag">다큐멘터리</a></li>
		</ul>
	</aside>
	<table>
		<div id="content">
			<h2>다운로드</h2>
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
									<img src="../images1/영화2.jpg" alt="영화2" title="영화2"
										class="poster" />
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
								<img class="cart" src="../images1/장바구니.png">담기
							</button>
							<button class="mbutton" type="button" onclick="down()">
								<img class="cart" src="../images1/다운로드.png">다운로드
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</table>
</body>
</html>