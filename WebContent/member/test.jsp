<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<link rel="stylesheet" href="../css/layer.css">

<script>
 /* 드래그 */
$(function() {
	
	$( '#draggable' ).draggable();
	
});
/* 레이어팝업 */
    $(document).ready(function() {

        var $panel = $(".popup_panel");

        var $panelContents = $panel.find(".popup_contents");

        $("#btn_popup_open").on("click", function(e) {

            // 레이어 팝업 열기
            $panel.fadeIn();
        });

        // 팝업 닫기 이벤트 정의
        $("#btn_popup_close").on("click", popupClose);

        // 팝업 배경 클릭 이벤트 정의
        $panel.find(".popup_bg").on("click", popupClose);

        function popupClose(e) {

            $panel.fadeOut();

            // 이벤트 기본 동작 중단
            e.preventDefault();
        }
    });
</script>
<style >
.dropdown{
	width: 100px;
	height: 180px;
	float: right;
	margin-right: 10%;
	margin-top: 17px;
/* 	position: relative;
  display: inline-block; */
} 
 .dropbtn {
  background-color: black;
  color: black;
  
  font-size: 16px;
  border: none;
}


.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 120px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
	}

.dropdown:hover .dropdown-content {
	display: block;
	}
.mylog{
	
	height: 60px;
	width:60px;
	
}

.dropdown:hover .dropbtn {
	background-color: black;
	}


</style>
</head>
<body>

<!-- 마이페이지 드롭 -->
	<div class="dropdown" id="search">
						
			<button class="dropbtn">
			  <img class="mylog" src="../images1/닷지차저.jpg">
			</button>				
		<div class="dropdown-content">
			<a href="../member/마이페이지.jsp">마이페이지</a> 
			<a href="#">로그아웃</a> 
			<a href="javascript:void(0)" id="btn_popup_open">팝업 동영상</a>				
		</div>
	</div>
	
	
<!-- 팝업 동영상   -->
        <div class="popup_panel">
        
            <div id="draggable" class="ui-widget-cont">
          
            <div class="popup_contents">
				<div>
                <a href="javascript:void(0)" id="btn_popup_close"><button>X</button></a>
                
				<video muted autoplay loop id="#bgvi" id= "pmovie">
					<source src="../seeavi/trailer.mp4" type="video/mp4">
				</video>
				
				</div>
			</div>
            </div>
        </div>
    








</body>
</html>