<%@page import="VO.fnqVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<fnqVO> list = (List<fnqVO>)request.getAttribute("list");
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
    	fnqVO  vo = list.get(i);
    	if(i > 0) out.print(",");
  %>
     
        {  

           "title"  : "<%= vo.getTitle() %>",
           "qu" : "<%= vo.getQu().replaceAll("\r","").replaceAll("\n","<br>") %>",
           "no"   : "<%= vo.getFnq_no() %>",
           "ans"  : "<%= vo.getAns().replaceAll("\r","").replaceAll("\n","<br>") %>"
          
        }
    	
 <%  }
  %>
]
}