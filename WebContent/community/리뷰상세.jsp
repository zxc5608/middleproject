<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="../js/community.js"></script>
<%	memberVO memVo = (memberVO)session.getAttribute("user"); %>

  
<script>
$(function(){
$('#button-w').on('click',function(){
	
	//$('#uModal').modal('hide');
	//$('#uform .txt').val("");
	$('#uform .txt').modal('show');
});
$('#button-u').on('click',function(){
	
	//$('#uModal').modal('hide');
	$('#upform .tt').modal('show');
	//$('#upform .tt').val("");
	updatecont(<%= request.getParameter("no")%>)
});
	listAll(<%= request.getParameter("no")%>);
	updatecount(<%= request.getParameter("no")%>);
	
	$('#usend').on('click',function(){
		//입력한 모든 값을 가져온다.
		/* $('#name').val();
		$('#subject').val();
		data={"writer":name,"subject":subject} */
		//console.log($('#wform').serializeJSON());
		cont =$('#cont1').val();
		reason=$("#categ option:selected").val();

		
		reportuser(<%= request.getParameter("no")%>);
		
		//모달창 닫기
		$('#myModal').modal('hide');
		$('#uform.txt').val("");
		
		
	})
	
	$('#upsend').on('click',function(){
		//입력한 모든 값을 가져온다.
		/* $('#name').val();
		$('#subject').val();
		data={"writer":name,"subject":subject} */
		//console.log($('#wform').serializeJSON());
		cont =$('#cont2').val();
		title=$("#title").val();

		
		updatecom(<%= request.getParameter("no")%>);
		
		//모달창 닫기
		$('#upModal').modal('hide');
		$('#uform.txt').val("");
		
		
	})
});

</script>
  
<title>Insert title here</title>
<link rel="stylesheet" href="../css/커뮤니티.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<!--리뷰작성  -->
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
 <div class ="board">
 
	<div id='cssmenu'>
<ul>
   
   <li class='has-sub'><a href='../community/커뮤니티.jsp'><span>리뷰 게시글</span></a>
 
   </li>
   <li class='has-sub'><a href='#'><span>작품요청하기</span></a>
   
   </li>

</ul>
</div>
<div class="review-2"></div>
<div class="ta">
    <a href="커뮤니티.jsp" id="list" class="button-w">목록으로</a>
    <a href="#this" id="modify" class="button-u"data-toggle="modal" data-target="#upModal">수정하기</a>
    <a href="#this" id="siren" class="button-w" data-toggle="modal" data-target="#myModal">신고하기</a>
</div>

<div class="tabtab">

   </div>
          <br><br><br>
     <div class="reple">
     <h2>댓글</h2><br>
	<p class="p1">
		Tm32 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2020-12-10 19:12:08
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
			<br>
		<span class="cont">댓글입니다~</span>
		</p>
     </div>

		<input type="text" placeholder="댓글달기 " value="" class="rereple">
 		<a href="#"class="nput" onclick=""><button class="nput">입력</button></a>
 		
	</div>
	<!-- 신고하기 modal -->
<div id="myModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
	
  <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">신고하기</h4>
      </div>
      <div class="modal-body">
	
			<form id="uform">
			<label>신고 사유</label> 
			<select id="categ" >
    		<option value="신고사유"selected>신고사유</option>
    		<option value="욕설">욕설</option>
    		<option value="부적절한 내용">부적절한 내용</option>
    		<option value="도배">도배</option>
		    <option value="선정적 내용">선정적 내용</option>
		    <option value="정치적 내용">정치적 내용</option>
		   
		</select>
		<br>
			
	
			<label>신고내용:</label> <br> 
			<textarea rows="10" cols="50"  class="txt" id="cont1" name="content"></textarea>
			<br>
			
			<br>
      <div class="modal-footer">
			
        <button id="usend" type="button" class="btn btn-default" data-dismiss="modal">확인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
         </div>
        </form>
      </div>
		
	</div>
    </div>
    </div>
   
<!--수정하기 모달  -->
<div id="upModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
	
  <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">신고하기</h4>
      </div>
      <div class="modal-body">
	
		<form id="upform">
			
			<label>제목수정 : </label> 
			<input type='text' class="tt" id="title"  name= "writer">
			<br> 
			<br> 
	
			<label>내용 수정하기:</label> <br> 
			<textarea rows="10" cols="50"  class="txt" id="cont2" name="content"></textarea>
			<br>
			
			<br>
      <div class="modal-footer">
			
        <button type="button" class="btn btn-default" data-dismiss="modal" id="upsend">확인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
		</form>	
		
	</div>
    </div>
       </div>
    </div>

</body>
</html>