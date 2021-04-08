<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/qnaM.css">	
<script src="../js/qnaAdmin.js"></script>

<!-- <link rel="stylesheet" href="../css/Qna.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

 <!-- 관리자 QNA -->
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}


board = {};  // 객체 선언,
currentPage=1; 
/* 	function buttup() {
		alert("수정되었습니다")

	} */
	function buttdel() {
		alert("삭제되었습니다")

	}
	
	$(function(){
		  //listAll();
		  listPageServer(1);
		  
		  //페이지 번호를 클릭 이벤트 처리 
		  $('#pagelist').on('click', '.paging', function(){
			  
			  currentPage =    $(this).text().trim();
			  console.log(currentPage);
			  listPageServer(currentPage);
		  })
		  //next버튼 클릭 이벤트 
		  $('#pagelist').on('click', '.next', function(){
			  
			  
			  //$('.paging:last')
			   currentPage =  parseInt( $('.paging').last().text() ) + 1; 
			   listPageServer(currentPage);
		  })
		  
		  //이전 버튼 클릭 이벤트 
		  $('#pagelist').on('click', '.prev', function(){
			  
			  //$('.paging:first')
			   currentPage =  parseInt( $('.paging').first().text() ) - 1; 
			   listPageServer(currentPage);
		  })
		  
		  //각 버튼의 이벤트 - 수정, 삭제, 댓글 등록 , 댓글 수정, 댓글 삭제
		  $('.box').on('click', '.action', function(){
			  
			  vidx =   $(this).attr('idx');
			  vname = $(this).attr('name');
			  
			  if(vname == 'modify'){
				  //alert(vidx + "번글 수정")
				 $('#uModal').modal('show');
				  
				  // 수정할 내용을 가져와서 modal창에 출력
				  pbody = $(this).parents('.panel-body');
				  name = pbody.find('.nspan').text(); 	 // 제목
				  
				  acont = pbody.find('.aspan').html(); 	 // 답변
				  acont = acont.replace(/<br>/g, "\n");
					  
				  cont = pbody.find('.cspan').html(); 	 // 내용
				  cont = cont.replace(/<br>/g, "\n");
				  
				  
				  // uform에 출력
				  $('#uform #subject').val(name);
				 // $('#uform #subject').val(title);
				  $('#uform #cont').val(cont);
				  
				  $('#uform #acont').val(acont);
				  
				  
			  }else if(vname == 'delete'){
				  //alert(vidx + "번글 삭제")
				  qnaDeleteServer(this);
				  
				  
			  }else if(vname == 'reply'){
				  //alert(vidx + "번글의 댓글 등록 ");
				  //reply테이불에 저장 - renum, bonum, name, cont, redate
				  reply.bonum = vidx;
				  rname1 = Math.floor(Math.random()* 50 +1 );
				  rname2 = String.fromCharCode(Math.random()* 26 +65); //65~90
				  rname3 = String.fromCharCode(Math.random()* 26 +97 );//97~112  
					  
					  
				  reply.name =  rname2 + rname3 + rname1;
				  reply.cont = $(this).parent().find('.area').val();
				  
				  $(this).parent().find('.area').val(""); 
				  //ajax를 통해서 reply객체를 서버로 보내기 
				  replySaveServer(this);
				  
			  }else if(vname == 'list'){  //제목 클릭하면 해당 댓글 가져오기 
				  
				  // 조회수 증가
				  vclass = $(this).parents('.panel').find('.in').attr('class');
			  		console.log(vclass);
			  		
			  		// 닫혔을때 제목을 클릭하면 in이 없는 상태 - undefined - 조회수 증가
			  		// undefined는 일반 문자가 아니기 때문에 typeof를 이용하여 비교
			  		if(typeof vclass == "undefined"){
			  			hitUpdateServer(this);
			  		}
			  		
				  
				  replyListServer(this);  //this -> list  :a태그
			  }else if(vname == "r_modify"){
				  //alert(vidx + "번 댓글을 수정합니다 ")
				  
				  //수정폼이 이미 열려있는지 비교 
				  //다른 곳에 열려 있다면  열려 있는 수정폼을 닫는다 - 폼을 body태그로 다시 append한다 
				  if($('#modifyForm').css('display') != 'none'){
					//다른 곳에  이미 열려 있다
					  replyReset();
				  }
				  
				  //원래 내용 가져오기 
				 modifycont =  $(this).parents('.rep').find('.cont').html();
				 //<br>를 \n으로 변경 
				 modifycont = modifycont.replace(/<br>/g,"\n");
				 //수정내용를 수정폼의 text에 출력 
				 $('#text').val(modifycont);
				 
				 //body에 있는 댓글 수정폼을  댓글 수정위치로 추가한다 
				 $(this).parents('.rep').find('.cont').empty().append($('#modifyForm'))
				 $('#modifyForm').show();
				 
			  }else if(vname == "r_delete"){
				 // alert(vidx + "번 댓글을 삭제합니다")
				 replyDeleteServer(this);
				 
				
			  }
			  
			  
		  })
		 
		  

	// 글 수정창에서 글 수정후 확인 버튼 클릭
		$('#usend').on('click', function() {

			// 모달창에 수정된 내용을 가져온다
// 			board.subject = $('#uform #subject').val();
// 			board.content = $('#uform #cont').val();
			board.reply = $('#uform #acont').val();
			board.seq = vidx;
		

			var panelBody = pbody;
			boardUpdateServer(board, panelBody);
			//모달창 닫기
			$('#uModal').modal('hide');
			$('#uform #acont').val("");
		})

	})
	
</script>
</head>
<body>

<nav class="navbar navbar-inverse ">
	 <img class="logo" src="<%=request.getContextPath() %>/images/넷플릭스_로고.png" alt="로고" align="left">
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

<div id="word">고객센터</div> 
<br><br>
<hr>
	<a href="<%=request.getContextPath() %>/admin/main.jsp" class="back">←  관리자 페이지로 돌아가기</a>

<hr>
	<h1 id="contw">QnA 관리자</h1>



<div class="review">

<!-- 아코디언 게시판 만들기  -->
<div class="box">
</div>

		</div>
		
					<div id="pagelist">
		
		</div>
	

	 <!-- modal uModal 글 딥변 모달창-->
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
						
						<label style="color: #08088A;">답변</label> <br> 
							<textarea rows="10" cols="50" name="content" id="acont" class="txt" style="color: black;"></textarea>
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