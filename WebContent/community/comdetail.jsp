<%@page import="VO.communityVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
communityVO vo=(communityVO)request.getAttribute("vo");

%>

{
 		   "comno"  : "<%= vo.getCom_no()%>",
           "memno"  : "<%= vo.getMem_no()%>",
           "title"   : " <%= vo.getTitle()%>",
           "cont"    : "<%= vo.getCont().replaceAll("\r","").replaceAll("\n","<br>")%>",
           "comdate": "<%= vo.getCom_date()%>",
           "writer"  : "<%= vo.getWriter()%>",
           "count"   : "<%= vo.getCount()%>"
}