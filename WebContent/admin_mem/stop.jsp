<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	int res = (int) request.getAttribute("res");
	if(res>0){
%>
    	{"sw" : "정지 되었습니다."}	
<% 
 	}else { 
%>
    	{"sw" : "취소 되었습니다."}
<%    
 	}
%>