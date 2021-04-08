/**
 * 
 */
currentPage = 1;

var categoryPagelist = function(cpage){
	$('.sel').on('change', function(){
		cvalue = $(this).val().trim();
		
		$.ajax({
			url : '/MiddleProject/Admincategory.do',
			type : 'post',
			data : {"value" : cvalue, "page" : cpage},
			success : function(res){
				code = "";
				$.each(res.datas, function(i,v){
					code += '<div class="imagebox">';
					code += '<img class="mimg" src='+ v.mo_img +' alt='+ v.mo_nm +'>';
					code += '</div>';
				})
				$('.mmm').html(code);
				
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
	})
}