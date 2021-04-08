/**
 * 
 */
currentPage = 1;

var deletebasket = function(){
	$('#deletebas').on('click', function(){
		var mo_noarr = [];
		$('input[name="cart_no"]:checked').each(function(){
			mo_noarr.push($(this).val());
		});
		formdata = {
				"mo_no" : mo_noarr
		}
		
		$.ajax({
			url : '/MiddleProject/DeleteBasket.do',
			type : 'post',
			data : formdata,
			success : function(res){
				if(res.sw == '실패'){					
					alert("선택된 영화가 없습니다.");
					return false;
				}else if(res.sw == '성공'){					
					$('#showtbody').empty();
					basketPageList(1)
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
}

var basketPageList = function(cpage){
	$.ajax({
		url : '/MiddleProject/ShowBasket.do',
		type : 'post',
		data: {"page": cpage},
		success : function(res){
			code = "";
			$.each(res.datas, function(i,v){
				code += '<tr class=cart_list_no>';
				code += '<td class=col1>' + v.num + '</td>';								
				code += '<td class=col1>'+ v.mo_nm +'</td>';
				code += '<td class=col12>';
				code += '	<div class=connect_img>';
				code += '		<a href=../seeavi/상세보기.jsp class=img-block>';
				code += '			<img src=' + v.mo_img + ' id=mage alt='+ v.mo_nm +'>';
				code += '		</a>';
				code += '	</div>';
				code += '	<div class=article_info connect_info>';
				code += '		<p class=txt_brand></p>';
				code += '	</div>';
				code += '</td>';
				code += '<td class=col1>'+ v.mo_price +'</td>';
				code += '<td class=col1>';
				code += '	<input type=checkbox class=checked_cart name=cart_no value='+ v.mo_no +' checked=checked>';
				code += '</td>';
				code += '</tr>';
			})
			$('#showtbody').html(code);
			
			//pagelist에 append를 이용해서 출력
			 $('#pagelist').empty();
			 // 이전 버튼  출력
			 if(res.sp > 1){
			  pager   = ' <ul class="pager">';
			  pager += ' <li><a class="prev" href="#">Previous</a></li>';
			  pager  += '</ul>';
			     $('#pagelist').append(pager);  
			 }
    	     // 페이지 번호 출력 
			 pager = '<ul class="pagination pager">';
			 for(i=res.sp; i<=res.ep; i++){
			 	if(currentPage==i){
			  		pager += '<li class="active"> <a class="paging" href="#">' +i + '</a></li>';
			  	}else{
			  		pager += '<li><a class="paging" href="#">' +i + '</a></li>'
			  	}
			 }
			 pager += '</ul>';
			 $('#pagelist').append(pager);  
			 // 다음 버튼 출력 
			 if(res.ep < res.tp){
			  	 pager   = ' <ul class="pager">';
			  	 pager += ' <li><a class="next" href="#">Next</a></li>';
			 	 pager  += '</ul>';
			 	 $('#pagelist').append(pager);  
			 }
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}