<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/noticeM.css">
<!-- <link rel="stylesheet" href="../css/Qna.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/noticeM.js"></script>
<script>
function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}

	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
$(function(){
	
	$('#button-w').on('click',function(){
		
		$('#uform .txt').modal('show');
	});
	
	$('#button-u').on('click',function(){
		
		$('#upform .tt').modal('show');
	});
		
	listAll(<%= request.getParameter("no")%>);

	$('#delete').on('click', function() {
			//외부 스크립트의 idcheck()함수를 호출하여 공백,길이,정규식체크하여 올바른 데이터로 검증될 때만 ajax를 수행
			$.ajax({
				url : '/MiddleProject/deleteNotice.do',
				type : 'post',
				data : {
					"no" : '<%= request.getParameter("no")%>'
				},
				success : function(res) {
					alert(res.sw);
					location.href = "noticeM.jsp";
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})

		})
		
			$('#update').on('click', function(){
			 $('#uModal').modal('show');
			 
// 			 // 수정할 내용을 가져와서 modal창에 출력
// 			  pbody = $(this).parents('.tbady');
// 			  name = pbody.find('.nspan').html(); 	 // 제목
			
// 			  cont = pbody.find('.cspan').html(); 	 // 내용
// // 			  cont = cont.replace(/<br>/g, "\n");
			  
// 			  // uform에 출력
// 			  $('#uform #subject').val(name);
// 			 // $('#uform #subject').val(title);
// 			  $('#uform #cont').val(cont);
			  
			//외부 스크립트의 idcheck()함수를 호출하여 공백,길이,정규식체크하여 올바른 데이터로 검증될 때만 ajax를 수행
			$('#usend').on('click', function(){
				title = $('#subject').val();
				cont = $('#cont').val();
				
			$.ajax({
				url : '/MiddleProject/updateNotice.do',
				type : 'post',
				data : {
					"no" : '<%= request.getParameter("no")%>',
					"cont" : cont,
					"title" : title
				},
				success : function(res) {
					alert(res.sw);
					location.href = "noticeM.jsp";
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
			})
		})
		});
	
	

</script>
</head>
<body>

	<nav class="navbar navbar-inverse "> <img class="logo"
		src="<%=request.getContextPath() %>/images1/savi.png" alt="로고"
		align="left">
	<p id="pp">| 관리자 페이지</p>
	</nav>


	<!--  메뉴 Side Navigation  -->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<p class="sidefont">Content</p>
		<a href="<%=request.getContextPath()%>/admin/content.jsp">상영작 관리</a> <br>
		<p class="sidefont">Member</p>
		<a href="<%=request.getContextPath()%>/admin_mem/memberlist.jsp">회원
			관리</a> <a href="<%=request.getContextPath()%>/admin_mem/singo.jsp">신고
			회원 관리</a> <a href="<%=request.getContextPath()%>/admin_mem/payment.jsp">결제
			관리</a> <br>
		<p class="sidefont">Service center</p>
		<a href="<%=request.getContextPath()%>/admin_Service/qna.jsp">QnA</a>
		<a href="<%=request.getContextPath()%>/admin_Service/fNq.jsp">FnQ</a>
		<a href="<%=request.getContextPath()%>/admin_Service/noticeM.jsp">공지사항</a>
	</div>
	<span id="tt" onclick="openNav()">&#9776;</span>

	<div id="word">공지사항</div>
	<br>
	<br>
	<hr>
	<a href="<%=request.getContextPath() %>/admin/main.jsp" class="back">←
		관리자 페이지로 돌아가기</a>

	<hr>
	<h1 id="contw">공지사항 상세보기</h1>

	<div class="tabtab">
	</div>
	<div class="box">
	<br>
	<br>
	<button type="button" class="btn  btn-danger" id="update">수정하기</button>
	<br>
	<br>
	<button type="button" class="btn  btn-danger" id="delete">삭제하기</button>
	<br>
	<br>
	<a href="<%=request.getContextPath() %>/admin_Service/noticeM.jsp"><button
			type="button" class="btn  btn-danger" id="redbu">뒤로가기</button></a>
 </div>
	 <!-- modal uModal 글 수정 모달창-->
			  <div class="modal fade" id="uModal" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Modal Header</h4>
			        </div>
			        <div class="modal-body">
			        	
			        <form id="uform"> 
						<label style="color: #08088A;">제목</label> <input type='text' id='subject' name="subject" class="txt" style="
    color: black;
"><br>
						<label style="color: #08088A;">내용</label> <br> 
							<textarea rows="10" cols="50" name="content" id="cont" class="txt" style="color: black;"></textarea>
							<br>
						<input type='button' value='확인' id="usend" style="color: black; width: 50px; "><br>
					</form>
			        
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>

</body>
</html>