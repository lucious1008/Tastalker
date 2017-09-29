<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-leave</title>
</head>
<!-- css초기화 -->
<style>

</style>
<!-- header style -->
<style>

#header{background-color: white;  height:185px;}
	#header-in{background-color: white;  width:960px; margin:auto; }
		#header-login{margin-left: 60%}
			#header-login-id{border: 1px solid #b5121b;}
			#header-login-pw{border: 1px solid #b5121b;}
			#header-loginbtn{background-color: #b5121b; color: #ffffff;margin-left:5px; margin-top:3px; position: absolute;} 
			#header-join{margin-left:60px; margin-top:3px; position: absolute;}
			
		#header-logoNsearch{background-color: white; width:960px; height: 100px; margin-top:20px;}
			#header-logo{float:left; margin-left:16%;}
			#search{margin-left: 25%; margin-top: 30px; position: absolute;}
			
		#header-bottom{background-color: white; color: black;}
			#header-location{text-align:center; float: left;}
			#letchat{background-color: #424242; color: white; text-align:center; line-height: 30px;
					width:100px; margin-left: 89%; margin-top: 11px;}
	
	#gourmetReport{background-color: #b5121b; width:70px; height:40px;
		border-bottom-left-radius: 1em; border-bottom-right-radius: 1em;
		color: white; float: left;
		}
		
</style>

<!-- body style -->
<style>
body{margin: 0; background-color: #f0f0f0;}

	#mainbody{width:960px; height:449px; margin: auto; padding: 0; }
		#divusermenu{background-color: gray; width: 235px; height:465px; float: left;}
			#divusermenu ul{list-style:none; padding: 0;}
			#divusermenu ul li{padding: 10px 0; text-align: center;}
			#usermenu a{outline:0; text-decoration:none; font-size: 19px; color: black;}
			#usermenu a:ACTIVE{color: white;}
			#usermenu a:VISITED{color: black;}
			#userleave{background-color: white;}
			#pagelocation{font-size: 15px;}
		#usercontents{background-color: silver; width: 725px; height:465px; float: right;}
			#userinfo{border:1px solid #b5121b; width: 700px; height:450px; background-color: white; margin: 5px 0 10px 5px; padding-left: 10px;}
			#userinfo hr{width: 650px;}
				.front{width: 150px; float: left; padding-left: 190px; padding-top: 3px;}
				.front1{width: 150px; float: left; padding-left: 190px; padding-top: 10px;}
				#letleave{background-color: gray; width: 160px; height: 30px; text-align: center; 
							margin-left: 260px; margin-top: 40px;}
				#cancle{background-color: gray; width: 80px; height: 30px; text-align: center; }
</style>

<!-- 검색창 style -->
<style>
.green_window {
	display: inline-block;
	width: 366px; height: 34px;
	border: 3px solid #b5121b;
	background: white;
}
.input_text {
	width: 348px; height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}
.sch_smit {
	width: 54px; height: 40px;
	margin: 0; border: 0;
	vertical-align: top;
	background: #b5121b;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}
.sch_smit:hover {
	background: #56C82C;
}

.chatEmbed{
	margin-top:0px;
	left:20px;
	display: none;
	
}
#container{
	left:700px;
	top:500px;
	display: none;
	position:absolute;
	width:30px;
	height:30px;
	background-color: teal;
}

</style>

<!-- footer -->
<style>
	footer{width:100%; height: 150px; background-color: #b5121b; background-image: url("../../resources/images/footerBg.PNG")}
	footer p{text-align: center; color: white;  line-height: 150px;}
</style>

<header>
<!-- header -->
<div id="header">
	<div id="header-in">
	
		<div id="gourmetReport">맛집제보</div>
		<c:choose>
			<c:when test="${empty SID }">
		<div id="header-login">
		<form action="login.do" method="post">
			ID <input type="text" name="userId" size="10" id="header-login-id">
			PW <input type="password" name="userPw" size="10" id="header-login-pw">
			<span id="header-loginbtn"><input type="submit" value="로그인"></span>
			</form>
			<span id="header-join">회원가입</span>
		</div>
			</c:when>
			<c:otherwise>
				<div id="header-login">
				${SID }님 어서오세요!
				<a href="gotoUserInfo.do?page=1">개인정보관리</a>
				<a href="logout.do">로그아웃</a>
				</div>
			</c:otherwise>
		</c:choose>
		
		<div id="header-logoNsearch">
			 <div id="header-logo">
				<img src="../../resources/images/logo.png" id="logo">
			</div>
				<div id="search">
					<span class='green_window'>
					<input type='text' class='input_text' id="searchEnter"/>
					</span>
					<button type='submit' class='sch_smit' id="searchButton">검색</button>
				</div>
		</div>
		
		<div id="header-bottom">
			<div id="header-location">현재위치<img src="../../resources/images/radar-header1.png" id="header-radar">서울 용산구 용산동2가 산 1-11</div>
			<div id="letchat">채팅하기</div>
		</div>
	</div>	
</div>
	<hr id="header-bottom-line" style="border: solid 2px #b5121b; margin-top: 0; margin-bottom: 0;">
<!-- HEADER END -->
</header>

<body ondrop="droping(event)" ondragover="allowDrop(event)">
<div id="container" draggable="true" ondragstart="drag(event)">
<img src="/resources/webSocket/picture/drag.png" width="30px" height="30px">
<embed src="/resources/webSocket/chat.jsp" class="chatEmbed" id="chatEmbed" width="530px" height="470px"></embed>
</div>

<!-- mainbody -->	
	<div id="mainbody">
		<div id="divusermenu">
			<a id="pagelocation">메인 > 개인정보관리</a>
			<nav id="usermenu">
				<ul>
					<li id="useractive"><a href="#">회원활동조회</a></li>
					<li id="usermodify"><a href="#">회원정보수정</a></li>
					<li id="userleave"><a href="#">회원탈퇴</a></li>
				</ul>
			</nav>
		</div>
		<div id="usercontents">
			<div id="userinfo">
			<form method="post" action="27-1.do">
				<p>${SID }님의 정보수정</p><hr>
				<span class="front1">비밀번호 </span><p><input type="text" name="userPw"></p>
				<input id="letleave" type="submit" value="회원탈퇴">
				
				<input type="hidden" value="${SID }" id="userId">
				<input type="hidden" value="${errorMsg}" id="errorMsg">
			</form>
			</div>
		</div>
	</div>
	
<c:choose>
<c:when test="${empty SID }">
<input type="hidden" value="no" id="chattingGo">
</c:when>
<c:otherwise>
<input type="hidden" value="yes" id="chattingGo">
</c:otherwise>
</c:choose>
<input type="hidden" value="${lati}" id="lati">
<input type="hidden" value="${lngi}" id="lngi">
</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
	<!-- 링크이동 -->
<script type="text/javascript">
$(function() {
	var userId = $('#userId').val();
	$("#useractive").click(function() {
		$(location).attr('href','../member/gotoUserInfo.do?page=1');
	});
});

$(function() {
	$("#usermodify").click(function() {
		$(location).attr('href','../member/26.do');
	});
});

</script>

<!-- 헤더 링크이동 -->
<script type="text/javascript">
$(function() {
	var sid = $("#userId").val();
	$("#gourmetReport").click(function() {
		if(sid==''){
			alert("로그인 후 이용 가능합니다");
		}
		else{
			$(location).attr('href','gotoReportPage.do');	
		}
		
	});
});

$(function() {
	$("#header-loginbtn").click(function() {
		$(location).attr('href','24.do');
	});
});

$(function() {
	$("#header-join").click(function() {
		$(location).attr('href','29.do');
	});
});

$(function() {
	$("#logo").click(function() {
		$(location).attr('href','/gotoMain.do');
	});
});
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1&libraries=services"></script>

<!-- 경고창 -->
<script type="text/javascript">
window.onload=function(){
	var errorMsg = $('#errorMsg').val().length;
	if(errorMsg != 0){
		alert("올바른 비밀번호가 아닙니다.");
	}
}
$('#letchat').click(function(){
	
	var chattingGo = document.getElementById("chattingGo");
	var chatHtml = document.getElementById('chatEmbed');
	var dragHtml = document.getElementById('container');
	if(chattingGo.value !='yes'){
		alert("로그인을 해주세요");
		return false;
	}
	if(chatHtml.style.display == 'none'){
		chatHtml.style.display = 'block';
		dragHtml.style.display = 'block';
		chatHtml.style.position = 'absolute';
	}else{	
		
		chatHtml.style.display = 'none';
		dragHtml.style.display = 'none';
	}
});
function drag(ev){	
	
}
function allowDrop(ev) {
    ev.preventDefault();
}
function droping(ev) {	
	var contains = document.getElementById('container');
	var x = ev.pageX;
	var y = ev.pageY;
	if(x>950)x=950;
	if(y>1200)y=1200;
    contains.style.left = x+'px';
	contains.style.top = y+'px';	
	ev.preventDefault();

}
function whichs(){
	alert("위치정보를 받아왔습니다!");
	navigator.geolocation.getCurrentPosition(function(position){		
		$('#lati').val(position.coords.latitude);
		$('#lngi').val(position.coords.longitude);
		var latLng = {"lati": position.coords.latitude,"lngi":position.coords.longitude}
		$.ajax({
			type : 'POST',  
		     data: latLng,
		     dataType : 'text',
		     url : 'latLngSession.do',  
		     success : function(){},
		     error : function(xhr, status, e) {}				
		});
		var geocoder = new daum.maps.services.Geocoder();
		var coord = new daum.maps.LatLng(position.coords.latitude,position.coords.longitude);
		var callback = function(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		    	$('#header-location').html('현재위치<img src="resources/images/radar-header1.png" onclick="whichs()">'+result[0].address.address_name);			        
		    }
		};
		geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	    });
}
$('#searchEnter').keypress(function(event){
	if(event.which == 13){
		var text = $('#searchEnter').val();
		var lati = $('#lati').val();
		var lngi = $('#lngi').val();
		location.href = '/searchKey.do?pageNum=1&keyword='+encodeURIComponent(text)+'&lati='+lati+'&lngi='+lngi+'&sort1=first&sort2=0.5';
	}
});
$('#searchButton').click(function(){
var text = $('#searchEnter').val();
var lati = $('#lati').val();
var lngi = $('#lngi').val();
location.href = '/searchKey.do?pageNum=1&keyword='+encodeURIComponent(text)+'&lati='+lati+'&lngi='+lngi+'&sort1=first&sort2=0.5';
});
window.onload = function(){
	var geocoder = new daum.maps.services.Geocoder();
	var coord = new daum.maps.LatLng(${lati},${lngi});
	var callback = function(result, status) {
	    if (status === daum.maps.services.Status.OK) {
	    	$('#header-location').html('현재위치<img src="/resources/images/radar-header1.png" onclick="whichs()">'+result[0].address.address_name);			        
	    }
	};
	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	
	$('#sort1').val('${sort1}');
	$('#sort2').val('${sort2}');
}
</script>
<!-- footer -->
<footer>
	<p>©2017 송명우와 마부시이 Design by 송명우</p>
</footer>
</html>