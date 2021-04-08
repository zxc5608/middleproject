<%@page import="VO.categoryVO"%>
<%@page import="VO.adminVO"%>
<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="../css/MyPage.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../js/jquery-3.5.1.min.js"></script>


<%	memberVO memVo = (memberVO)session.getAttribute("user");%>

<script>
function setThumbnail(event) {
	var reader = new FileReader();
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("id", "img2");
		var oldImgs = document.querySelector("div#image_container").getElementsByTagName("img")[0];
		//console.log("old=" + oldImgs);
		if(oldImgs!=null){
			document.querySelector("div#image_container").replaceChild(img, oldImgs);
			
		} else{
			document.querySelector("div#image_container").appendChild(img);
			
		}
	};
	reader.readAsDataURL(event.target.files[0]);
}

</script>

</head>
<body>

<div id="nav">

      <a href="../seeavi/netmain.jsp" id="logo"><img class="logo" src="../images1/savi.png"></a>
        <ul id="na">
            <li class="av"><a href="../seeavi/영화.jsp">영화보기</a></li>
            <li class="av"><a href="../seeavi/다운로드.jsp">다운로드</a></li>
            <li class="av"><a href="../community/커뮤니티.jsp">커뮤니티</a></li>
          
            <li class="av"><a href="index.jsp">고객센터</a></li>
            
            <!--기존 마이페이지 위치  -->

					<div class="dropdown" id="search">
						
						<button class="dropbtn">
							<img class="mylog" src="../images1/<%=memVo.getProfile() %>">
						</button>
						
						<div class="dropdown-content">
							<a href="../member/MyPage.jsp">마이페이지</a> 
							<a href="../member/Logout.jsp">로그아웃</a> 
							<a href="#">영화 이어서보기</a> 
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

	 <div id="image_container">
	 <%  if(memVo.getProfile()==null){ %>
	 <img alt="profile" src="../images1/프로필.png">
	 <% }else{ %>
	 	<img id="pro" src="../images1/<%=memVo.getProfile() %>" alt="Movie Title">
	 <% } %>
	 
	 </div>
	 

	<h2><%=memVo.getMem_nm()%>님 안녕하세요🙌</h2>
		<br>
            <fieldset class="field">
                <legend>이메일</legend>
                <%=memVo.getMem_id()%>
            </fieldset>
            <fieldset class="field">
                <legend>전화번호</legend>
          	 	<%=memVo.getMem_tel() %>
            </fieldset>
           <fieldset class="field">
                <legend>생일</legend>
             	 <%=memVo.getBir() %>
            </fieldset>
           <fieldset class="field" id="like">
                <legend>선호도 </legend>
                <%=memVo.getPre1()%>&nbsp;&nbsp;
                <%=memVo.getPre2() %>&nbsp;&nbsp;
                <%=memVo.getPre3() %>&nbsp;&nbsp;
            </fieldset>
	  

	  </div>

</body>
</html>