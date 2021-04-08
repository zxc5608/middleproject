<%@page import="member.dao.ImemberDao"%>
<%@page import="member.dao.MemberDaoImpl"%>
<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>개인정보 수정 페이지</title>
<link rel="stylesheet" href="../css/MyPage.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/netmain.css">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/updateMember.js"></script>
<%	memberVO memVo = (memberVO)session.getAttribute("user");%>
<script>
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("id", "img2");

			var oldImgs = document.querySelector("div#image_container")
					.getElementsByTagName("img")[0];
			//console.log("old=" + oldImgs);
			if (oldImgs != null) {
				document.querySelector("div#image_container").replaceChild(img,
						oldImgs);

			} else {
				document.querySelector("div#image_container").appendChild(img);

			}
		};
		reader.readAsDataURL(event.target.files[0]);
	}

function choise_chk(chk) {
		  var target = document.getElementsByName('content');
		  var num = 0;
		  var ropNum = 3; // 개수 임의지정
		  for(var i=0; i < target.length; i++) {
		    if(target[i].checked == true) {
		      num++;
		    }
		  }
		  
		  if(num > ropNum) {
		    chk.checked = false;
		    alert("선호도는 " + ropNum + "개 이상 체크 불가능합니다.")
		    return false;
		  }
		  $('#rop').html("✔").css('color', 'green');
		  return true;
		}
		
		//정규식 
	$(function() {
		$('.clear').on('click',function(){
			document.location.reload(true);
		})
		
		//file 값 가져오기 
		 $('#updatePr').click(function(){
            
//            val =$('input[name="profile"]').val().split("\\");
			filePath = $('input[name="profile"]').val();
           f_name = filePath.substring(filePath.lastIndexOf("\\")+1); //마지막 화일명
//            s_name = f_name.substring(f_name.length-4, f_name.length);//확장자빼오기
			
          	console.log(f_name);
            $.ajax({
				type : 'post',
				url : '/MiddleProject/memberUpdate.do',
				data : {
					"file" :  f_name
				},
				dataType : 'json',
				success : function(res) {
					alert(res.sw);
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				}
			}); //ajax끝
           
       });

		
		
		$('#pwd').change(function() {
			pwdvalue = $('#pwd').val().trim();
			console.log(pwdvalue);
			if (pwdvalue.length < 1) {
				$("#pwdCk").html("비밀번호를 입력하세요.").css("color", "red")
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
					$('#pwdCk').html(res.sw).css('color', 'green');
					
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				}
			}); //ajax끝
// // 			pvalue = $('#pwdCk').val()
// 				if("비밀번호 확인 성공".equals($('#pwdCk').val()))
// 				$('#pwd').prop('readonly', true);
		})

		$('#repwd').keyup(function() {
			if (!repwdcheck()) {
				return false;
			}
		})
		$('#repwd2').keyup(function() {
			if (!repwd2check()) {
				return false;
			}
		})
		
		$('#updatePw').on('click',function(){
			if(!pwdcheck()){
				return false;
			}
	 		repw = $('#repwd').val().trim();
			$.ajax({
				url :'/MiddleProject/memberUpdate.do',
				type :'post',
				data : {"repw" : repw},
				success : function(res){
// 					$('#idspan').html(res.sw).css('color','red');
					alert(res.sw);
				},
				error : function(xhr){
					alert("상태 : " +xhr.status);
				},
				dataType : 'json'
			})
			
	})	
		
		$('#hp').keyup(function() {
			if (!hpcheck()) {
				return false;
			}
		})
		$('#updateTel').on('click',function(){
			
			reHp = $('#hp').val().trim();
			$.ajax({
				url :'/MiddleProject/memberUpdate.do',
				type :'post',
				data : {"reHp" : reHp},
				success : function(res){
// 					$('#idspan').html(res.sw).css('color','red');
					alert(res.sw);
				},
				error : function(xhr){
					alert("상태 : " +xhr.status);
				},
				dataType : 'json'
			})
			
	})	
	
	$('#updateLike').on('click',function(){
		  var select = [];
		  
		    $('input[type="checkbox"]:checked').each(function (index) {
		        select.push($(this).val());
		    });
		    console.log(select);
		$.ajax({
			url :'/MiddleProject/memberUpdate.do',
			type :'post',
			traditional : true,
			data : {"reLike" : select},
			success : function(res){
//					$('#idspan').html(res.sw).css('color','red');
				alert(res.sw);
			},
			error : function(xhr){
				alert("상태 : " +xhr.status);
			},
			dataType : 'json'
		})
		
})	
		
		

	})
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
					<a href="MyPage.jsp">마이페이지</a>
					 <a href="Logout.jsp">로그아웃</a> 
					 <a href="#">영화 이어서보기</a>
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
	<div class="myform" id="myform_up">



		<div id="image_container"></div>

		<h2>개인 정보 수정하기🔗</h2>
		<p id="ptag">개인정보를 변경하시려면 입력후 확인 버튼을 눌러주세요</p>
		<br> <br>

		<div id="update">

<%-- 			<form action="<%=request.getContextPath()%>/memberUpdate.do" --%>
<!-- 				enctype="form-data" method="post"> -->
				<fieldset class="field">
					<legend>프로필 사진 변경 </legend>
					<br> <label class="control-label col-sm-2" for="file2">프로필
						사진 선택</label> <br>
					<br>
					<div class="col-sm-4">
						<input type="file" id="image" accept="image/*|jpg/*|png/*"
							onchange="setThumbnail(event);" name="profile" />


					</div>
					<div id="button">
						<input type="submit" id="updatePr" value="변경하기" class="submit-btn">
						<button class="clear" type="reset">취소</button>
					</div>
				</fieldset>
			</form>


			<fieldset class="field">
				<legend>비밀 번호 변경</legend>
				<br>
				<br> <input type="password" id="pwd" name="mem_pass"
					class="text-field" placeholder="현재 비밀번호" required="required">
				<br>
				<span class="res" id="pwdCk"></span> <br> <br> <input
					type="password" id="repwd" name="mem_repwd" class="text-field"
					placeholder="변경할 비밀번호" required="required"> <br> <span
					class="res" id="repwCk"></span> <br> <br> <input
					type="password" id="repwd2" name="mem_repwd" class="text-field"
					placeholder="비밀번호 확인" required="required"> <br> <span
					class="res" id="repw2Ck"></span> <br> <br>
				<div id="button">
					<input type="submit" id="updatePw" value="변경하기" class="submit-btn">
					<button class="clear" type="reset">취소</button>
				</div>
			</fieldset>
			<br>
			<fieldset class="field">
				<legend>전화번호 변경 </legend>
				<br> <input type="text" name="mem_hp" id="hp"
					class="text-field" placeholder="전화번호"><br> <span
					id="hpCk" class="res"></span> <br> <br>
				<div id="button">
					<input type="submit" id="updateTel" value="변경하기" class="submit-btn">
					<button type="reset" class="clear">취소</button>
				</div>
			</fieldset>

			<fieldset class="field">
				<legend>선호도 변경 </legend>
				<br>
				<div class="form-group">
					<input onclick="choise_chk(this)" type="checkbox" name="content"
						class="like" value="코미디">코미디 <input
						onclick="choise_chk(this)" type="checkbox" name="content"
						class="like" value="스릴러">스릴러 <input
						onclick="choise_chk(this)" type="checkbox" name="content"
						class="like" value="액션">액션 <input
						onclick="choise_chk(this)" type="checkbox" name="content"
						class="like" value="공포">공포 <input
						onclick="choise_chk(this)" type="checkbox" name="content"
						class="like" value="SF">SF <input
						onclick="choise_chk(this)" type="checkbox" name="content"
						class="like" value="애니">애니 <input
						onclick="choise_chk(this)" type="checkbox" name="content"
						class="like" value="다큐멘터리">다큐멘터리 <span id="rop"
						class="res"></span> <br>
				</div>
				<div id="button">
					<input type="submit" id="updateLike" value="변경하기"
						class="submit-btn">
					<button type="reset" class="clear">취소</button>
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>