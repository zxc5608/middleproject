<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    	<%
		int result = (Integer) request.getAttribute("delete");
		if(result > 0){
	%>
		{ "sw" : "���� �Ϸ�!" }
	
	<%	}else{	%>
		
		{ "sw" : "���� ����" }
			
	<%	}  %>