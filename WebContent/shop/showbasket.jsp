<%@page import="VO.basketVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<basketVO> list = (List<basketVO>) request.getAttribute("list");
%>

[
<% 
	for(int i=0; i<list.size(); i++){
		basketVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
		{
			"num" : "<%= vo.getNum() %>",
			"mo_nm" : "<%= vo.getMo_nm() %>",
			"mo_img" : "<%= vo.getMo_img() %>",
			"mo_price" : "<%= vo.getMo_price() %>",
			"mo_no" : "<%= vo.getMo_no() %>"
		}
<%
	}
%>	
]