<%@page import="VO.memberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    List<memberVO> list = (List<memberVO>)request.getAttribute("list");
	%>
	
[
	<%
			for(int i = 0; i< list.size(); i++){
				memberVO vo  = list.get(i);
				if(i > 0){ out.print(",");}
				
		%>
		{
		 "no" : "<%=vo.getMem_no() %>",
		 "id" : "<%=vo.getMem_id() %>",
		 "name" : "<%=vo.getMem_nm() %>",
		 "payok" : "<%=vo.getPayok() %>"
		 
		}
		<%} %>
		]