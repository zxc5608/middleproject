<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
		int cnt = (Integer)request.getAttribute("cnt");
		if(cnt>0){
	%>
		{ "sw" : "임시 비밀번호 전송! 메일함을 확인하세요" }
	
	<%	}else {%>
		
		{ "sw" : "메일 전송 실패 (메일 주소를 알맞게 입력하세요)" }
		
	<% } %>
	
	