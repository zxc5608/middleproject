<%@page import="VO.movieVO"%>
<%@page import="VO.shoppayVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<%
	 List<shoppayVO> list = (List<shoppayVO>)request.getAttribute("list");
	 List<movieVO> movie = (List<movieVO>)request.getAttribute("movie");
// 	 List<memberVO> mem = (List<memberVO>)request.getAttribute("mem");
	 
	%>

		[
		<%
					for(int i = 0; i< list.size(); i++){
						for(int j=0; j< movie.size(); j++){
						shoppayVO vo  = list.get(i);
						movieVO mo = movie.get(j);
						if(i > 0){ out.print(",");}
						else if(j>0){ out.print(",");}
						
				%>
					{ 
					"movie" : "<%=mo.getMo_nm()%>",
					"price" : "<%=mo.getMo_price() %>",
					"date" : "<%=vo.getShop_date() %>",
					"kind" : "<%=vo.getShop_kind() %>"
					}
				<%} 	}%>
]
