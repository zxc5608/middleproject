/**

 * 
 */
currentPage =1;


var listPageServer= function(cpage){
	
	$.ajax({
		url: '/MiddleProject/communityList.do',
		type:'post',
		data:{"page" : cpage},
		success:function(res){
			code="<h2>리뷰 게시판</h2>";
			code+= "<a href='#'><button class='write1' type='submit'data-toggle='modal' data-target='#wModal'>글쓰기</button></a>";
			
			code+= "<table>";
			code+= "	<caption>";
			
			code+= "	</caption>";
			code+= "	<tr class='view'>";
			code+= "		<th><span>번호</span></th>";
			code+= "		<th><span>작성자</span></th>";
			code+= "		<th><span>제목</span></th>";
			code+= "		<th><span>조회수&nbsp;&nbsp;&nbsp;&nbsp;</span></th>";
			code+= "		<th><span class='bb'>작성일자</span></th>";
			code+= "	</tr>";
			$.each(res.datas,function(i,v){
				
	
				code+= "<tr class=review1>";
				
				code+="<td>"+v.comno+"</td>";
				code+="	<td>"+v.writer+"</td>";
				code+='<td><a href="/MiddleProject/community/리뷰상세.jsp?no=' + v.comno +'" value="확인">'+v.title+'</a></td>';
				code+="<td>"+v.count+"</td>";
				code+="<td>"+v.comdate+"</td>";
				code+="</tr>";		
				
				
				
				
			})
			code+="</table>";	
			
			$('.review').html(code);
			  //pagelist에 append를 이용해서 출력
			  $('#pagelist' ).empty();
			  if(res.sp>1){
				  //이전버튼
				  pager='<ul class="pager">';
				  pager+='<li><a class="prev" href="#">Previous</a></li>';
				  pager+='</ul>';
				  $('#pagelist').append(pager);
			  }
			  //페이지번호 출력
			  pager='<ul class="pagination pager">';
			  for(i=res.sp; i<=res.ep; i++){
				  if(currentPage ==i){
					  pager+='<li class="active"><a class="paging" href="#">'+i+'</a></li>';
				  }else{
					  pager+='<li><a class="paging" href="#">'+i+'</a></li>'
				  }
			  }
			  pager+='</ul>'
				  $('#pagelist').append(pager);  
			  //다음 버튼 출력
			if(res.ep < res.tp){
				 pager='<ul class="pager">';
				  pager+='<li><a class="next" href="#">Next</a></li>';
				  pager+='</ul>';
				  $('#pagelist').append(pager);
			}

			
		},
		
		dataType:'json',
		error:function(xhr){
			alert("상태:"+ xhr.status)
		}
	})

}
var listAll = function(no){
	
	//게시글 가져오기 
	  $.ajax({
		  url : '/MiddleProject/communityDetail.do',
		  data : {"no" : no},
		  type : 'post',
		  dataType : 'json',
		  success : function(res){
			
			
                
                /////////////////////////////////////////////////
                
			code=' <table class="tab" >';
			code+='  <h2 id= "see">상세보기</h2><br>';
			code+='  <colgroup>';
			code+="       <col width='15%'>";
			code+="      <col width='35%'>";
			code+="     <col width='15%'>";
			code+='     <col width="*">';
			code+='  </colgroup> ';
			code+='   <tbody class="tbady"> ';
			code+='       <tr>';
			code+='              <th class="th_th">제목</th>';
			code+='         <td class="td_td">'+res.title+'</td>';
			code+='          <th class="th_th">조회수</th>';
			code+='         <td class="td_td">'+res.count+'</td>';
			code+='      </tr>';
			code+='      <tr>';
			code+='         <th class="th_th">작성자</th>';
			code+='         <td class="td_td">'+res.writer+'</td>';
			code+='         <th class="th_th">작성시간</th>';
			code+='         <td class="td_td">'+res.comdate+'</td>';
			code+='    </tr>';
			code+='     <tr>';
			code+='        <th class="th_th">내용</th>';
			code+='         <td colspan="3" class="td_td">';
			code+='                  '+res.cont+'';
			code+='      </td>';
			code+='    </tr>';
			code+='  <tr></tr>';
			code+='	</tbody> ';
			code+='</table>';
			  $('.tabtab').html(code);
		  },
		  error : function(xhr){
			  alert("상태 : " + xhr.status)
		  }
	  })
	  
	
}
var updatecount=function(no){
	$.ajax({
		url:'/MiddleProject/updatecount.do',
		data:{"no" : no},
		type : 'post',
		dataType : 'json',
		success:function(res){
		},
	})
	
	
}

var comSaveServer=function(){
	$.ajax({
		url:'/MiddleProject/comwrite.do',
		data:$('#wform').serializeJSON(),
		type : 'post',
		dataType : 'json',
		success:function(res){
			//alert(res.sw);
			listPageServer(1);
		},
	})
	
	
}
var reportuser=function(no){
	$.ajax({
		url:'/MiddleProject/comreport.do',
		data:{"cont" : cont, "reason" : reason, "no" : no},
		type : 'post',
		dataType : 'json',
		success:function(res){
			//alert(res.sw);
			listPageServer(1);
		},
	})
	
	
}
var updatecom=function(no){
	$.ajax({
		url:'/MiddleProject/updatecom.do',
		data:{"cont" : cont, "title" : title, "no" : no},
		type : 'post',
		dataType : 'json',
		success:function(res){
		},
	})
	
	
}
var searchcommunity=function(){
	$.ajax({
		url:'/MiddleProject/searchcom.do',
		data:{"cont":cont},
		type : 'post',
		dataType : 'json',
		success:function(res){
			code="<h2>리뷰 게시판</h2>";
			code+= "<a href='#'><button class='write1' type='submit'data-toggle='modal' data-target='#wModal'>글쓰기</button></a>";
			
			code+= "<table>";
			code+= "	<caption>";
			
			code+= "	</caption>";
			code+= "	<tr class='view'>";
			code+= "		<th><span>번호</span></th>";
			code+= "		<th><span>작성자</span></th>";
			code+= "		<th><span>제목</span></th>";
			code+= "		<th><span>조회수&nbsp;&nbsp;&nbsp;&nbsp;</span></th>";
			code+= "		<th><span class='bb'>작성일자</span></th>";
			code+= "	</tr>";
			$.each(res.datas,function(i,v){
				
	
				code+= "<tr class=review1>";
				
				code+="<td>"+v.comno+"</td>";
				code+="	<td>"+v.writer+"</td>";
				code+='<td><a href="/MiddleProject/community/리뷰상세.jsp?no=' + v.comno +'" value="확인">'+v.title+'</a></td>';
				code+="<td>"+v.count+"</td>";
				code+="<td>"+v.comdate+"</td>";
				code+="</tr>";		
				
				
				
				
			})
			code+="</table>";	
			$('.review').html(code);
			  //pagelist에 append를 이용해서 출력
			  $('#pagelist' ).empty();
			  if(res.sp>1){
				  //이전버튼
				  pager='<ul class="pager">';
				  pager+='<li><a class="prev" href="#">Previous</a></li>';
				  pager+='</ul>';
				  $('#pagelist').append(pager);
			  }
			  //페이지번호 출력
			  pager='<ul class="pagination pager">';
			  for(i=res.sp; i<=res.ep; i++){
				  if(currentPage ==i){
					  pager+='<li class="active"><a class="paging" href="#">'+i+'</a></li>';
				  }else{
					  pager+='<li><a class="paging" href="#">'+i+'</a></li>'
				  }
			  }
			  pager+='</ul>'
				  $('#pagelist').append(pager);  
			  //다음 버튼 출력
			if(res.ep < res.tp){
				 pager='<ul class="pager">';
				  pager+='<li><a class="next" href="#">Next</a></li>';
				  pager+='</ul>';
				  $('#pagelist').append(pager);
			}

		},error:function(xhr){
			alert("상태:"+ xhr.status)
		}
	})
	
	
}


