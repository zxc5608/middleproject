<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>qna</title>

<link rel="stylesheet" href="../css/Qna.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../js/qna.js"></script>

<%	memberVO memVo = (memberVO)session.getAttribute("user");%>

<script>
board = {};  // 객체 선언,
 currentPage=1; 
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
				  pbody = $(this).parents('.panel');
				  name = pbody.find('.nspan').text(); 	 // 제목
				
				  cont = pbody.find('.cspan').html(); 	 // 내용
				  cont = cont.replace(/<br>/g, "\n");
				  
				  
				  // uform에 출력
				  $('#uform #subject').val(name);
				 // $('#uform #subject').val(title);
				  $('#uform #cont').val(cont);
				  
				  
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
			board.subject = $('#uform #subject').val();
			board.content = $('#uform #cont').val();
 			board.seq = vidx;

			boardUpdateServer();
			//모달창 닫기
			$('#uModal').modal('hide');
			$('#uform').val("");
		})

	})
</script>
</head>
<body>
	<div class="back">
		<!-- 상단바 -->
		<div id="nav">
			<a href="../seeavi/netmain.jsp" id="logo"><img class="logo"
				src="../images1/savi.png"></a>
			<ul id="na">
				<li class="av"><a href="../seeavi/영화.jsp">영화보기</a></li>
				<li class="av"><a href="../shop/다운로드.jsp">다운로드</a></li>
				<li class="av"><a href="../community/커뮤니티.jsp">커뮤니티</a></li>

				<li class="av"><a href="../notice/notice.jsp">고객센터</a></li>
				<div class="dropdown" id="search">

					<button class="dropbtn">
						<img class="mylog" src="../images1/<%=memVo.getProfile() %>">
					</button>

					<div class="dropdown-content">
						<a href="../member/MyPage.jsp">마이페이지</a> <a
							href="../member/Logout.jsp">로그아웃</a> <a href="#">영화 이어서보기</a>
					</div>
				</div>
				<a type="button" href="../shop/shopbasket.jsp" id="search"><img
					class="search" src="../images1/장바구니흰.jpg"></a>
				<a type="button" href="#" id="search"><img class="search"
					src="../images1/흰돋보기.JPG"></a>
				<input type="text" id="searchDown" placeholder="콘텐츠 검색" value="">
			</ul>

		</div>

		<!-- 왼쪽 -->
		<div class="board">
			<div id='cssmenu'>
				<ul>

					<li class='has-sub'><a href='../notice/notice.jsp'><span>공지사항</span></a>

					</li>
					<li class='has-sub'><a href='../faq/faQ.jsp'><span>자주묻는질문</span></a>

					</li>
					<li class='has-sub'><a href='../qna/Qna.jsp'><span>Q&A</span></a>

					</li>


				</ul>
			</div>
		</div>


		<div class="review">

			<!-- 아코디언 게시판 만들기  -->

			<div class="box"></div>

		</div>

		<div id="pagelist"></div>

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
						<label style="color: #08088A;">제목</label> <input type='text'
							id='subject' name="subject" class="txt" style="color: black;"><br>
						<label style="color: #08088A;">내용</label> <br>
						<textarea rows="10" cols="50" name="content" id="cont" class="txt"
							style="color: black;"></textarea>
						<br> <input type='button' value='확인' id="usend"
							style="color: black; width: 50px;"><br>
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