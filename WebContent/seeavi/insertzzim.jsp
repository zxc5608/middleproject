<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int cnt = (int) request.getAttribute("cnt");
	if(cnt>0){
%>
    	{"sw" : "�� �Ͽ����ϴ�."}	
<% 
 	}else { 
%>
    	{"sw" : "�̹� ���� ������ �Դϴ�."}
<%    
 	}
%>