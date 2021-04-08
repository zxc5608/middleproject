<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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