/**
 * 
 */

var selector = function(){
	$('.selec').on('click', function(){
		stext = $('#searchDown').text();
		console.log(stext);
		location.href='/MiddleProject/selectsearch.do?text='+ stext;
	})
}