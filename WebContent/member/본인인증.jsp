<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/MyPage.css">
<link rel="stylesheet" href="../css/netmain.css">
<script src="../js/kakao.js"></script>
<script type="text/javascript">
function openPop(){
    var popup = window.open('https://accounts.kakao.com/login?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fproxy%3DeasyXDM_Kakao_9lnig0iri2d_provider%26ka%3Dsdk%252F1.39.10%2520os%252Fjavascript%2520sdk_type%252Fjavascript%2520lang%252Fko-KR%2520device%252FWin32%2520origin%252Fhttps%25253A%25252F%25252Fdevelopers.kakao.com%26origin%3Dhttps%253A%252F%252Fdevelopers.kakao.com%26response_type%3Dcode%26redirect_uri%3Dkakaojs%26state%3Ds2e66h22ksihfk3ffhv4sl%26client_id%3Dc089c8172def97eb00c07217cae17495', '카카오로그인', 'width=700px,height=800px,scrollbars=yes');
}
</script>

</head>

<%	memberVO memVo = (memberVO)session.getAttribute("user"); %>
<body>

<div id="nav">

      <a href="../seeavi/netmain.jsp" id="logo"><img class="logo" src="../images1/savi.png"></a>
        <ul id="na">
            <li class="av"><a href="../seeavi/영화.jsp">영화보기</a></li>
            <li class="av"><a href="../seeavi/다운로드.jsp">다운로드</a></li>
            <li class="av"><a href="../community/커뮤니티.jsp.jsp">커뮤니티</a></li>
          
            <li class="av"><a href="index.jsp">고객센터</a></li>
            	
            	<div class="dropdown" id="search">
				<button class="dropbtn">
							<img class="mylog" src="../images1/<%=memVo.getProfile() %>">
						</button>
				<div class="dropdown-content">
					<a href="../member/MyPage.jsp">마이페이지</a> <a
						href="../member/Logout.jsp">로그아웃</a> <a href="#">영화 이어서보기</a>
				</div>
			</div>
			
        <a type="button" href="#" id="search"><img class="search" src="../images1/장바구니흰.jpg"></a>
        <a type="button" href="#" id="search"><img class="search" src="../images1/흰돋보기.JPG"></a>
                <input type="text" id="searchDown" placeholder="콘텐츠 검색" value="" class="MuiInputBase-input-128 MuiInput-input-116 jss86 jss96 jss77 MuiInputBase-inputAdornedStart-132">
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

<div class ="myform">

 		<div id="image_container"><img id="pro" src="../images1/<%=memVo.getProfile()%>" alt="Movie Title"></div>

<h2> 본인인증 </h2>
<!-- <a id="reauthenticate-popup-btn" ="https://accounts.kakao.com/login?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fproxy%3DeasyXDM_Kakao_cxndems57z_provider%26ka%3Dsdk%252F1.39.10%2520os%252Fjavascript%2520sdk_type%252Fjavascript%2520lang%252Fko-KR%2520device%252FWin32%2520origin%252Fhttps%25253A%25252F%25252Fdevelopers.kakao.com%26origin%3Dhttps%253A%252F%252Fdevelopers.kakao.com%26response_type%3Dcode%26redirect_uri%3Dkakaojs%26state%3D9cr2s3753hv698xrqni3h%26client_id%3Dc089c8172def97eb00c07217cae17495"> -->
 <a href="#none" target="_blank" onclick="openPop()">  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    id="kakao"
  />
</a>
<p id="reauthenticate-popup-result"></p>
<script type="text/javascript">
  function loginFormWithKakao() {
    Kakao.Auth.loginForm({
      success: function(authObj) {
        showResult(JSON.stringify(authObj))
      },
      fail: function(err) {
        showResult(JSON.stringify(err))
      },
    })
  }
  function showResult(result) {
    document.getElementById('reauthenticate-popup-result').innerText = result
  }
  
  
</script>

</div>
</body>
</html>