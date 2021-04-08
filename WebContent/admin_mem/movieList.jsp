<%@page import="VO.movieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
	<%
	
	 List<movieVO> movie = (List<movieVO>)request.getAttribute("movie");
	 
	%>

		[
		<%
					for(int i = 0; i< movie.size(); i++){
						movieVO mov = movie.get(i);
						if(i > 0){ out.print(",");}
						
				%>
					{ 
					"movie" : "<%=mov.getMo_nm() %>",
					"price: : <%=mov.getMo_price() %>
					}
				<%} %>
]