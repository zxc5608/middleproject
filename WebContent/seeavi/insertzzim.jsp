<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int cnt = (int) request.getAttribute("cnt");
	if(cnt>0){
%>
    	{"sw" : "찜 하였습니다."}	
<% 
 	}else { 
%>
    	{"sw" : "이미 찜한 콘텐츠 입니다."}
<%    
 	}
%>