<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 탈퇴 페이지</title>
<link rel="stylesheet" href="../css/MyPage.css">
<link rel="stylesheet" href="../css/netmain.css">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/memberreg.js"></script>

<%	memberVO memVo = (memberVO)session.getAttribute("user");%>
<script>
	$(function() {
		
	$('#pwd').change(function() {
		pwdvalue = $('#pwd').val().trim();
		console.log(pwdvalue);
		if (pwdvalue.length < 1) {
			$("#pwreCk").html("비밀번호를 입력하세요.").css("color", "red");
			return false;
		}
	})
				
		$('#pwd2').change(function() {
			pwdvalue = $('#pwd2').val().trim();
			if(!pwd2check()){
				return false;
			}
			$.ajax({
				type : 'post',
				url : '/MiddleProject/pwdCheck.do',
				data : {
					"pwd" : pwdvalue
				},
				dataType : 'json',
				success : function(res) {
					$("#pwreCk").html(res.sw).css("color", "red");
					
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				}
			});
		})
			$('#bye').on('click',function() {
			
			$.ajax({
				type : 'post',
				url : '/MiddleProject/withdrawal.do',
				data : {
					"pwd" : pwdvalue
				},
				dataType : 'json',
				success : function(res) {
					alert(res.sw);	
					location.href = "Main.jsp";
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				}
			});
		})
		
		


		})
	</script>
</head>
<body>

	<div id="nav">

		<a href="../seeavi/netmain.jsp" id="logo"><img class="logo"
			src="../images1/savi.png"></a>
		<ul id="na">
			<li class="av"><a href="../seeavi/영화.jsp">영화보기</a></li>
			<li class="av"><a href="../seeavi/다운로드.jsp">다운로드</a></li>
			<li class="av"><a href="../seeavi/다운로드.jsp">커뮤니티</a></li>

			<li class="av"><a href="index.jsp">고객센터</a></li>

			<div class="dropdown" id="search">

				<button class="dropbtn">
							<img class="mylog" src="../images1/<%=memVo.getProfile()%>">
						</button>

				<div class="dropdown-content">
					<a href="../member/MyPage.jsp">마이페이지</a> <a
						href="../member/Logout.jsp">로그아웃</a> <a href="#">영화 이어서보기</a>

				</div>
			</div>


			<a type="button" href="#" id="search"><img class="search"
				src="../images1/장바구니흰.jpg"></a>
			<a type="button" href="#" id="search"><img class="search"
				src="../images1/흰돋보기.JPG"></a>
			<input type="text" id="searchDown" placeholder="콘텐츠 검색" value=""
				class="MuiInputBase-input-128 MuiInput-input-116 jss86 jss96 jss77 MuiInputBase-inputAdornedStart-132">
		</ul>

	</div>
	<aside id="left">
		<div class="move">
			<h2 class="mypage">마이페이지</h2>
			<table>
				<ul id="leftbar">
					<li><a href="MyPage.jsp">나의 개인정보</a></li>
					<li><a href="MyPage1.jsp">개인정보 수정</a></li>
					<li><a href="본인인증.jsp">본인인증</a></li>
					<li><a href="Payment.jsp">이용권결제</a></li>
					<li><a href="Withdrawal.jsp">회원탈퇴 </a></li>
				</ul>
			</table>
		</div>
	</aside>

	<div class="myform">


		<div class="profile">
			<img src="../images1/<%=memVo.getProfile()%>" alt="profile">
		</div>

		<h2><%=memVo.getMem_nm()%>님 <br> <br> See-avi 회원
			탈퇴하시겠습니까?😥
		</h2>
		<br> <br>
		<div>
			<h3>✅현재 사용중인 아이디의 재사용 및 복구 불가 안내</h3>
			<br> 회원탈퇴를 신청하시면 현재 로그인된 아이디는 즉시 탈퇴처리되고,<br> 본인과 타인 모두 재사용
			및 복구가 불가하며, 수집된 회원정보는 탈퇴 즉시 삭제되어 복구가 불가능합니다.
		</div>
		<br> <br> <br> <br>
		<p>회원을 탈퇴하시려면 아래 비밀번호를 입력해주세요.</p>

		<br> <input type="password" id="pwd" name="mem_pass"
			class="text-field" placeholder="현재 비밀번호" required="required">
		<br> <br> <input type="password" id="pwd2" name="mem_pass"
			class="text-field" placeholder="비밀번호 다시입력" required="required">
		<br> <br> <span class="res" id="pwreCk"></span> <br> <br>
		<input type="submit" id="bye" value="회원탈퇴" class="submit-btn">

	</div>
</body>
</html>