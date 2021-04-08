<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
	<%
		int res = (Integer) request.getAttribute("res");
		if(res>0){
	%>
		{ "sw" : "결제 완료!" }
	
	<%	}else{	%>
		
		{ "sw" : "결제 안됨" }
			
	<%	}  %>
  
  
  
    
    
    
    
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- </body> -->
<!-- </html> -->