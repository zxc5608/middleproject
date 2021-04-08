<%@page import="VO.noticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //List<noticeVO> list = (List<noticeVO>)request.getAttribute("list");
 	noticeVO vo = (noticeVO)request.getAttribute("vo");
%>


     
        {  

        
           "title"  : "<%= vo.getTitle() %>",
           "cont" : "<%= vo.getCont().replaceAll("\r","").replaceAll("\n","<br>") %>",
           "no"   : "<%= vo.getNotice_no() %>",
           "name"  : "<%= vo.getNo_name() %>",
           "date"  : "<%= vo.getNo_date().replaceAll("\r","").replaceAll("\n","<br>") %>"
          
        }
    	
 
