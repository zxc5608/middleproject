<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%
		int res = (Integer)request.getAttribute("res");

		if(res>0){%>
		{ "sw" : "변경 성공" }
			
		
	<% }else { %>
		{ "sw" : "변경 실패" }
		
	<% } %>