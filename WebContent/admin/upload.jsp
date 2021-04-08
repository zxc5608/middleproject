<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/uploadM.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery-3.5.1.min.js"></script>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

function Category(value) {
	if(value=="down"){
		// 보이기 
		document.getElementById("pri").style.display="block";
	}else{
		document.getElementById("pri").style.display="none";
	}
}

/* 이미지 파일첨부로 받아서 추가하는 쿼리 */
function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
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

<nav class="navbar navbar-inverse ">
	 <img class="logo" src="../images1/넷플릭스_로고.png" alt="로고" align="left">
	 <p id="pp" >| 관리자 페이지</p>
</nav>
 

<!--  메뉴 Side Navigation  -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <p class="sidefont">Content</p>
   <a href="<%=request.getContextPath()%>/admin/content.jsp">상영작 관리</a>
  <br>
  <p class="sidefont">Member</p>
  <a href="<%=request.getContextPath()%>/admin/memberlist.jsp">회원 관리</a>
  <a href="<%=request.getContextPath()%>/admin/singo.jsp">신고 회원 관리</a>
  <a href="<%=request.getContextPath()%>/admin/payment.jsp">결제 관리</a>
  <br>
  <p class="sidefont">Service center</p>
  <a href="<%=request.getContextPath()%>/admin/qna.jsp">QnA</a>
  <a href="<%=request.getContextPath()%>/admin/fNq.jsp">FnQ</a>
  <a href="<%=request.getContextPath()%>/admin/noticeM.jsp">공지사항</a>
</div>
<span id="tt" onclick="openNav()">&#9776;</span>

<div id="word">상영작 관리</div> 
<br><br>

<hr>
	<a href="<%=request.getContextPath() %>/admin/main.jsp" class="back">←  관리자 페이지로 돌아가기</a>

<hr>
	<h1 id="contw">상영작 등록</h1>

<div class="divv">
	
<div>
	<select name="genre" class="sel">
		<option value="">장르</option>
		<option value="로맨스">로맨스</option>
		<option value="코미디">코미디</option>
		<option value="액션">액션</option>
		<option value="공포">공포</option>
		<option value="SF">SF</option>
		<option value="애니">애니</option>
		<option value="다큐">다큐</option>
		<option value="스릴러">스릴러</option>
	</select>
</div>
</div>
<br><br><br>

<div class="container" id="Ncon">
 <form id="upform" class="form-horizontal">
		<div class="form-group">
			<label class="control-label col-sm-2" for="name">제목</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="name"
					placeholder="제목 입력" name="mem_id">
			</div>
		</div>
	<br><br>
			<div class="form-group">
				<label class="control-label col-sm-2" for="contents">내용</label>
				<div class="col-sm-4">
						<textarea class="form-control" id="contents"
						>
						</textarea>	
				</div>
			</div>
			
		<br><br>	
			<div class="form-group">
				<label class="control-label col-sm-2" for="file1">영상 파일 선택</label>
				<div class="col-sm-4">
						<input type="file">
				</div>
			</div>
			<br>
			<!-- 이미지를 넣으면 옆에 미리보기 창에 뜸 -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="file2">포스터 파일 선택</label>
				<div class="col-sm-4">
				<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/> 
						
				</div>
			</div>
			
			<br><br>
			<div class="form-group" id="pri" style="display: none" >
				<label class="control-label col-sm-2" for="price">가격입력</label>
				<div class="col-sm-4">
						<input type="text" class="form-control" id="price"
							placeholder="가격 입력"  >
				</div>
			</div> 
	
			
		</form>
		<div id="upbutton">
		<input type="button" value="등록">
		</div>

	
</div>




<!-- 이미지 넣는 공간 -->
<p>미리보기</p>
<div id="image_container"></div>
























</body>
</html>






