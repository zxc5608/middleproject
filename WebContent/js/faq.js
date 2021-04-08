var listPageServer = function(cpage){
	$.ajax({
		url :'/MiddleProject/FaqList.do',
		type : 'post',
		data : {"page" : cpage },
		dataType : 'json',
		success : function(res){
			  
			
			code='<div class="container">';
			code+='  <h2 class="title">자주 묻는 질문</h2>';
			  
			  
			code+='<br>';
			code+='<br>';
			code+='<br>  ';
			  
			code+='<table>';
			code+='	<th></th>';
			code+='</table>';
			code+='	  <div class="panel-group" id="accordion">';
			  $.each(res.datas, function(i,v){
			code+='    <div class="panel panel-default">';
			code+='      <div class="panel-heading">';
			code+='       <h4 class="panel-title">';
			code+='         <a data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.no + '" class="acco">';
			code+='          	'+ v.no +'      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  '+ v.title ;
			          
			          
			code+='          </a>';
			code+='        </h4>';
			code+='      </div>';
			code+='      <div id="collapse' + v.no + '" class="panel-collapse collapse "> <!-- in이 있으면 열려있는거 -->';
			code+='        <div class="panel-body">';
			          
			         
			code+='         <p  class="p1">';
			code+='                     질문 번호: '+ v.no +'    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			                     
			code+='          <br><br><br>  ';
			code+='                      내용 :  &nbsp;&nbsp;&nbsp;' + v.qu;
			code+='           </p>';
			           
			       
			     
			        
			        
			       
			code+='        <hr>';
			code+='       <p class="p1">';
			          	
			code+=			v.ans;
			code+='          </p>';
			         
			code+='	        </div>';
			code+='	      </div>';
			code+='    </div>';
			  })
			  code+='  </div> ';
			  code+='	</div>';
			
			
			
			
			  
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