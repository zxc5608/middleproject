/**
 * 
 */
//다운로드 회원 조회하기 
var downList = function() {
	code="";
	$.ajax({
		url : "/MiddleProject/downList.do",
		type : "post",
		dataType : "json",
		success : function(res) {
			code += 	 '<div class="panel panel-danger">';
		code+='  <div class="panel-heading">결제 리스트</div>';
		code+='  </div>                                 ';
		code+='	 <h2 id="listmember">결제 리스트</h2> ';
		code+='	                                        ';
		code+='	<table>                                 ';
		code+='		<caption>                           ';
		code+='			<span>결제 list</span>            ';
		code+='		</caption>                          ';
		code+='		<tr class="aa">                     ';
        code+='                                         ';
		code+='			<th><span>결제일</span></th>       ';
		code+='			<th><span>영화명</span></th>       ';
		code+='			<th><span>가격</span></th>        ';
		code+='			<th><span>결제방식</span></th>     ';
		code+='		                                    ';
		code+='		</tr>                               ';
			$.each(res,function(i, v) {

	code+='			<tr>                 ';
	code+='			<td>'+v.date+'</td>   ';
	code+='			<td>'+v.movie+'</td>       ';
	code+='			<td>'+v.price+'</td>       ';
	code+='			<td>'+v.kind+'</td>    ';
	code+='		</tr>                    ';
	code+='		                         ';
    code+='                              ';
			})
			code+='	</table>                     ';

			$('.gesi').html(code);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
	})
}







// 결제회원 조회하기
var payList = function() {
	code="";
	$.ajax({
		url : "/MiddleProject/payList.do",
		type : "post",
		dataType : "json",
		success : function(res) {
			code += 	 '<div class="panel panel-danger">';
		code+='  <div class="panel-heading">결제 리스트</div>';
		code+='  </div>                                 ';
		code+='	<!-- <h2 id="listmember">결제 리스트</h2> -->';
		code+='	                                        ';
		code+='	<table>                                 ';
		code+='		<caption>                           ';
		code+='			<span>결제 list</span>            ';
		code+='		</caption>                          ';
		code+='		<tr class="aa">                     ';
        code+='                                         ';
		code+='			<th><span>결제일</span></th>       ';
		code+='			<th><span>회원ID</span></th>      ';
		code+='			<th><span>회원명</span></th>      ';
		code+='			<th><span>상품명</span></th>       ';
		code+='			<th><span>가격</span></th>        ';
		code+='		                                    ';
		code+='		</tr>                               ';
			$.each(res,function(i, v) {

	code+='			<tr>                 ';
	code+='			<td>'+v.paydate+'</td>   ';
	code+='			<td>'+v.id+'</td>       ';
	code+='			<td>'+v.name+'</td>       ';
	code+='			<td>스트리밍 한달 이용권</td>     ';
	code+='			<td>10000원</td>      ';
	code+='		</tr>                    ';
	code+='		                         ';
    code+='                              ';
			})
			code+='	</table>                     ';

			$('.gesi').html(code);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
	})
}


singo = function() {
	$('#warning').on('click',function(){
		value = $(".due option:selected").val();
		console.log(value);
		$.ajax({
			type : 'post',
			url : '/MiddleProject/singo.do',
			data : {
				"war" : value
			},
			dataType : 'json',
			success : function(res) {
				alert(res.sw);
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			}
		});
	})
}

//신고 회원 상세보기 

var singoBoard = function() {
	
	code="";
	$.ajax({
		url : "/MiddleProject/singoList.do",
		type : "get",
		dataType : "json",
		success : function(res) {
			code += '<div class="panel-group" id="accordion">';
			$.each(res,function(i, v) {
								code += '<div class="panel panel-default">';
								code += '<div class="panel-heading">';
								code += '<h4 class="panel-title">';
								code+='  <a data-toggle="collapse" data-parent="#accordion" href="#collapse20">신고당한 내역'+v.no+'</a>       ';
								code += '</h4>';
								code += '</div>';
								code+='    <div id="collapse20" class="panel-collapse collapse ">                   ';
								code+='      <div class="panel-body">                                                                   ';
								code+='        <p  class="p1">                                                                          ';
								code+='                    신고 번호 : '+v.no+'   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                            ';
								code+='                    신고한 아이디     : '+v.BadId+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                ';
								code+='                    신고자     : '+v.GoodId+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                ';
								code+='                    신고일자 : +'+v.date+  ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     <br>              ';
								code+='                    신고사유 : ' + v.res +'  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                              ';
								code+='        </p>                                                                                     ';
								code+='        <div class="stopd">                                                                      ';
								code+='        	<select name="d" class="due">                                                         ';
								code+='				<option value="">회원정지기간</option>                                                    ';
								code+='				<option value="1">1주</option>       ';
								code+='				<option value="2">2주</option>       ';
								code+='				<option value="2">3주</option>       ';
								code+='				<option value="2">4주</option>       ';
								code+='				<option value="2">5주</option>       ';
								code+='				<option value="2">6주</option>       ';
								code+='			</select>                                                                               ';
								code+='        </div>                                                                                   ';
								code+='        <p class="p2">                                                                           ';
								code+='           <button type="button" idx="20" id="warning" class="btn btn-danger" onclick=singo()>계정정지</button>           ';
								code+='        </p>                   ';
								code+='        <hr>                   ';
								code+='        <p>          ';
								code+= v.cont;
								code += '		</p>';
								code += '	</div>';
								code += '</div>';
								code += '</div>';
							})
			code += '</div>';

			$('.box').html(code);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
	})
}


// 신고회원 출력하기
var singoList = function() {
	code = " ";
	$.ajax({
		url : "/MiddleProject/singoList.do",
		type : "post",
		dataType : "json",
		success : function(res) {
			code += ' <h2>신고된 회원 게시판</h2>'
			code +='<a id ="detail" href="../admin_mem/singo2.jsp">자세히 보기 </a>';
			
			code += ' <table>  ';
			code += '	<tr class="aa">                  ';
			code += '		<th><span>&nbsp;&nbsp;  신고 번호</span></th>   ';
			code += '		<th><span>&nbsp;&nbsp;&nbsp;  신고된 회원</span></th>   ';
			code += '		<th><span>&nbsp;&nbsp;&nbsp;  신고날짜</span></th>     ';
			code += '	</tr>                            ';
			
			$.each(res, function(i, v) {
				code += '	<tr>                             ';
				code += '		<td>&nbsp;&nbsp;&nbsp;&nbsp;  ' + v.no + '</td>                   ';
				code += '		<td>&nbsp;&nbsp;  ' + v.BadId + '</td>               ';
				code += '		<td>&nbsp;&nbsp;   ' + v.date + '</td>                 ';
				code += '	</tr>                            ';
			})
			code += '	</table> ';
			$('#singo').html(code);

		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
	})
}

// 페이지별 리스트 출력하기
// currentPage = 1;
// var listPage = function(page) {
var listPage = function() {
	code = "";
	$.ajax({
		url : "/MiddleProject/memList.do",
		type : "post",
		// data : {"page" : page },
		dataType : "json",
		success : function(res) {
			code += '<h2 id="listmember">회원 List</h2> ';
			code += '<table>                           ';
			code += '	<caption>                        ';
			code += '		<span>회원 list</span>         ';
			code += '	</caption>                       ';
			code += '	<tr class="aa">                  ';
			code += '                                  ';
			code += '		<th><span>회원번호</span></th>   ';
			code += '		<th><span>회원ID</span></th>   ';
			code += '		<th><span>이름</span></th>     ';
			code += '		<th><span>결제여부</span></th>   ';
			code += '	                                 ';
			code += '	</tr>                            ';
			$.each(res, function(i, v) {
				code += '	<tr>                             ';
				code += '		<td>' + v.no + '</td>                   ';
				code += '		<td>' + v.id + '</td>               ';
				code += '		<td> ' + v.name + '</td>                 ';
				if (v.payok == 1) {
					code += '		<td>' + "결제O" + '</td>                 ';
				} else {
					code += '		<td>' + "결제X" + '</td>                 ';
				}
				code += '	</tr>                            ';
			})
			code += '	</table> ';
			$('#memList').html(code);

		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		}
	})

}