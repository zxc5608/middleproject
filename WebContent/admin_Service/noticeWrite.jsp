<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
		String msg = (String)request.getAttribute("res");
   		if(msg!=null){
	%>
	{ "sw" : "공지사항 작성 실패" }
	<%	}else{	%>

	{ "sw" : "공지사항 작성 완료"}

	<%	}  %>
