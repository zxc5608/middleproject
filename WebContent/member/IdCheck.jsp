<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String result = (String) request.getAttribute("resId");
		if(result != null){
	%>
		{ "sw" : "중복된 Mail주소" }
	
	<%	}else{	%>
		
		{ "sw" : "사용 가능" }
			
	<%	}  %>