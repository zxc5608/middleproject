<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%
		String result = (String) request.getAttribute("res");
		if(result != null){
	%>
		{ "sw" : "비밀번호 확인 성공" }
	
	<%	}else{	%>
		
		{ "sw" : "비밀번호 확인 실패" }
			
	<%	}  %>