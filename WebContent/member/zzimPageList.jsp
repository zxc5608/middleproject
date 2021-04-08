<%@page import="VO.zzimVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<zzimVO> list = (List<zzimVO>) request.getAttribute("list");
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
      for(int i=0; i<list.size(); i ++){
    	  zzimVO vo = list.get(i);
    	  if(i> 0) out.print(",");
%>  
  
       {
          "num": "<%= vo.getNum()%>",
          "mo_nm" : "<%= vo.getMo_nm().replaceAll("\r"," ").replaceAll("\n", "<br>").trim() %>",
          "mo_img" : "<%= vo.getMo_img() %>",
          "mo_no" : "<%= vo.getMo_no() %>",
          "mo_path" : "<%= vo.getMo_path() %>"
       }
<%
}
%>
]
}
