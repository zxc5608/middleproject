<%@page import="VO.noticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<noticeVO> list = (List<noticeVO>)request.getAttribute("list");
  int total = (Integer)request.getAttribute("tp");
  int startp = (Integer)request.getAttribute("sp");
  int endp = (Integer)request.getAttribute("ep");
%>
{
  "tp"      : "<%= total %>",
  "sp"      : "<%= startp %>",
  "ep"      : "<%=endp  %>",
  "datas"   : 
[
  <%
    for(int i=0; i<list.size(); i++){
    	noticeVO  vo = list.get(i);
    	if(i > 0) out.print(",");
  %>
     
        {  

        
           "title"  : "<%= vo.getTitle() %>",
           "cont" : "<%= vo.getCont().replaceAll("\r","").replaceAll("\n","<br>") %>",
           "no"   : "<%= vo.getNotice_no() %>",
           "name"  : "<%= vo.getNo_name() %>",
           "date"  : "<%= vo.getNo_date().replaceAll("\r","").replaceAll("\n","<br>") %>"
          
        }
    	
 <%  }
  %>
]
}