var listAll = function(no){
	//게시글 가져오기 
	  $.ajax({
		  url : '/MiddleProject/noDetail.do',
		  data : {"no" : no},
		  type : 'post',
		  dataType : 'json',
		  success : function(res){
                code = '  <table class="tab" > ';
                code +='    <h2 id= "see">공지사항 상세보기</h2><br><br><br>';
                code +='    <colgroup>';
                code +='         <col width="15%">';
                code +='         <col width="35%">';
                code +='           <col width="15%">';
                code +='           <col width="*">';
                code +='           </colgroup> ';
                  
                code +='		<tbody class="tbady"> ';
                 
                code +='     <tr>';
             
                code +='           <th class="td_th">공지제목 : </th>';
                code +='           <td class="td_td"><span class="nspan">'+ res.title +'</span></td>';
                code +='            <th class="td_th">공지번호 : </th>';
                code +='            <td class="td_td">'+ res.no +'</td>';
                code +='          </tr>';
                     
                code +='     <tr>';
                code +='              <th class="td_th">관리자 이름 : </th>';
                code +='              <td class="td_td">'+ res.name +'</td>';
                code +='              <th class="td_th">작성일자 : </th>';
                code +='              <td class="td_td">'+ res.date +'</td>';
                code +='           </tr>';
                code +='              <tr>';
                code +='                  <th class="td_th"><span class="cspan">내용 : </th>';
                code +='                  <td colspan="3" class="td_th">';
                code +=			'<br>'+	res.cont + 	'</span>  <br><br><br>';
         	             
                code +='         </td>';
                code +='     </tr>';
                code +='	<tr></tr>';

                code +='		</tbody>'; 
                

			  code +=' </table>';
			
			  
			  $('.tabtab').html(code);
		  },
		  error : function(xhr){
			  alert("상태 : " + xhr.status)
		  }
	  })
	
}
















var listPage = function(cpage) {
	code = "";
	$
			.ajax({
				url : '/MiddleProject/notice.do',
				type : 'post',
				data : {
					"page" : cpage
				},
				dataType : 'json',
				success : function(res) {

					code += '<h1 id="contw">공지사항</h1>';
					// code+=' <a href="<%=request.getContextPath()
					// %>/admin_Service/noticeNEW.jsp"> <button type="button"
					// idx="20" name="" id="btnn"class="btn btn-info
					// action1">새글작성</button></a>';

					code += '<table>';

					code += '<tr class="aa">';
					code += '	<th><span>번호</span></th>';
					code += '	<th><span>작성자</span></th>';
					code += '<th><span>공지제목</span></th>';
					code += '<th><span class="bb">작성일자</span></th>';
					code += '</tr>';
					$
							.each(
									res.datas,
									function(i, v) {
										code += '			<tr>';
										code += '					<td>' + v.no + '</td>';
										code += '				<td>' + v.name + '</td>';
										code += '				<td><a href="/MiddleProject/admin_Service/noDetailM.jsp?no='+ v.no
												+ '" value="확인">'
												+ v.title + '</a></td>';
										code += '				<td>' + v.date + '</td>';
										code += '				</tr>';
									})
					code += '  </table>';

					$('.review').html(code);
					// pagelist에append를 이용해서 출력
					$('#pagelist').empty();
					// 이전버튼 출력
					if (res.sp > 1) {
						pager = '<ul class="pager">';
						pager += '  <li><a  class="prev" href="#">Previous</a></li>';
						pager += '</ul>';
						$('#pagelist').append(pager);
					}

					// 페이지번호 출력
					pager = '<ul class="pagination pager">';
					for (i = res.sp; i <= res.ep; i++) {
						if (currentPage == i) {
							pager += ' <li  class="active"><a  class="paging" href="#">'
									+ i + '</a></li>';
						} else {
							pager += ' <li><a   class="paging" href="#">' + i
									+ '</a></li>'
						}
					}
					pager += '</ul>'
					$('#pagelist').append(pager);

					// 다음 버튼 출력
					if (res.ep < res.tp) {
						pager = '<ul class="pager">';
						pager += '  <li><a  class="next" href="#">Next</a></li>';
						pager += '</ul> ';
						$('#pagelist').append(pager);
					}

				},
				error : function(xhr) {
					alert("상태 : " + xhr.status)
				}

			})
}
