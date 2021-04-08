<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/idsearch.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/memberreg.js"></script>
<script>
$(function() {
	$('#id').keyup(function() {
		if (!idcheck()) {
			return false;
		}
	})
	$('#sendMail').click(function() { // 메일 입력 유효성 검사
		var mail = $('#id').val(); //사용자의 이메일 입력값. 

		if (mail == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		}else{
			$.ajax({
				type : 'post',
				url : '/MiddleProject/passMail.do',
				data : {
					"id" : mail
				},
				dataType : 'json',
				success : function(res) {
					alert(res.sw);
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				}

			});
		}
	});
	
})

</script>
</head>
<body>
	<div class="login-form">
		<a href="Main.jsp" id="logo"><img class="logo" src="../images1/savi.png"></a>

		<h1>
			비밀번호를 <br>잊으셨나요?
		</h1>
		🤷‍♀️🤷‍♂️
		<p>
			비밀번호 재설정 안내를 <br> 이메일을 보내드리겠습니다.
		</p>
		<input type="text" name="email" id="id" class="text-field" placeholder="이메일">
		<input type="submit" id="sendMail" value="이메일로 받기" class="submit-btn"><br>
		<span id="idCk"></span>
		<div class="links">
			<a href="Main.jsp">로그인 창으로 가기</a>
		</div>
	</div>

</body>
</html>