<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/idsearch.css">

<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"   rel="stylesheet">
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/memberreg.js"></script>
</head>
<body>
   <div class="login-form">
      <form>
      	
      	<h1>이메일을 잊으셨나요?</h1>
      	<p>비밀번호 재설정 안내 이메일을 보내드리겠습니다.</p>
         <input type="text" name="email" class="text-field" placeholder="이메일">
		 <input type="submit" value="이메일로 받기" class="submit-btn">
      </form>

      <div class="links">
         <a href="passSearch.jsp">비밀번호를 잊어버리셨나요?</a><br>
         <a href="Main.jsp">로그인 창으로 가기</a>
      </div>
   </div>
</body>
</html>