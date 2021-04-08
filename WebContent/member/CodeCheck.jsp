<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String msg = (String)request.getAttribute("msg");
   		if(msg!=null){
	%>
	{ "sw" : "인증번호 불일치! 다시 확인해주세요"}
	<%	}else{	%>

	{ "sw" : "인증번호 확인!" }

	<%	}  %>

