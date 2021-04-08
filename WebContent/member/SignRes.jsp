<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
		String res = (String) request.getAttribute("res");
		if(res != null){
	%>
		{ "sw" : "회원가입 실패! <br>다시 입력해주세요." }
	
	<%	}else{	%>
		
		{ "sw" : "회원가입 성공!" }
			
	<%	}%>