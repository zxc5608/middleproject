<%@page import="VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="../js/community.js"></script>
<%	memberVO memVo = (memberVO)session.getAttribute("user"); %>

  
<script>
$(function(){
$('#button-w').on('click',function(){
	
	//$('#uModal').modal('hide');
	//$('#uform .txt').val("");
	$('#uform .txt').modal('show');
});
$('#button-u').on('click',function(){
	
	//$('#uModal').modal('hide');
	$('#upform .tt').modal('show');
	//$('#upform .tt').val("");
	updatecont(<%= request.getParameter("no")%>)
});
	listAll(<%= request.getParameter("no")%>);
	updatecount(<%= request.getParameter("no")%>);
	
	$('#usend').on('click',function(){
		//�Է��� ��� ���� �����´�.
		/* $('#name').val();
		$('#subject').val();
		data={"writer":name,"subject":subject} */
		//console.log($('#wform').serializeJSON());
		cont =$('#cont1').val();
		reason=$("#categ option:selected").val();

		
		reportuser(<%= request.getParameter("no")%>);
		
		//���â �ݱ�
		$('#myModal').modal('hide');
		$('#uform.txt').val("");
		
		
	})
	
	$('#upsend').on('click',function(){
		//�Է��� ��� ���� �����´�.
		/* $('#name').val();
		$('#subject').val();
		data={"writer":name,"subject":subject} */
		//console.log($('#wform').serializeJSON());
		cont =$('#cont2').val();
		title=$("#title").val();

		
		updatecom(<%= request.getParameter("no")%>);
		
		//���â �ݱ�
		$('#upModal').modal('hide');
		$('#uform.txt').val("");
		
		
	})
});

</script>
  
<title>Insert title here</title>
<link rel="stylesheet" href="../css/Ŀ�´�Ƽ.css">
<link rel="stylesheet" href="../css/netmain.css">
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<!--�����ۼ�  -->
<!-- ��ܹ� -->





<div id="nav">

        <a href="../seeavi/netmain.jsp" id="logo"><img class="logo"
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
   
   <li class='has-sub'><a href='../community/Ŀ�´�Ƽ.jsp'><span>���� �Խñ�</span></a>
 
   </li>
   <li class='has-sub'><a href='#'><span>��ǰ��û�ϱ�</span></a>
   
   </li>

</ul>
</div>
<div class="review-2"></div>
<div class="ta">
    <a href="Ŀ�´�Ƽ.jsp" id="list" class="button-w">�������</a>
    <a href="#this" id="modify" class="button-u"data-toggle="modal" data-target="#upModal">�����ϱ�</a>
    <a href="#this" id="siren" class="button-w" data-toggle="modal" data-target="#myModal">�Ű��ϱ�</a>
</div>

<div class="tabtab">

   </div>
          <br><br><br>
     <div class="reple">
     <h2>���</h2><br>
	<p class="p1">
		Tm32 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2020-12-10 19:12:08
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
			<br>
		<span class="cont">����Դϴ�~</span>
		</p>
     </div>

		<input type="text" placeholder="��۴ޱ� " value="" class="rereple">
 		<a href="#"class="nput" onclick=""><button class="nput">�Է�</button></a>
 		
	</div>
	<!-- �Ű��ϱ� modal -->
<div id="myModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
	
  <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">�Ű��ϱ�</h4>
      </div>
      <div class="modal-body">
	
			<form id="uform">
			<label>�Ű� ����</label> 
			<select id="categ" >
    		<option value="�Ű����"selected>�Ű����</option>
    		<option value="�弳">�弳</option>
    		<option value="�������� ����">�������� ����</option>
    		<option value="����">����</option>
		    <option value="������ ����">������ ����</option>
		    <option value="��ġ�� ����">��ġ�� ����</option>
		   
		</select>
		<br>
			
	
			<label>�Ű���:</label> <br> 
			<textarea rows="10" cols="50"  class="txt" id="cont1" name="content"></textarea>
			<br>
			
			<br>
      <div class="modal-footer">
			
        <button id="usend" type="button" class="btn btn-default" data-dismiss="modal">Ȯ��</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
         </div>
        </form>
      </div>
		
	</div>
    </div>
    </div>
   
<!--�����ϱ� ���  -->
<div id="upModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
	
  <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">�Ű��ϱ�</h4>
      </div>
      <div class="modal-body">
	
		<form id="upform">
			
			<label>������� : </label> 
			<input type='text' class="tt" id="title"  name= "writer">
			<br> 
			<br> 
	
			<label>���� �����ϱ�:</label> <br> 
			<textarea rows="10" cols="50"  class="txt" id="cont2" name="content"></textarea>
			<br>
			
			<br>
      <div class="modal-footer">
			
        <button type="button" class="btn btn-default" data-dismiss="modal" id="upsend">Ȯ��</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
      </div>
		</form>	
		
	</div>
    </div>
       </div>
    </div>

</body>
</html>