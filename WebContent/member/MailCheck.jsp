<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String resId = (String) request.getAttribute("AuthenticationKey");
		if(resId != null){
	%>
		{ "sw" : "인증번호 전송 실패 (메일 주소를 알맞게 입력하세요)" }
	
	<%	}else{	%>
		
		{ "sw" : "인증번호 전송 성공! 메일함을 확인하세요" }
			
	<%	}  %>