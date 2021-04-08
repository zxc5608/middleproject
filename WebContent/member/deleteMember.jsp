<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		int result = (Integer) request.getAttribute("delete");
		if(result > 0){
	%>
		{ "sw" : "회원탈퇴 완료, 다음에 또 이용해주세요!" }
	
	<%	}else{	%>
		
		{ "sw" : "회원탈퇴 실패, 비밀번호를 확인하세요." }
			
	<%	}  %>