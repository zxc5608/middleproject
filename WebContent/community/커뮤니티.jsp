<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>

<title>Insert title here</title>
<link rel="stylesheet" href="../css/커뮤니티.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">


<script src="../js/community.js"></script>

<%	memberVO memVo = (memberVO)session.getAttribute("user");%>

<script>
$(function(){
	listPageServer(1);
	
	//페이지 번호를 클릭 했을때 이벤트 처리
	
	$('#pagelist').on('click', '.paging',function(){
		currentPage=$(this).text().trim();
		console.log(currentPage);
		listPageServer(currentPage);
	})
	//next버튼 클릭 이벤트
	$('#pagelist').on('click','.next',function(){
		//$('.paging:last')
		currentPage=parseInt($('.paging').last().text())+1;
		listPageServer(currentPage);
	})
	// 이전버튼 클릭 이벤트
	$('#pagelist').on('click','.prev',function(){
		//$('.paging:first')
		currentPage=parseInt($('.paging').first().text())-1;
		listPageServer(currentPage);
	})
	//각 버튼의 이벤트 -수정,삭제,댓글 등록, 댓글 수정, 댓글 삭제
	
		$('#wsend').on('click',function(){
		//입력한 모든 값을 가져온다.
		/* $('#name').val();
		$('#subject').val();
		data={"writer":name,"subject":subject} */
		//console.log($('#wform').serializeJSON());
		comSaveServer();
		
		//모달창 닫기
		$('#wModal').modal('hide');
		$('#wform.txt').val("");
		
		
	})
	$('.write2').on('click',function(){
		//입력한 모든 값을 가져온다.
		/* $('#name').val();
		$('#subject').val();
		data={"writer":name,"subject":subject} */
		//console.log($('#wform').serializeJSON());
		cont =$('#query').val();
		searchcommunity();
		
		
		
		
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
<div class ="board">
	<div id='cssmenu'>
<ul>
   
   <li class='has-sub'><a href='#'><span>리뷰 게시글</span></a>

   </li>
   <li class='has-sub'><a href='#'><span>작품요청하기</span></a>

   </li>

</ul>
</div>
<div class="review">


	<!-- 	 	<h2>리뷰 게시판</h2>
				<a href="리뷰작성.jsp"><button class="write1" type="submit">글쓰기</button></a>
				<table>
					<caption>
						<span>이벤트 당첨자</span>
					</caption>
					<tr class="view">
						<th><span>번호</span></th>
						<th><span>작성자</span></th>
						<th><span>제목</span></th>
						<th><span>조회수</span></th>
						<th><span class="bb">작성일자</span></th>
					</tr>
					<tr class='review1'>
					 <td></td>
						<td></td>
						<td><a href="리뷰상세.jsp" value="확인"></a></td>
						<td>99</td>
						<td></td> 
						
						
					</tr>
			


				</table> -->


			</div>
</div>
</div>

	



					<tr class="_noticeArticle board-notice type_main">
						<td colspan="2" class="td_article">

							<div class="board-tag">
								<strong class="board-tag-txt"> </strong>
							</div>
							<div class="board-list">
								<div class="inner_list">

									<a href="#" class="article"> </a> <a href="#"
										class="cmt"> </a>
								</div>
							</div>
						</td>

						<td class="td_name"><div class="pers_nick_area">
								<table role="presentation" cellspacing="0">
									
								</table>
							</div>
						<td class="td_date"></td>
						<td class="td_view"></td>

						<td class="td_likes"></td>

					</tr>

				</tbody>
			</table>



		
			<div class="qqua">
			
			<input type="text" id="query" name="query" placeholder="영화제목을 입력해주세요" value="">
			<button class="write2">검색</button>
			</div>
		


		<div id="pagelist">
		</div>
	
	
	<!-- Modal -->
<div id="wModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
	
		<form id="wform">
			
		
			
		
			<label>제목:</label> 
			<input type='text' class="txt" id='title' name="title" ><br>
				<label>평점</label> 
			<select id="tag" >
    		<option value="5"selected>5</option>
    		<option value="4">4</option>
    		<option value="3">3</option>
    		<option value="2">2</option>
		    <option value="1">1</option>
		   
		</select><br>
			<label>내용:</label>
			<textarea rows="10" cols="50"  class="txt" name="cont"></textarea><
		
			 
		
			<br>
			
			<input type='button' value='확인' id="wsend">			<br>
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