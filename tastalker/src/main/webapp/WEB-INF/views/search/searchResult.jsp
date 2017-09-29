<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-storelist</title>
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
		
div.point1{
width:59px;
height:11px;        
}
div.point1 div.point2{
overflow: hidden;

}

</style>
<c:choose>
<c:when test="${food ==1 }">
<style>
#foodmenu #menuon1{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>

<c:when test="${food ==2 }">
<style>
#foodmenu #menuon2{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>

<c:when test="${food ==3 }">
<style>
#foodmenu #menuon3{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>

<c:when test="${food ==4 }">
<style>
#foodmenu #menuon4{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>

<c:when test="${food ==5 }">
<style>
#foodmenu #menuon5{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>

<c:when test="${food ==6 }">
<style>
#foodmenu #menuon6{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>

<c:when test="${food ==7 }">
<style>
#foodmenu #menuon7{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>

<c:when test="${food ==8 }">
<style>
#foodmenu #menuon8{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>

<c:when test="${food ==9 }">
<style>
#foodmenu #menuon9{
    color: white;
    background-color: #b5121b;
}
</style>
</c:when>
</c:choose>
<!-- body style -->
<style>

body{margin: 0; background-color: #f0f0f0;}
	#middle-category{background-color: white; height: 50px; margin: auto;}
		#foodmemu{margin:0;}
		#foodmenu{font-size: 19px; margin: auto; width: 725px; padding-top: 10px; padding-bottom: 10px;}
		#foodmenu a {text-decoration: none;  color: #b5121b;}
		#foodmenu a:VISITED{color: #b5121b;}
		#foodmenu a:ACTIVE{color: black;}

	#mainbody{background-color: #f0f0f0; width:870px; margin: auto;
		padding-left: 45px; padding-right: 45px; padding-top: 70px; 
		}
		
		/* DivTable */
		.divTable{
			display: table;
			width: 100%;
			background-color: #f0f0f0;
		}
		.divTableRow {
			display: table-row;
			margin-bottom: 20px;
		}

		.divTableCell{
			border: 1px solid #b5121b;
			display: table-cell;
			padding: 0px 0px 0px 10px;
			width: 45%;
			height: 225px;
			background-color: white;
			float: left;
			margin-bottom: 20px;
			margin-left: 15px;
			margin-right: 15px;
		}
		

		.divTableBody {
			display: table-row-group;
		}
		
	#lookmore{text-align: center; width: 870px; height: 50px; line-height: 50px; margin-top:10px;
			  border: 1px solid; border-color: #b5121b; background-color: white;}
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

<!-- 페이징 css -->
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
				<a href="member/gotoUserInfo.do?page=1">개인정보관리</a>
				<a href="member/logout.do">로그아웃</a>
				</div>
			</c:otherwise>
		</c:choose>
		
		<div id="header-logoNsearch">
			 <div id="header-logo">
				<img src="/resources/images/logo.png" id="logo" alt="demo">
			</div>
				<div id="search">
					<span class='green_window'>
					<input type='text' class='input_text' id="searchEnter" value="${keyword }"/>
					</span>
					<button type='submit' class='sch_smit' id="searchButton">검색</button>
				</div>
		</div>
		
		<div id="header-bottom">
			<div id="header-location">현재위치<img src="/resources/images/radar-header1.png" onclick="whichs()">서울 N타워</div>
			<div id="letchat">채팅하기</div>
		</div>
	</div>	
</div>
	<hr id="header-bottom-line" style="border: solid 2px #b5121b; margin-top: 0; margin-bottom: 0;">
<!-- HEADER END -->
</header>

<body ondrop="droping(event)" ondragover="allowDrop(event)" >
<!-- chat -->

<!-- mainbody -->
	<div id="middle-category">
	<div id="container" draggable="true" ondragstart="drag(event)">
<img src="/resources/webSocket/picture/drag.png" width="30px" height="30px">
<embed src="/resources/webSocket/chat.jsp" class="chatEmbed" id="chatEmbed" width="530px" height="470px"></embed>
</div>
	
		<nav id="foodmenu">
		  | <a id="menuon1" href="searchDir.do?pageNum=1&food=1&lati=${lati }
		  &lngi=${lngi }
		  &sort1=first
		  &sort2=0.5" id="food1">치킨</a> |
			<a id="menuon2" href="searchDir.do?pageNum=1&food=2&lati=${lati }&lngi=${lngi }&sort1=first
		  &sort2=0.5" id="food2">피자</a> |
			<a id="menuon3" href="searchDir.do?pageNum=1&food=3&lati=${lati }&lngi=${lngi }&sort1=first
		  &sort2=0.5" id="food3">중국집</a> |
			<a id="menuon4" href="searchDir.do?pageNum=1&food=4&lati=${lati }&lngi=${lngi }&sort1=first
		  &sort2=0.5" id="food4">양식</a> |
			<a id="menuon5" href="searchDir.do?pageNum=1&food=5&lati=${lati }&lngi=${lngi }&sort1=first
		  &sort2=0.5" id="food5">한식/분식</a> |
			<a id="menuon6" href="searchDir.do?pageNum=1&food=6&lati=${lati }&lngi=${lngi }&sort1=first
		  &sort2=0.5" id="food6">회/일식</a> |
			<a id="menuon7" href="searchDir.do?pageNum=1&food=7&lati=${lati }&lngi=${lngi }&sort1=first
		  &sort2=0.5" id="food7">족발/보쌈</a> |
			<a id="menuon8" href="searchDir.do?pageNum=1&food=8&lati=${lati }&lngi=${lngi }&sort1=first
		  &sort2=0.5" id="food8">도시락</a> |
			<a id="menuon9" href="searchDir.do?pageNum=1&food=9&lati=${lati }&lngi=${lngi }&sort1=first
		  &sort2=0.5" id="food9">패스트푸드</a> |
		</nav>
	</div>
	
	<div id="mainbody">
		<p>메인 > 중분류
		<select onchange="sort1()" id="sort1">
			<option value="first">거리순</option>
			<option value="second">평점순</option>
			<option value="third">댓글순</option>
		</select>
		
		<select onchange="sort2()" id="sort2">
			<option value="0.5">500m</option>
			<option value="1">1km</option>
			<option value="1.5">1.5km</option>
			<option value="2">2km</option>
		</select>
		</p>
		<div class="divTable">
			<div class="divTableBody">
				<c:if test="${empty searchDir }">
				검색결과가 없습니다
				</c:if>
				<c:forEach items="${searchDir }" var="sd">
					
					<div class="divTableCell">
						
						<div><p>상호명 : <a href="gourmetInfo.do?gourmetNum=${sd.gourmetNum}&page=1">${sd.gourmetNm }</a> </p></div>
						<div style="width: 160px; float: left; margin:0 10px 0 10px;"><img onerror="javascript:this.src='/resources/images/logo.png'" alt="" src=""></div>
						<div>
							<p>평점 : <div class="point1"><div class="point2" style="width:${sd.gourmetTotalGrd *20 }%"><img src="/resources/images/stars/star point.gif"/></div></div>&#40;${sd.gourmetTotalGrd }&#41;</p>
							
							<p>댓글수 : ${sd.gourmetTotalRpl }</p>
							
							<p>주소 : ${sd.gourmetAdrStr }</p>
						
						</div>
						
					</div>
					
				</c:forEach>
		</div>
		<%
		int pageN = 0;
		int totalPage = ((Integer)(request.getAttribute("totalPage"))).intValue();
		String sendType ="";
		if(request.getAttribute("sendType")==null){
			sendType = "";
		}
		else{
			sendType = (String)request.getAttribute("sendType");
		}
		if(request.getAttribute("page") ==null){
			pageN = 1;
		}
		else{
			pageN = Integer.parseInt((String)request.getAttribute("page"));
		}
		int pagingTotalNum = 0;
		int startPage = 0;

		if(totalPage%10==0){
			pagingTotalNum = totalPage/10;
		}else{
			pagingTotalNum = (totalPage/10)+1;
		}
		
		if((pagingTotalNum*1.0)/10 == pagingTotalNum/10){			
			startPage = (pageN/10)-1;
			if(pagingTotalNum/10==0)startPage=0;
			
		}
		else{
			startPage = (pageN/10);
			
		}
		%>
		
	<div id="paging" class="paging">
	<p style="width: 100px; margin: auto;">
	
	<%
	if(sendType.equals("keyword")){%>
		<a href="searchKey.do?pageNum=1&lati=${lati}
			&lngi=${lngi}&keyword=${keyword}&sort1=${sort1}&sort2=${sort2}" class="direction first"></a>
		<%
		if(pageN!=1 && pagingTotalNum!=0){%>
			<a href="searchKey.do?pageNum=<%=pageN-1 %>&lati=${lati}
			&lngi=${lngi}&keyword=${keyword}&sort1=${sort1}&sort2=${sort2}" class="direction prev"></a>
		<%}
		for(int i = (startPage*10)+1; i <=(startPage*10)+10 ; i++){			
			%>
			
			<a href="searchKey.do?pageNum=<%=i%>&lati=${lati}
			&lngi=${lngi}&keyword=${keyword}&sort1=${sort1}&sort2=${sort2}"> <%=i %> </a>
		<%
		if(pagingTotalNum==0||i==pagingTotalNum)break;
		}
		if(pageN!=pagingTotalNum && pagingTotalNum!=0){%>
			<a href="searchKey.do?pageNum=<%=pageN+1%>&lati=${lati}
			&lngi=${lngi}&keyword=${keyword}&sort1=${sort1}&sort2=${sort2}" class="direction next"></a>
		<%}
		%>		
		<a href="searchKey.do?pageNum=<%=pagingTotalNum %>&lati=${lati}
			&lngi=${lngi}&keyword=${keyword}&sort1=${sort1}&sort2=${sort2}" class="direction last"></a>
	<%}else{%>
	<a href="searchDir.do?pageNum=1&lati=${lati}
			&lngi=${lngi}&food=${food}&sort1=${sort1}&sort2=${sort2}" class="direction first"></a>
		<%
		if(pageN!=1 && pagingTotalNum!=0){%>
			<a href="searchDir.do?pageNum=<%=pageN-1 %>&lati=${lati}
			&lngi=${lngi}&food=${food}&sort1=${sort1}&sort2=${sort2}" class="direction prev"></a>
		<%}
		for(int i = (startPage*10)+1; i <=(startPage*10)+10 ; i++){			
			%>
			<a href="searchDir.do?pageNum=<%=i%>&lati=${lati}
			&lngi=${lngi}&food=${food}&sort1=${sort1}&sort2=${sort2}"> <%=i %> </a>
		<%
		if(pagingTotalNum==0||i==pagingTotalNum)break;
		}
		if(pageN!=pagingTotalNum && pagingTotalNum!=0){%>
			<a href="searchDir.do?pageNum=<%=pageN+1%>&lati=${lati}
			&lngi=${lngi}&food=${food}&sort1=${sort1}&sort2=${sort2}" class="direction next"></a>
		<%}
		%>
		<a href="searchDir.do?pageNum=<%=pagingTotalNum %>&lati=${lati}
			&lngi=${lngi}&food=${food}&sort1=${sort1}&sort2=${sort2}" class="direction last"></a>
	<%}	
	%>
		
	</p> </div>
	</div>
	</div>
<input type="hidden" value="${lati}" id="lati">
<input type="hidden" value="${lngi}" id="lngi">
<input type="hidden" value="${sendType}" id="beforeSearch">
<input type="hidden" value="${food}" id="food">
<c:choose>
<c:when test="${empty SID }">
<input type="hidden" value="no" id="chattingGo">
</c:when>
<c:otherwise>
<input type="hidden" value="yes" id="chattingGo">
</c:otherwise>
</c:choose>
<input type="hidden" value="${SID }" id="SID">
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1&libraries=services"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<!-- 헤더 링크이동 -->
<script type="text/javascript">

function sort2(){
	var sort1 = $('#sort1').val();
	var sort2 = $('#sort2').val();
	var lati = $('#lati').val();
	var lngi = $('#lngi').val();
	var bs = $('#beforeSearch').val();
	var text = $('#searchEnter').val();
	var food = $('#food').val();
	if(bs == 'keyword'){
		location.href = 'searchKey.do?pageNum=1&keyword='+text+'&lati='+lati+'&lngi='+lngi+'&sort1='+sort1+'&sort2='+sort2;
	}
	else{
		location.href = 'searchDir.do?pageNum=1&food='+food+'&lati='+lati+'&lngi='+lngi+'&sort1='+sort1+'&sort2='+sort2;
	}
	
}
function sort1(){
	var sort1 = $('#sort1').val();
	var sort2 = $('#sort2').val();
	var lati = $('#lati').val();
	var lngi = $('#lngi').val();
	var bs = $('#beforeSearch').val();
	var text = $('#searchEnter').val();
	var food = $('#food').val();
	if(bs=='keyword'){
		location.href = 'searchKey.do?pageNum=1&keyword='+text+'&lati='+lati+'&lngi='+lngi+'&sort1='+sort1+'&sort2='+sort2;
	}
	else{
		location.href = 'searchDir.do?pageNum=1&food='+food+'&lati='+lati+'&lngi='+lngi+'&sort1='+sort1+'&sort2='+sort2;
	}
	
}
window.onload = function(){
	var geocoder = new daum.maps.services.Geocoder();
	var coord = new daum.maps.LatLng(${lati},${lngi});
	var callback = function(result, status) {
	    if (status === daum.maps.services.Status.OK) {
	    	$('#header-location').html('현재위치<img src="resources/images/radar-header1.png" onclick="whichs()">'+result[0].address.address_name);			        
	    }
	};
	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	
	$('#sort1').val('${sort1}');
	$('#sort2').val('${sort2}');
}
$(function() {
	var sid = $("#SID").val();
	$("#gourmetReport").click(function() {
		if(sid==''){
			alert("로그인 후 이용 가능합니다");
		}
		else{
			$(location).attr('href','member/gotoReportPage.do');	
		}
		
	});
});

$(function() {
	$("#header-loginbtn").click(function() {
		$(location).attr('href','/login.do');
	});
});

$(function() {
	$("#header-join").click(function() {
		$(location).attr('href','/29.do');
	});
});

$(function() {
	$("#logo").click(function() {
		$(location).attr('href','/gotoMain.do');
	});
});

$('#searchEnter').keypress(function(event){
		if(event.which == 13){
			var text = $('#searchEnter').val().trim();
			var lati = $('#lati').val();
			var lngi = $('#lngi').val();
			location.href = 'searchKey.do?pageNum=1&keyword='+encodeURIComponent(text)+'&lati='+lati+'&lngi='+lngi+'&sort1=first&sort2=0.5';
		}
});
$('#searchButton').click(function(){
	var text = $('#searchEnter').val().trim();
	var lati = $('#lati').val();
	var lngi = $('#lngi').val();
	location.href = 'searchKey.do?pageNum=1&keyword='+encodeURIComponent(text)+'&lati='+lati+'&lngi='+lngi+'&sort1=first&sort2=0.5';
});

function whichs(){
	alert("위치정보를 받아왔습니다!");
	navigator.geolocation.getCurrentPosition(function(position){	    
		$('#food1').prop('href', 'searchDir.do?food=1&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
		$('#food2').prop('href', 'searchDir.do?food=2&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
		$('#food3').prop('href', 'searchDir.do?food=3&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
		$('#food4').prop('href', 'searchDir.do?food=4&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
		$('#food5').prop('href', 'searchDir.do?food=5&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
		$('#food6').prop('href', 'searchDir.do?food=6&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
		$('#food7').prop('href', 'searchDir.do?food=7&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
		$('#food8').prop('href', 'searchDir.do?food=8&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
		$('#food9').prop('href', 'searchDir.do?food=9&pageNum=1&lati='+position.coords.latitude+'&lngi='+position.coords.longitude+'&sort1=first&sort2=0.5');
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
</script>
<!-- footer -->
<footer>
	<p>©2017 송명우와 마부시이 Design by 송명우</p>
</footer>
</html>