<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		String msg = (String) request.getAttribute("msg");
    
		if(msg!=null){	%>
		{ "sw" : "임시 비밀번호 전송! 메일함을 확인하세요" }
		
			
	<%	}else%>
		
		{ "sw" : "이메일 정보가 맞지 않습니다" }
		
		