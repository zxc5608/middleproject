<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<%	memberVO memVo = (memberVO)session.getAttribute("user"); %>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>
<link rel="stylesheet" href="../css/Ŀ�´�Ƽ.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
<!--�����ۼ�  -->
<!-- ��ܹ� -->

<div id="nav">

      <a href="netmain.jsp" id="logo"><img class="logo"
					src="../images1/savi.png"></a>
	
		<ul id="na">
			<li class="av"><a href="../seeavi/��ȭ.jsp">��ȭ����</a></li>
			<li class="av"><a href="../shop/�ٿ�ε�.jsp">�ٿ�ε�</a></li>
			<li class="av"><a href="../community/Ŀ�´�Ƽ.jsp">Ŀ�´�Ƽ</a></li>

			<li class="av"><a href="../notice/notice.jsp">������</a></li>
			
					<div class="dropdown" id="search">

				<button class="dropbtn">
					<img class="mylog" src="../images1/<%=memVo.getProfile() %>">
				</button>

				<div class="dropdown-content">
					<a href="../member/MyPage.jsp">����������</a> <a
						href="../member/Logout.jsp">�α׾ƿ�</a> <a href="#">��ȭ �̾����</a>
				</div>
			</div>
				<a type="button" href="../shop/shopbasket.jsp" id="search"><img
						class="search" src="../images1/��ٱ�����.jpg"></a>
					<a type="button" href="#" id="search"><img class="search"
						src="../images1/�򵸺���.JPG"></a>
					<input type="text" id="searchDown" placeholder="������ �˻�" value="">
		</ul>
        
    </div>
 <div class ="board">
	<div id='cssmenu'>
<ul>
   
   <li class='has-sub'><a href='#'><span>���� �Խñ�</span></a>
      <ul>
         <li><a href='#'><span>�θǽ�</span></a></li>
         <li><a href='#'><span>�ڹ̵�</span></a></li>
         <li><a href='#'><span>������</span></a></li>
         <li><a href='#'><span>�׼�</span></a></li>
         <li><a href='#'><span>����</span></a></li>
         <li><a href='#'><span>SF</span></a></li>
         <li><a href='#'><span>�ִ�</span></a></li>
         <li class='last'><a href='#'><span>��ť</span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>��ǰ��û�ϱ�</span></a>
      <ul>
          <li><a href='#'><span>�θǽ�</span></a></li>
         <li><a href='#'><span>�ڹ̵�</span></a></li>
         <li><a href='#'><span>������</span></a></li>
         <li><a href='#'><span>�׼�</span></a></li>
         <li><a href='#'><span>����</span></a></li>
         <li><a href='#'><span>SF</span></a></li>
         <li><a href='#'><span>�ִ�</span></a></li>
         <li class='last'><a href='#'><span>��ť</span></a></li>
      </ul>
   </li>

</ul>
</div>
 
    <div class="review">
    <h2>�����ۼ�</h2>
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="����" type="text" required>
        </div>
       
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="����" ></textarea><br>
      <div class="row">
        <div class="form-write">
          <button class="button-w" type="submit">���</button>
          <a href="Ŀ�´�Ƽ.jsp" class="a"><button class="button-w">���</button></a>
        </div>
      </div>
    </div>
    </div>
</body>
</html>