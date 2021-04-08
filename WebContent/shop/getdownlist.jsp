<%@page import="VO.movieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	List<movieVO> list1 = (List<movieVO>) request.getAttribute("list");
%>
[
<% 
	for(int i=0; i<list1.size(); i++){
		movieVO vo = list1.get(i);
		if(i > 0) out.print(",");
%>
		{
			"imgpath" : "<%= vo.getMo_img() %>",
			"mo_nm" : "<%= vo.getMo_nm() %>",
			"mo_cont" : "<%= vo.getMo_cont().replaceAll("\r"," ").replaceAll("\n", "<br>").trim() %>",
			"mo_price" : "<%= vo.getMo_price() %>",
			"mo_no" : "<%= vo.getMo_no() %>"
		}
<%
	}
%>	
] 