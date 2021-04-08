<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/memberjoin.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/memberreg.js"></script>

<style>
</style>
<script type="text/javascript">
	function choise_chk(chk) {
		var target = document.getElementsByName('content');
		var num = 0;
		var ropNum = 3; // 개수 임의지정
		for (var i = 0; i < target.length; i++) {
			if (target[i].checked == true) {
				num++;
			}
		}

		if (num > ropNum) {
			chk.checked = false;
			alert("선호도는 " + ropNum + "개 이상 체크 불가능합니다.")
			// 	    $('#rop').html(ropNum + "개 이상 체크 불가능합니다.").css('color', 'red');
			return false;
		}
		$('#rop').html("✔").css('color', 'green');
		return true;
	}

	$(function() {
				$('#clear').on('click', function() {
					document.location.reload(true);
				})

				$('#id').keyup(function() {
					if (!idcheck()) {
						return false;
					}
				})

				$('#name').keyup(function() {
					if (!namecheck()) {
						return false;
					}
				})
				$('#pwd').keyup(function() {
					if (!pwdcheck()) {
						return false;
					}
				})
				$('#pwd2').keyup(function() {
					if (!pwd2check()) {
						return false;
					}
				})

				$('#idbtn').on('click', function() {
					//외부 스크립트의 idcheck()함수를 호출하여 공백,길이,정규식체크하여 올바른 데이터로 검증될 때만 ajax를 수행
					if (!idcheck()) {
						return false;
					}
					idvalue = $('#id').val().trim();
					$.ajax({
						url : '/MiddleProject/idCheck.do',
						type : 'post',
						data : {
							"id" : idvalue
						},
						success : function(res) {
							$('#idspan').html(res.sw).css('color', 'red');
						},
						error : function(xhr) {
							alert("상태 : " + xhr.status);
						},
						dataType : 'json'
					})

				})

				$('#sendMail').click(function() { // 메일 입력 유효성 검사
					var mail = $('#id').val(); //사용자의 이메일 입력값. 

					if (mail == "") {
						alert("메일 주소가 입력되지 않았습니다.");
					} else {
						// 			mail = mail+"@"+d$(".domain").val(); //셀렉트 박스에 @뒤 값들을 더함.
						$.ajax({
							type : 'post',
							url : '/MiddleProject/checkMail.do',
							data : {
								"id" : mail
							},
							dataType : 'json',
							success : function(res) {
								alert(res.sw);
							},
							error : function(xhr) {
								alert("상태 : " + xhr.status);
							}

						});
						isCertification = true; //추후 인증 여부를 알기위한 값
					}
				});

				$('#code').change(function() {
					if (!compareCk()) {
						return false;
					}
				})

				$('#compare').click(function() { // 메일 입력 유효성 검사
					if (!compareCk()) {
						return false;
					}
					code = $('#code').val().trim(); //사용자의 인증번호 입력값. 
					// 				
					$.ajax({
						type : 'get',
						url : '/MiddleProject/checkMail.do',
						data : {
							"code" : code
						},
						dataType : 'json',
						success : function(res) {
							// 						alert(res.sw);
							$('#codeCk').html(res.sw).css('color', 'green');
						},
						error : function(xhr) {
							alert("상태 : " + xhr.status);
						}
					});
				});
				$('#bir').change(function() {
					if (!bircheck()) {
						return false;
					}
				})

				$('#hp').keyup(function() {
					if (!hpcheck()) {
						return false;
					}
				})

				//전송-회원가입신청
				$('#joinbtn').on('click',function() {
							if (!regcheck()) {
								return false;
							}
							$.ajax({
								url : '/MiddleProject/join.do',
								traditional : true,
							// 			data : $('#joinform').serialize()+"&like"+cont,
								data : $('#joinform').serialize(),
								type : 'post',
								success : function(res) {
							$('#joinspan').html( idvalue + "님 " + res.sw).css('color', 'red');
										alert("회원가입 성공! 메인화면으로 돌아갑니다.");
										location.href = "Main.jsp";
									},
								error : function(xhr) {
								$('#joinspan').html("인적사항을 입력해주세요").css('color', 'red');
									},
									dataType : 'json'
									})
						})
			})
</script>
</head>
<body>
	<div class="login-form">
		<h1>회원가입</h1>
		<br>
		<h4>넷플릭스를 즐기고싶다면 회원가입을 하세요!</h4>
		<br> <br>

		<form action="" id="joinform" class="form-horizontal">

			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID:<br>
				</label>
				<div class="col-sm-4">
					<input type="text" class="text-field" id="id"
						placeholder="E-mail로 입력하세요" name="mem_id" required="required">
					<br> <span id="idCk"></span> <span id="idspan"></span>
				</div>
				<input id="idbtn" class="btn btn-warning" type="button"
					value="아이디 중복검사"> <input id="sendMail"
					class="btn btn-warning" type="button" value="인증번호 전송">
			</div>

			<div class="form-group">


				<label class="control-label col-sm-2" for="id">인증번호 입력:<br>
				</label>
				<div class="col-sm-4">
					<input type="text" class="text-field" id="code"
						placeholder="인증번호를 입력하세요" name="mem_en" value=""
						required="required">

				</div>
				<input id="compare" class="btn btn-warning" type="button"
					value="인증하기"> <span id="codeCk"></span>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="name">이름:</label>
				<div class="col-sm-4">
					<input type="text" class="text-field" id="name"
						placeholder="이름을 입력하세요" name="mem_name" required="required">

				</div>
				<span id="nmCk"></span>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">비밀번호 : <br>
				</label>
				<div class="col-sm-4">
					<input type="password" class="text-field" id="pwd"
						placeholder="비밀번호를 입력하세요" name="mem_pass" maxlength='15'
						required="required">
				</div>
				<span id="pwCk"></span>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd2">비밀번호 확인 : <br>
				</label>
				<div class="col-sm-4">
					<input type="password" class="text-field" id="pwd2"
						placeholder="비밀번호 재확인" name="mem_pass2" maxlength='15'
						required="required">
				</div>
				<span id="pwreCk"></span>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="hp">휴대폰번호:</label>
				<div class="col-sm-4">
					<input type="text" class="text-field" id="hp"
						placeholder="휴대폰번호를 입력하세요" name="mem_tel" required="required">
				</div>
				<span id="hpCk"></span>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="bir">생년월일:</label>
				<div class="col-sm-4">
					<input type="date" class="text-field" id="bir"
						placeholder="생일을 입력하세요" name="mem_bir" required="required">
				</div>
				<span id="birCk"></span>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pay">결제 :</label>
				<div class="col-sm-4">
					<a href="../member/이용권결제.jsp"><input class="pay" type="radio"
						name="mem_pay" value="결제 하기">&nbsp;결제 하기</a>&nbsp;&nbsp; <input
						class="pay" type="radio" name="mem_pay" value="나중에 결제"
						checked="checked" />&nbsp;나중에 결제
				</div>
				<span id="payCk"></span>
			</div>


			<div class="form-group">
				<br> <label id="cont">선호하는 컨텐츠 :</label> &nbsp;&nbsp;&nbsp; <input
					onclick="choise_chk(this)" type="checkbox" name="content"
					class="like" value="코미디">코미디 
					<input onclick="choise_chk(this)" type="checkbox" name="content" class="like" value="스릴러">스릴러 <input
					onclick="choise_chk(this)" type="checkbox" name="content"
					class="like" value="액션">액션 
					<input onclick="choise_chk(this)" type="checkbox" name="content" class="like" value="공포">공포 
					<input onclick="choise_chk(this)" type="checkbox" name="content" class="like" value="SF">SF
					 <input onclick="choise_chk(this)" type="checkbox" name="content" class="like" value="애니">애니 
					 <input onclick="choise_chk(this)" type="checkbox" name="content" class="like" value="다큐멘터리">다큐멘터리 
					 <span id="rop"></span> <br>
			</div>

			<br>

			<div class="form-group1">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" onclick="location.href='Main.jsp'"
						class="btn btn-primary btn-lg">Main</button>
					<button id="clear" type="reset" class="btn btn-primary btn-lg">초기화</button>
					<button id="joinbtn" type="button" class="btn btn-primary btn-lg">회원가입</button>
				</div>
				<span id="joinspan"></span> <br>
			</div>


		</form>
	</div>
</body>
</html>