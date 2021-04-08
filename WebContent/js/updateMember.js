/**
 * 
 */

function repwdcheck(){
	repwdvalue =$('#repwd').val().trim();
	pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,12}$/;
//비밀번호 확인
if(repwdvalue.length < 1){
	$("#repwCk").html("비밀번호를 입력하세요.").css("color","red")
	return false;
}

//길이(8~12)
if(repwdvalue.length < 8 || repwdvalue.length > 15){
	$("#repwCk").html("8~15글자로 입력하세요.").css("color","red")
	return false;
}
//정규식(영대소문자, 숫자 특수문자 1개이상씩)
if(!(pwdreg.test(repwdvalue))){
	$("#repwCk").html("영어 대소문자,숫자,특수문자 1개 이상 입력").css("color","red")
	return false;
}else {
	$('#repwCk').html("✔").css("color", "green");
}
return true;
}

function repwd2check(){
	repwdvalue =$('#repwd').val().trim();
	pwd2value =$('#repwd2').val().trim();
	pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,12}$/;
//비밀번호 확인
if(pwd2value.length < 1){
	$("#repw2Ck").html("비밀번호를 입력하세요.").css("color","red")
	return false;
}

if(repwdvalue != pwd2value){
	$("#repw2Ck").html("일치하지 않습니다.").css("color","red")
	return false;
}else{
	$("#repw2Ck").html("일치합니다.").css("color","green")
}
return true;
}

function hpcheck(){
	//전화번호(공백,정규식)
	hpvalue = $('#hp').val().trim();
	//공백
	if(hpvalue.length<1){
		$('#hpCk').html("전화번호를 입력하세요").css('color', 'red');
		return false;
	}
	//정규식
	hpreg = /^\d{3}-\d{3,4}-\d{4}$/;
	if(!(hpreg.test(hpvalue))){
		$('#hpCk').html("전화번호 형식오류").css('color', 'red');
		return false;
	}else{
		$('#hpCk').html("✔").css("color", "green");
	}
	return true;
}


//비밀번호 정규식 체크
function pwdcheck(){
	repwdcheck();
	repwd2check();
	return true;
}