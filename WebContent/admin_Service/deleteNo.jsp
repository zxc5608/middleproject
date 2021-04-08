<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    	<%
		int result = (Integer) request.getAttribute("delete");
		if(result > 0){
	%>
		{ "sw" : "삭제 완료!" }
	
	<%	}else{	%>
		
		{ "sw" : "삭제 실패" }
			
	<%	}  %>