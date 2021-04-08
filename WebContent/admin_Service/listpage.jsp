<%@page import="VO.qnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<qnaVO> list = (List<qnaVO>)request.getAttribute("list");
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
    	qnaVO  vo = list.get(i);
    	if(i > 0) out.print(",");
  %>
     
        {  
        "qno" : "<%= vo.getQ_no() %>",
		"qtitle" : "<%= vo.getQ_title() %>",
		"qcont" : "<%= vo.getQ_cont().replaceAll("\r","").replaceAll("\n","<br>") %>",
		"memno" : "<%= vo.getMem_no() %>",
		"qdate" : "<%= vo.getQ_date() %>",
		
		"acont" : "<%= vo.getA_cont().replaceAll("\r","").replaceAll("\n","<br>") %>",
		"adate" : "<%= vo.getA_date() %>",
		"admin" : "<%= vo.getAdmin() %>",
		
		
		"writer" : "<%= vo.getWriter() %>"
		

			

        }
    	
 <%  }
  %>
]
}