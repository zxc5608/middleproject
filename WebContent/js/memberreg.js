/**
 * 
 */

function idcheck(){
	//id는 이메일(공백,정규식)
	emailvalue = $('#id').val().trim();
	//공백
	if(emailvalue.length ==''){
		$('#idCk').html("ID를 입력 해주세요").css('color', 'red');
		return false;
	}
	//정규식
	emailreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(!(emailreg.test(emailvalue))){
		$('#idCk').html("ID 형식오류(Mail로 입력)").css('color', 'red');
		return false;
	}else{
		$('#idCk').html("✔").css("color", "green");
	}
	return true;
}

function compareCk(){
	comvalue = $('#code').val().trim();
	if(comvalue.length<1){
		$('#codeCk').html("인증번호를 입력하세요.").css('color','red');
		return false;
	}
	return true;
}

function pwdcheck(){
	//비밀번호(공백,길이,정규식)
	pwdvalue = $('#pwd').val().trim();
	pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}$/;

	//공백
	if(pwdvalue.length < 1){
		$("#pwCk").html("비밀번호를 입력하세요.").css("color","red")
		return false;
	}
	//길이(8~12)
	if(pwdvalue.length < 8 || pwdvalue.length > 15){
		$("#pwCk").html("8~15글자로 입력하세요.").css("color","red")
		return false;
	}
	//정규식(영대소문자, 숫자 특수문자 1개이상씩)
	if(!(pwdreg.test(pwdvalue))){
		$("#pwCk").html("영어 대소문자,숫자,특수문자 1개 이상 입력").css("color","red")
		return false;
	}else {
		$('#pwCk').html("✔").css("color", "green");
	}
}

function pwd2check(){
		pwd2value =$('#pwd2').val().trim();
		pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,12}$/;
	//비밀번호 확인
	if(pwd2value.length < 1){
		$("#pwreCk").html("비밀번호를 입력하세요.").css("color","red")
		return false;
	}

	if(pwdvalue != pwd2value){
		$("#pwreCk").html("일치하지 않습니다.").css("color","red")
		return false;
	}else{
		$("#pwreCk").html("일치합니다.").css("color","green")
	}
	return true;
}
function namecheck(){
	//이름(공백,길이,정규식)
	namevalue = $('#name').val().trim();	
	//공백
	if(namevalue.length<1){
		$('#nmCk').html("이름을 입력하세요").css("color","red");
		return false;
	}
	//길이(2~5)
	if(namevalue.length < 2 || namevalue.length > 10){
		$('#nmCk').html("정확한 이름을 입력하세요").css("color","red");
		return false;
	}
	//정규식
	namereg = /^[가-힣]{2,5}$/;
	if(!(namereg.test(namevalue))){
		$('#nmCk').html("이름 형식오류").css("color","red");
		return false;
	}else{
		$('#nmCk').html("✔").css("color", "green");
	}
	return true;
}

function bircheck(){
	//생년월일(10살이상)
	bvalue = $("#bir").val().trim();
	
	if (bvalue.length < 1) {
		$('#birCk').html("나이를 입력하세요").css('color', 'red');
		return false;
	}
	
	sub = parseInt(bvalue.substring(0, 4)); //년도 추출
	today = new Date(); //오늘 년월일
	year = today.getFullYear(); //오늘 년 추출
	age = year - sub;
	
		$('#birCk').html("나이 : " + bvalue + "/ age " + age).css('color', 'green');
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


//정규식 체크
function regcheck(){
	idcheck();
	compareCk();
	pwdcheck();
	pwd2check();
	namecheck();
	bircheck();
	hpcheck();
	return true;
}