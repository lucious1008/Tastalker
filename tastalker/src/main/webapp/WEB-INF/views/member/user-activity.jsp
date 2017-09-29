<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-ativity</title>
</head>
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

	#mainbody{width:960px; height:825px; margin: auto; padding: 0; }
		#divusermenu{background-color: gray; width: 235px; height:825px; float: left;}
			#divusermenu ul{list-style:none; padding: 0;}
			#divusermenu ul li{padding: 10px 0; text-align: center;}
			#usermenu a{outline:0; text-decoration:none; font-size: 19px; color: black;}
			#usermenu a:ACTIVE{color: white;}
			#usermenu a:VISITED{color: black;}
			#useractive{background-color: white;}
			#pagelocation{font-size: 15px;}
		#usercontents{background-color: silver; width: 725px; height:825px; float: right;}
			#userinfo{border:1px solid #b5121b; width: 700px; background-color: white; margin: 5px 0 10px 5px; padding-left: 10px;}
			#userinfo hr{width: 650px;}
				.front{width: 150px; float: left; padding-left: 150px;}
			#userreportlist{border:1px solid #b5121b; background-color: white; padding-left: 10px; width: 700px; margin-left: 5px;}
			#userreportlist hr{width: 650px;}
			#reporttable{border: 1px; margin:auto;}
			#reporttable tr .reportFirst {width: 200px;
										padding: 10px;
									    font-weight: bold;
									    vertical-align: top;
									    color: #fff;
									    background: #b5121b ;}
			
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
	footer p{text-align: center; color: white; line-height: 150px;}
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
				<p>${userInfo.userId }님의 회원정보</p><hr>
				<span class="front">등급 </span><a><c:choose><c:when test="${userInfo.userRank ==1}"><img src="/resources/webSocket/picture/1.png"> 브론즈 혀</c:when>
				<c:when test="${userInfo.userRank ==2}"><img src="/resources/webSocket/picture/2.png"> 실버 혀</c:when>
				<c:when test="${userInfo.userRank ==3}"><img src="/resources/webSocket/picture/3.png"> 골드 혀</c:when>
				<c:when test="${userInfo.userRank ==4}"><img src="/resources/webSocket/picture/4.png"> 플레티넘 혀</c:when>
				<c:when test="${userInfo.userRank ==5}"><img src="/resources/webSocket/picture/5.png"> 다이아 혀</c:when>
				</c:choose>  &nbsp;&nbsp;&nbsp;&nbsp; ${userInfo.userPoint }포인트</a><P> </P>
				<span class="front">이름 </span><p><a>${userInfo.userNm }</a></p>
				<span class="front">이메일</span><p><a>${userInfo.userEmail }</a></p>
				<span class="front">주소</span><p><a>${userInfo.userAdrStr }</a></p>
			</div>
			
			<div id="userreportlist">
				<p>[맛집제보 현황]</p><hr>
				<table id="reporttable">
					<tr>
						<td class="reportFirst">상태</td>
						<td class="reportFirst">상호명</td>					
						<td class="reportFirst">제보일자</td>
					</tr>
					<c:forEach items="${userReportInfo }" var="uri" varStatus="i">
					<tr>
						<td>
						<c:choose>
						<c:when test="${uri.reportStatus ==0}">대기 중</c:when>
						<c:when test="${uri.reportStatus ==1}">승인</c:when>
						<c:when test="${uri.reportStatus ==2}">거부</c:when>
						</c:choose>
						</td>
						<td>${uri.reportNm }</td>					
						<td><fmt:formatDate value="${uri.reportReg }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></td>
					</tr>
					</c:forEach>
				</table>
			
				<div class="paging">
					<% 
					int totalReportNum = ((Integer)request.getAttribute("totalReportNum")).intValue(); 
					int showReportNum = 5;
					int showPageNum = 5;
					int maxPage = (totalReportNum - 1)/showReportNum + 1 ;
					int nowPage = ((Integer)request.getAttribute("page")).intValue();
					
					int pageStart;
					if(nowPage%5 == 0){
						pageStart = ((nowPage-1)/5)*5 + 1 ;
					}else{
						pageStart = (nowPage/5)*5 + 1;
					}
					int	pageLast = pageStart + 4;
					%>
					<a href="gotoUserInfo.do?page=1" class="direction first"></a>
					<%if(nowPage != 1 ){%>
					<a href="gotoUserInfo.do?page=<%=nowPage-1%>" class="direction prev"></a>
					<%}%>
					<%
					for(int i = pageStart; i <= pageLast; i++){ 
						if(i > maxPage){
							break;
						}
					%>
					<a href="gotoUserInfo.do?page=<%= i %>"><%= i %></a>
					<%
					}
					%>
					<%if(nowPage != maxPage ){%>
					<a href="gotoUserInfo.do?page=<%=nowPage+1%>" class="direction next"></a>
					<%}%>
					<a href="gotoUserInfo.do?page=<%=maxPage%>" class="direction last"></a>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${SID }" id="SID">
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
<style>
.paging {
	margin-top: 15px;
	text-align: center;
	font-size: 0;
	margin-bottom: 5px;
}
.paging a,
.paging strong {
	display: inline-block;
	width: 20px;
	height: 18px;
	margin: 0 1px;
	border: 1px solid #dbdbdb;
	color: #767676;
	font-size: 11px;
	font-weight: bold;
	line-height: 20px;
	vertical-align: middle;
  text-decoration: none;
}
.paging a:hover,
.paging a:active,
.paging a:focus {
	border: 1px solid #4c8500;	
}
.paging strong {
	color: #fff;
	background: #4c8500;
	border: 1px solid #4c8500;
}
.paging .direction {
	background: url('http://leroro.net/images/ui/sp_btn_paging.gif') no-repeat;
}
.paging .direction.first {
	background-position: left top;
}
.paging .direction.prev {
	margin: 0 12px 0 1px;
	background-position: -20px 0;
}
.paging .direction.next {
	margin: 0 1px 0 12px;
	background-position: -40px 0;
}
.paging .direction.last {
	background-position: right top;
}
.paging .direction span {
	position: absolute;
	display: block;
	width: 20px;
	height: 18px;
	overflow: hidden;
	z-index: -1;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1&libraries=services"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
	
	<!-- 링크이동 -->
<script type="text/javascript">
$(function() {
	$("#usermodify").click(function() {
		$(location).attr('href','../member/26.do');
	});
});

$(function() {
	$("#userleave").click(function() {
		$(location).attr('href','../member/27.do');
	});
});
</script>

<!-- 헤더 링크이동 -->
<script type="text/javascript">
$(function() {
	var sid = $("#SID").val();
	$("#gourmetReport").click(function() {
		if(sid==''){
			alert("로그인 후 이용 가능합니다");
		}
		else{
			$(location).attr('href','../member/gotoReportPage.do');	
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
	<p style="margin-top: 0px;">©2017 송명우와 마부시이 Design by 송명우</p>
</footer>
</html>