
currentPage=1;
var listPageServer = function(cpage){
	$.ajax({
		url :'/MiddleProject/QnaList.do',
		type : 'post',
		data : {"page" : cpage },
		dataType : 'json',
		success : function(res){
			 
			
			code = '<div class="container">';
			code += '  <h2 class="title">Q/A 답변</h2>                                                                                 ';
			                                                                                                                     
			code += '<br>                                                                                                         ';
			code += '	<br>                                                                                                     ';
			code += '<br>                                                                                                         ';
			                                                                                                                     
			code += ' <table>                                                                                                     ';
			code += ' 	<th></th>                                                                                                ';
			code += ' </table>                                                                                                    ';
			code += '  <div class="panel-group" id="accordion">                                                                   ';
			  $.each(res.datas, function(i,v){
			code += '    <div class="panel panel-info">                                                                        ';
			code += '      <div class="panel-heading">                                                                            ';
			code += '        <h4 class="panel-title">                                                                             ';
			code += '          <a data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.qno + '" class="acco">                ';
			code += '          	NO.' + v.qno + '    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   질문 제목: <span class="nspan">'+ v.qtitle +'</span>';
			code += '          </a>                                                                                               ';
			code += '        </h4>                                                                                                ';
			code += '      </div>                                                                                                 ';
			code += '      <div id="collapse' + v.qno + '" class="panel-collapse collapse "> <!-- in이 있으면 열려있는거 -->                          ';
			code += '        <div class="panel-body">                                                                             ';
			code += '                                                                                                             ';
			code += '          <p class="p2">                                                                                     ';
			code += '             <button type="button" onclick="buttup()" idx="' + v.qno + '" name="modify" id="btnn" class="btn btn-info action">답변하기</button>          ';
			code += '             <button type="button"onclick="buttdel()" idx="' + v.qno + '" name="delete" id="btnn" class="btn btn-info action">삭제하기</button>          ';
			code += '          </p>                                                                                               ';
			code += '          <p  class="p1">                                                                                    ';
			code += '                      질문 번호: ' + v.qno + '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                        ';
			code += '                      작성자     : ' + v.writer + '   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                              ';
			code += '                     질문일자 :<span class="wspan">' + v.qdate + ' </span>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                             ';
			code += '          <br><br><br>                                                                                       ';
			code += '                      내용 : <span class="cspan"> ' + v.qcont + ' </span>                                                            ';
			code += '           </p>                                                                                              ';
			code += '        <!--답변  -->                                                                                          ';
			code += '          <hr>                                                                                               ';
			code += '          <p class="p1">                                                                                     ';
			code += '          	                                                                                                 ';
			code += '                      답변 : <span class="aspan"> ' +  v.acont +'</span>';
			code += '          </p>                                                                                               ';
			code += '        </div>                                                                                               ';
			code += '      </div>                                                                                                 ';
			code += '    </div>                                                                                                   ';
			  })
			code += '  </div>                                                                                                     ';
			code += '</div>';

			
			
			 
			  
			  $('.box').html(code);	
			  
			  //pagelist에append를 이용해서 출력 
			  $('#pagelist').empty();
			  //이전버튼 출력  
			  if(res.sp > 1){
				  pager = '<ul class="pager">';
				  pager +='  <li><a  class="prev" href="#">Previous</a></li>';
				  pager += '</ul>';
				  $('#pagelist').append(pager)	;
			  } 
			  
			  //페이지번호 출력
			  pager = '<ul class="pagination pager">';
			  for(i=res.sp; i<=res.ep; i++){
				  if(currentPage == i){
					 pager += ' <li  class="active"><a  class="paging" href="#">' + i + '</a></li>';  
				  }else{
					 pager += ' <li><a   class="paging" href="#">' + i + '</a></li>' 
				  }
			  }
			  pager += '</ul>'
			  $('#pagelist').append(pager)	;
				  
			  //다음 버튼 출력
			  if(res.ep < res.tp){
				  pager = '<ul class="pager">';
				  pager +='  <li><a  class="next" href="#">Next</a></li>';
				  pager += '</ul> ';
				  $('#pagelist').append(pager)	;
			  }
			  
			  
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		}
	
	})
}
var insertqna = function(){ 
	
	$.ajax({
		url : '/MiddleProject/QnaInsert.do',
		type : 'post',
		data : {"title" : title, "cont" : cont}, //bonum, name, cont 
		success : function(res){
			
			listPageServer(1)
		},
		dataType : 'json'
			
			
	})
}


var qnaDeleteServer = function(but){ //but : 삭제버튼
	 
	 $.get(
			 '/MiddleProject/QnaDelete.do',
			 {"seq" : vidx},
			 function(res){
				// alert(res.sw); 
				 // 화면에서 지우기
				 $(but).parents('.panel').remove();
			 },
			 'json'
	 )

}



var boardUpdateServer = function(board, pbody){	// 수정 모달창에서
	 
	 $.ajax({
		url : '/MiddleProject/QnaUpdateAdmin.do',
		type : 'post',
		data : board,	// seq, subject, content, 
		success : function(res){
			
			// 화면 수정 - 수정 모달창에 있는 값들을 다시 가져와서 (board객체) 화면에 출력
//			$(pbody).find('.nspan').text(board.writer);
//			$(pbody).find('.mspan').text(board.mail);
			
//			content = board.content;
//			content = content.replace(/\n/, "<br>");
			
			reply = board.reply;
			reply = reply.replace(/\n/, "<br>");
			
//			$(pbody).find('.cspan').html(content);
//			$(pbody).find('.nspan').text(board.subject);
			$(pbody).find('.aspan').html(reply);
			
//			today = new Date();
//			today = today.toLocaleDateString();
//			$(pbody).find('.wspan').text(today);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		}, 
		dateType : 'json'
	 })
	 
	 
}









