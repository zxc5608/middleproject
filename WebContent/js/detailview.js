/**
 * 
 */

var checkstart = function(avgscore){
	if(avgscore >= 0 && avgscore < 0.5){
		$('#fa1').attr('class', 'fa fa-star-o');
		$('#fa2').attr('class', 'fa fa-star-o');
		$('#fa3').attr('class', 'fa fa-star-o');
		$('#fa4').attr('class', 'fa fa-star-o');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 0.5 && avgscore < 1){
		$('#fa1').attr('class', 'fa fa-star-o checked');
		$('#fa2').attr('class', 'fa fa-star-o');
		$('#fa3').attr('class', 'fa fa-star-o');
		$('#fa4').attr('class', 'fa fa-star-o');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 1 && avgscore< 1.5){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa2').attr('class', 'fa fa-star-o');
		$('#fa3').attr('class', 'fa fa-star-o');
		$('#fa4').attr('class', 'fa fa-star-o');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 1.5 && avgscore < 2){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa2').attr('class', 'fa fa-star-o checked');
		$('#fa3').attr('class', 'fa fa-star-o');
		$('#fa4').attr('class', 'fa fa-star-o');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 2 && avgscore < 2.5){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa2').attr('class', 'fa fa-star checked');
		$('#fa3').attr('class', 'fa fa-star-o');
		$('#fa4').attr('class', 'fa fa-star-o');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 2.5 && avgscore < 3){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa2').attr('class', 'fa fa-star checked');
		$('#fa3').attr('class', 'fa fa-star-o checked');
		$('#fa4').attr('class', 'fa fa-star-o');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 3 && avgscore < 3.5){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa2').attr('class', 'fa fa-star checked');
		$('#fa3').attr('class', 'fa fa-star checked');
		$('#fa4').attr('class', 'fa fa-star-o');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 3.5 && avgscore < 4){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa2').attr('class', 'fa fa-star checked');
		$('#fa3').attr('class', 'fa fa-star checked');
		$('#fa4').attr('class', 'fa fa-star-o checked');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 4 && avgscore < 4.5){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa2').attr('class', 'fa fa-star checked');
		$('#fa3').attr('class', 'fa fa-star checked');
		$('#fa4').attr('class', 'fa fa-star checked');
		$('#fa5').attr('class', 'fa fa-star-o');
	}else if(avgscore >= 4.5 && avgscore < 5){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa2').attr('class', 'fa fa-star checked');
		$('#fa3').attr('class', 'fa fa-star checked');
		$('#fa4').attr('class', 'fa fa-star checked');
		$('#fa5').attr('class', 'fa fa-star-o checked');
	}else if(avgscore == 5){
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa1').attr('class', 'fa fa-star checked');
		$('#fa1').attr('class', 'fa fa-star checked');
	}
}

var insertZzim = function(){
	$('.cont').on('click', function(){
		movalue = $('.movie').attr('value');
		$.ajax({
			url : '/MiddleProject/InsertZzim.do',
			type : 'post',
			data : {"mo_no" : movalue},
			success : function(res){
				alert(res.sw);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
}

var reviewlistAll= function(){
	
	$.ajax({
		url: '/MiddleProject/seeavireview.do',
		type:'post',
		data:{"view": 1},
		success:function(res){
			code = "";
			$.each(res.datas,function(i,v){
				
				code+="<div class='panel panel-default text-center'>";
				code+="	<div class='panel-footer'>";
				code+="		<h3>"+v.title+"</h3>";
				code+="	<h4>"+v.cont+"</h4>";
				code+="	<button class='btn btn-lg' onclick=location.href='../community/리뷰상세.jsp'>리뷰보러가기</button>";
				code+="	</div>";
				code+="</div>";
			})
			$('#col').html(code);
		},
		dataType:'json',
		error:function(xhr){
			alert("상태:"+ xhr.status)
		}
	})
}
