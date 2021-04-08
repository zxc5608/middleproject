<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 int res = (Integer)request.getAttribute("cnt");
 if(res>0){
%>

   {"sw" : "성공"}	
	
	
<% 
 }else { 
%>
    {"sw" : "실패"}
<%    
 }
%>