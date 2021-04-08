<%@page import="VO.movieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<movieVO> list = (List<movieVO>) request.getAttribute("list");
	int total = (Integer)request.getAttribute("tp");
	int startp =  (Integer)request.getAttribute("sp");
	int endp = (Integer) request.getAttribute("ep");
%>
{
    "tp"    : "<%= total %>",
    "sp"    : "<%= startp %>",
    "ep"    : "<%= endp %>",
    "datas" :
[
<%
	for(int i=0; i<list.size(); i++){
		movieVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
		{
			"mo_img" : "<%= vo.getMo_img() %>",
			"mo_nm" : "<%= vo.getMo_nm() %>"
		}
<%
	}
%>
]
}