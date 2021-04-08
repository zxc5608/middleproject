<%@page import="VO.communityVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    List<communityVO>list= (List<communityVO>)request.getAttribute("list");
    
    %>
    {
    "datas" :
    [
    <%
    	for(int i=0; i<list.size();i++){
    		communityVO vo = list.get(i);
    		if(i>0)out.print(",");
    
    %>
    	{
    		"com_no":"<%= vo.getCom_no() %>",
    		"mem_no":"<%= vo.getMem_no() %>",
    		"writer":"<%= vo.getWriter() %>",
    		"cnt":"<%= vo.getCount() %>",
    		"title":"<%=vo.getTitle() %>",
    		"cont":"<%=vo.getCont() %>",
    		"com_date":"<%= vo.getCom_date() %>",
    	}
    
	<%
	 }
	%>    	
   ] 
}