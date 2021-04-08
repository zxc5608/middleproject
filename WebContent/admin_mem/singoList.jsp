<%@page import="VO.reportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    List<reportVO> list = (List<reportVO>)request.getAttribute("list");
	%>
	
	[
	<%
			for(int i = 0; i< list.size(); i++){
				reportVO vo  = list.get(i);
				if(i > 0){ out.print(",");}
				
		%>
		{
		 "no" : "<%=vo.getReport_no() %>",
		 "BadId" : "<%=vo.getBad_id() %>",
		 "GoodId" : "<%=vo.getGood_id() %>",
		 "res" : "<%=vo.getReason() %>",
		 "cont" : "<%=vo.getCont() %>",
	     "date" : 	"<%=vo.getReport_date() %>"		  
		}
		<%} %>
		]