<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/login2.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>

	<div class="login-form">
		<form action="<%=request.getContextPath()%>/login.do" method="post">
			<input type="radio" name="chk" value="user"  checked="checked"/>회원 
			<input type="radio" name="chk" value="admin">관리자&nbsp;&nbsp; <br>
			<br> <input type="text" name="id" class="text-field"
				placeholder="ID를 입력하세요" value=""> <input type="password"
				name="pw" class="text-field" placeholder="비밀번호를 입력하세요" value="">
			<input type="submit" name="login" class="submit-btn">
			<span id="checkS"></span>
		</form>
		<div class="links">
<!-- 			<a href="Idsearch.jsp">이메일를 잊어버리셨나요?</a><br> -->
			<a href="passSearch.jsp">비밀번호를 잊어버리셨나요?</a>
		</div>
	</div>
</body>
</html>