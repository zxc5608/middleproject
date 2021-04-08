<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    	
    
    
    <%
		int result = (Integer) request.getAttribute("delete");
		if(result > 0){
	%>
		{ "sw" : "수정 완료!" }
	
	<%	}else{	%>
		
		{ "sw" : "수정 실패" }
			
	<%	}  %>