<%@page import="VO.communityVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<communityVO> list = (List<communityVO>)request.getAttribute("list");
%>
{
	"datas" : 
[
  <%
    for(int i=0; i<list.size(); i++){
    	communityVO vo = list.get(i);
    	if(i > 0) out.print(",");
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
    	
 <% 
 }
  %>
]
}