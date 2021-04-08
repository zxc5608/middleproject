<%@page import="VO.movieVO"%>
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
<script src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- <script src="../js/kakao.js"></script> -->
<%	memberVO memVo = (memberVO)session.getAttribute("user"); 
	String email = memVo.getMem_id();
	String tel = memVo.getMem_tel();
	String name = memVo.getMem_nm();
%>

<script>
 $(function(){
	 $('#pay').on('click',function(){
	        var IMP = window.IMP; // 생략가능
// 	        IMP.init('TC0ONETIME'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        
	        IMP.request_pay({
	        	pg : 'inicis',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '회원권 결제',
	            amount : 100,
	            buyer_email : '<%=email%>',
	            buyer_name : '<%=name%>',
	            buyer_tel : '<%=tel%>',
	            buyer_addr : '대전 ',
	            buyer_postcode : '123-456',
	            //m_redirect_url : 'http://www.naver.com'
	        }, function(rsp) {
	            if ( rsp.success ) {
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                jQuery.ajax({
	                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        imp_uid : rsp.imp_uid,
	                        id :  buyer_email,
	                        pay :  amount
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    }
	                }).done(function(data) {
	                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                    if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
// 	                        msg += '\n고유ID : ' + rsp.imp_uid;
// 	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
// 	                        msg += '\결제 금액 : ' + rsp.paid_amount;
// 	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	                        
	                        alert(msg);
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
	                });
	                //성공시 이동할 페이지
	                location.href="../seeavi/영화.jsp";// 결제성공 페이지 경로 달아주기
	            } else {
	                msg = '결제에 실패하였습니다.  : ';
	                //실패시 이동할 페이지
	                location.href="Payment.jsp";// 결제성공 페이지 경로 달아주기
	                alert(msg);
	            }
	        })
	        
	    })
	    })

    </script>
</head>
<body>


	<div id="nav">

		<a href="../seeavi/netmain.jsp" id="logo"><img class="logo"
			src="../images1/savi.png"></a>
		<ul id="na">
			<li class="av"><a href="../seeavi/영화.jsp">영화보기</a></li>
			<li class="av"><a href="../seeavi/다운로드.jsp">다운로드</a></li>
			<li class="av"><a href="../community/커뮤니티.jsp.jsp">커뮤니티</a></li>

			<li class="av"><a href="index.jsp">고객센터</a></li>

			<div class="dropdown" id="search">

				<button class="dropbtn">
					<img class="mylog" src="../images1/<%=memVo.getProfile()%>">
				</button>

				<div class="dropdown-content">
					<a href="MyPage.jsp">마이페이지</a> <a href="Logout.jsp">로그아웃</a> <a
						href="#">영화 이어서보기</a>

				</div>
			</div>
			<a type="button" href="#" id="search"><img class="search"
				src="../images1/장바구니흰.jpg"></a>
			<a type="button" href="#" id="search"><img class="search"
				src="../images1/흰돋보기.JPG"></a>
			<input type="text" id="searchDown" placeholder="콘텐츠 검색" value=""
				class="MuiInputBase-input-128 MuiInput-input-116 jss86 jss96 jss77 MuiInputBase-inputAdornedStart-132">
		</ul>

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

		<div class="myform">


			<div id="image_container">
				<img id="pro" src="../images1/<%=memVo.getProfile()%>"
					alt="Movie Title">
			</div>
			<h2>이용권 결제</h2>
			<%-- 		<form action="<%=request.getContextPath()%>/complete.do" method="post"> --%>
			<p>
			<fieldset class="field">
				<legend>이메일</legend>
				<%=memVo.getMem_id()%>
			</fieldset>
			<fieldset class="field">
				<legend>전화번호</legend>
				<%=memVo.getMem_tel() %>
			</fieldset>
			<fieldset class="field">
				<legend>이름</legend>
				<%=memVo.getMem_nm() %>
			</fieldset>

			<span>회원권 가격: </span>
			<p>
				<input name="totalPrice" value="  10000원" readonly>
			</p>

			<input type="button" value="결제하기" id="pay"> <input
				type="reset" value="취소하기">
			<!-- 		</form> -->
		</div>
</body>
</html>