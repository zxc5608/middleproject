<%@page import="VO.noticeVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
 	noticeVO vo = (noticeVO)request.getAttribute("vo");
%>


     
        {  

        
           "title"  : "<%= vo.getTitle() %>",
           "cont" : "<%= vo.getCont().replaceAll("\r","").replaceAll("\n","<br>") %>",
           "no"   : "<%= vo.getNotice_no() %>",
           "name"  : "<%= vo.getNo_name() %>",
           "date"  : "<%= vo.getNo_date().replaceAll("\r","").replaceAll("\n","<br>") %>"
          
        }
    	
 
