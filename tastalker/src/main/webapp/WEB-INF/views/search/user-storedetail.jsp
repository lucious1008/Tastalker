<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-storedetail</title>
</head>
<!-- header style -->
<style>
body{margin: 0;}
#header{background-color: #white;  height:185px;}
	#header-in{background-color: white;  width:960px; margin:auto; }
		#header-login{margin-left: 60%;}
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
	
#mainbody{background-color: white; width:720px; height:780px; margin: auto;
		padding-left: 120px; padding-right: 120px; padding-top: 70px; 
		}
	#gourmetReport{background-color: #b5121b; width:70px; height:40px;
		border-bottom-left-radius: 1em; border-bottom-right-radius: 1em;
		color: white; float: left;
		}

</style>
<!-- body -->
<style>
/*body area*/
.resultArea{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px;
	border: 1px solid #b5121b;
	overflow: hidden;
	
}
.top{float: left;}
.left1, .left2, .left3 {width:15%; height: 29px; }
.right1, .right2, .right3{width: 69%; height: 29px; padding: 0px 10px}
.left3, .right3{height: 150px;}
.left3 {line-height: 150px;}
.right3 {width: 80%; padding-top:10px; background-color:#ffe6e6; }
.right4{width: 15%; height: 29px; padding: 0px 10px}
.right5{width: 20%; height: 29px; padding: 0px 10px}
.right6{width: 60%; height: 29px; padding: 0px 10px}
table{width: 85%; margin:auto;}
table tr td{
	text-align: center; font-size: 15px; cursor: pointer;
}
.menu, .price{ width: 50%; border-bottom: 1px solid}
.titleMenu{width: 15%;}

/* 댓글 */
#datgle{width: 50px; float: left;}
#givegrade{width: 100px; margin-top:20px; margin-left: 800px; margin-bottom: 20px;}
#letdatgle{width: 110px; height: 50px; margin-left: 10px; position: absolute;}
.letmodify{width: 110px; height: 50px; margin-left: 10px; position: absolute;}
#letmodifyarea

#datgleform{margin-left: 10%}
#datglearea{width:660px; height:30px; margin-top: 4px; padding: 5px 0px 5px 0px;}
/* 이미지 영역 */
.demoImage{
	width: 167px; height: 137px; float: left; margin-right:9px; list-style: none;
}
/* img{width:175px; height: 137px;} */
.del{margin-left: 64px;}
.buttons{text-align: center;margin: 10px;}
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
	top:300px;
	display: none;
	position:absolute;
	width:30px;
	height:30px;
	background-color: teal;
}
</style>
<!-- 평점 별 -->
<style>
	.point1{
	width:59px;
	height:11px;        
	}
	.point1 .point2{
	overflow: hidden;
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
	footer{width:100%; height: 150px; background-color: #b5121b; background-image: url("resources/images/footerBg.PNG")}
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
				<img src="../../resources/images/logo.png" id="logo">
			</div>
				<div id="search">
					<span class='green_window'>
					<input type='text' class='input_text' />
					</span>
					<button type='submit' class='sch_smit'>검색</button>
				</div>
		</div>
		
		<div id="header-bottom">
			<div id="header-location">현재위치<img src="resources/images/radar-header1.png" id="header-radar">서울시 영등포구 당산동</div>
			<div id="letchat">채팅하기</div>
		</div>
	</div>	
</div>
	<hr id="header-bottom-line" style="border: solid 2px #b5121b; margin-top: 0; margin-bottom: 0;">
<!-- HEADER END -->
</header>

<body ondrop="droping(event)" ondragover="allowDrop(event)">



<form id="gourmetInfo">
<section class="resultArea">
		<article class="topArea">
			<p class="top left1">대분류</p>
			<p class="top right1"><a><c:choose>
			<c:when test="${gourmetInfo.gourmetSort ==1}">치킨</c:when>
			<c:when test="${gourmetInfo.gourmetSort ==2}">피자</c:when>
			<c:when test="${gourmetInfo.gourmetSort ==3}">중식</c:when>
			<c:when test="${gourmetInfo.gourmetSort ==4}">양식</c:when>
			<c:when test="${gourmetInfo.gourmetSort ==5}">한식/분식</c:when>
			<c:when test="${gourmetInfo.gourmetSort ==6}">일식</c:when>
			<c:when test="${gourmetInfo.gourmetSort ==7}">족발/보쌈</c:when>
			<c:when test="${gourmetInfo.gourmetSort ==8}">도시락</c:when>
			<c:when test="${gourmetInfo.gourmetSort ==9}">패스트푸드</c:when>
						
			</c:choose> </a></p>
			<p class="top left2">상호명</p>
			<p class="top right2"><a>${gourmetInfo.gourmetNm }</a></p>
			<p class="top left1">평점</p>${viewGrade}
			<div class="top right4" style="margin-top: 15px;">
				<div class="point1" style="float: left;">
						<div class="point2" style="width:${gourmetInfo.gourmetTotalGrd*20}%">
							<img src="/resources/images/stars/star point.gif"/>
						</div>
				</div>
				<span style="float: right; margin-top: 2px;">&#40;${gourmetInfo.gourmetTotalGrd}&#41;</span>
			</div>
			<c:choose>
				<c:when test="${SID ne null}">
					<p class="top right4"><a>나의평점 : </a></p>
				<div class="top right4" style="margin-top: 15px;">
					<div class="point1" style="float: left;">
						<div class="point2" style="width:${checkMyGrade*20}%">
							<img src="/resources/images/stars/star point.gif"/>
						</div>
					</div>
					<span style="float: right; margin-top: 2px;">&#40;${checkMyGrade}&#41;</span>
				</div>
				</c:when>
				<c:otherwise>
						<p class="top right6"><a> </a></p>
				</c:otherwise>
			</c:choose>
			<c:if test="${SID ne null}">
				<p class="top right5"><a>평점주기</a>
					<select id="gradeGrade" name="gradeGrade" onchange="registGrade()">
						<option value="0">평점선택</option>
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select></p>
					</c:if>
			<p class="top left1">전화번호</p>
			<p class="top right1"><a>${gourmetInfo.gourmetTel }</a></p>
		</article>
		
	</section>
	<section class="resultArea">
		<h3 class="top titleMenu">메뉴</h3>
		<table id="gourmetMenu">
			<tr>
				<th class="menu">메뉴명</th>
				<th class="price">가격</th>
			</tr>
		</table>
	</section>
	<section class="resultArea">
		<h3 class="imageRegi">이미지 등록</h3>
		<hr>
		<ul id="gourmetPictureName">
		</ul>
	</section>
	<section class="resultArea">
		<h3 class="imageRege">주소</h3>
		<hr>
		<!-- 맵영역 -->
		<div class="map_wrap">
			<div id="map" style="width:100%;height:400px;margin-bottom:10px;overflow:hidden;"></div>
   		</div>
		<p class="top left1">지번주소</p>
		<p class="top right1">${gourmetInfo.gourmetAdrStr }</p>
	</section>
	
	<section class="resultArea">
		<h3 class="imageRege" id="datgle">댓글</h3>

		<hr>
		<!-- 댓글영역 -->
		<section id="datgleform">
			<article class="storeReplyHeader">
				<textarea rows="2" cols="100" id="datglearea" name="replyContent"></textarea>
				<input type="button" value="댓글입력" id="letdatgle" onclick="registReply()"> 
			</article>
		</section>	
		<hr>
		
		<c:forEach items="${replyList }" varStatus="i" var="replyList">
			<article class="storeReplyHeader">
			<img src="/resources/webSocket/picture/${replyList.userRank }.png" alt="demo" class="replyLeft replyImg">
			<span class="replyLeft">${replyList.userId }</span>
			<c:if test="${SID == replyList.userId}">
				<input type="button" class="replyRight" value="수정" id="letmod" onclick="letmodify(${replyList.replyNum })"/>
				<input type="button" class="replyRight" value="삭제" onclick="deleteReply(${replyList.replyNum })"/>
			</c:if>
		</article>
		<article class="storeReplyBody">
			<p class="replyLeft replyFont">${replyList.replyContent }</p>
			<p class="replyLeft replyFont" id="letmodifyarea${replyList.replyNum }"  style="display: none;">
			<textarea rows="2" cols="100" id="modifyarea${replyList.replyNum }"></textarea>
			<input type="button" value="수정하기" class="letmodify" onclick="modifyReply(${replyList.replyNum })">
			</p>
			<p class="replyRight replyFont"><fmt:formatDate value="${replyList.replyReg }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p>			
		</article>
		<hr>
		</c:forEach>
		
		<div id="container" draggable="true" ondragstart="drag(event)">
<img src="/resources/webSocket/picture/drag.png" width="30px" height="30px">

<embed src="/resources/webSocket/chat.jsp" class="chatEmbed" id="chatEmbed" width="530px" height="470px"></embed>
</div>
		<div class="paging">
		<% 
			int totalReplyNum = ((Integer)request.getAttribute("totalReplyNum")).intValue(); 
			int showReplyNum = 5;
			int showPageNum = 5;
			int maxPage = (totalReplyNum - 1)/showReplyNum + 1 ;
			int nowPage = ((Integer)request.getAttribute("page")).intValue();
			
			int pageStart;
			if(nowPage%5 == 0){
				pageStart = ((nowPage-1)/5)*5 + 1 ;
			}else{
				pageStart = (nowPage/5)*5 + 1;
			}
			int	pageLast = pageStart + 4;
			%>
			<a href="gourmetInfo.do?gourmetNum=${gourmetInfo.gourmetNum }&page=1" class="direction first"></a>
			<%if(nowPage != 1 ){%>
			<a href="gourmetInfo.do?gourmetNum=${gourmetInfo.gourmetNum }&page=<%=nowPage-1%>" class="direction prev"></a>
			<%}%>
			<%
			for(int i = pageStart; i <= pageLast; i++){ 
				if(i > maxPage){
					break;
				}
			%>
			<a href="gourmetInfo.do?gourmetNum=${gourmetInfo.gourmetNum }&page=<%= i %>"><%= i %></a>
			<%
			}
			%>
			<%if(nowPage != maxPage ){%>
			<a href="gourmetInfo.do?gourmetNum=${gourmetInfo.gourmetNum }&page=<%=nowPage+1%>" class="direction next"></a>
			<%}%>
			<a href="gourmetInfo.do?gourmetNum=${gourmetInfo.gourmetNum }&page=<%=maxPage%>" class="direction last"></a>
		</div>
		</section>
	<article class="buttons">
				<button type="submit" class="cancel">확인</button>
	</article>
	
<input type="hidden" id="userId" name="userId" value="${SID }"><!-- 세션값넣어주기 -->
<input type="hidden" id="gourmetNum" name="gourmetNum" value="${gourmetInfo.gourmetNum }">
<input type="hidden" id="gourmetAdrStr" value="${gourmetInfo.gourmetAdrStr }">
</form>

<c:choose>
<c:when test="${empty SID }">
<input type="hidden" value="no" id="chattingGo">
</c:when>
<c:otherwise>
<input type="hidden" value="yes" id="chattingGo">
</c:otherwise>
</c:choose>
</body>
<!-- 댓글 작성-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1&libraries=services"></script>
<script type="text/javascript">
function registReply() {	
	var data1 = {"userId" : $('#userId').val(), "replyContent" : $('#datglearea').val(), "gourmetNum" : $('#gourmetNum').val()};
	var replyContent = $('#datglearea').val();
	var userId = $('#userId').val();	
	if(userId==''){alert("로그인 후 이용가능합니다"); return;}
	$.ajax({
		     type : 'POST',  
		     data: data1,
		     dataType : 'text',
		     url : 'member/17.do',  
		     success : function(data) {
		    	 if(data == '1'){
					alert("댓글이 등록되었습니다");
					location.href="gourmetInfo.do?gourmetNum="+$('#gourmetNum').val()+"&page=1";
		    	 }else{
		    		alert("댓글이 등록되지 않았습니다 다시 시도해주세요");
		    	 }
		     } ,
		     error : function(xhr, status, e) {  
				alert("에러 입니다");
		     }
		  }); 
	}
</script>

<!-- 평점 등록 -->
<script type="text/javascript">
function registGrade() {
	var data1 = {"userId" : $('#userId').val(), "gradeGrade" : $('#gradeGrade').val(), "gourmetNum" : $('#gourmetNum').val()};
	var gradeGrade = $('#gradeGrade').val();
	var userId = $('#userId').val();	
	$.ajax({
		     type : 'POST',  
		     data: data1,
		     dataType : 'text',
		     url : 'member/18.do',  
		     success : function(data) {
		    	 if(data == '1'){
					alert("평점이 등록되었습니다");
					location.reload();
		    	 }else{
		    		alert("평점이 등록되지 않았습니다 다시 시도해주세요");
		    	 }
		     } ,
		     error : function(xhr, status, e) {  
				alert("에러입니다");
		     }
		  }); 
	}
</script>

<!-- 메뉴명나누기 -->
<script type="text/javascript">
window.onload = function(){
	var menuTotal = '${gourmetInfo.gourmetMenu}';
	var menuSplit = menuTotal.split('|');
	for(i=0; i<menuSplit.length-1; i++){
		var menuSSplit = menuSplit[i].split('*');
		$('#gourmetMenu').append('<tr>'+'<td>'+menuSSplit[0]+ '</td><td>' + menuSSplit[1] + '</td>'+'</tr>');
	}
	picture();
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
<!-- 사진나누기 -->
<script type="text/javascript">
function picture(){
	var pictureTotal = '${gourmetInfo.gourmetPictureName}';
	var menuSplit = pictureTotal.split('|');
	for(i=0; i<menuSplit.length-1; i++){
		$('#gourmetPictureName').append('<li class="demoImage"><img class="demoImage" alt="demo" src="resources/report/image/'+ menuSplit[i] + '"></li>');
	}
}
</script>	


<!-- map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1&libraries=services"></script>
<script>
var gourmetAdrLat = ${gourmetInfo.gourmetAdrLat };
var gourmetAdrLon = ${gourmetInfo.gourmetAdrLon };

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(gourmetAdrLat, gourmetAdrLon), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
/*  */
// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(gourmetAdrLat, gourmetAdrLon); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
/*  */
//var gourmetAdrStr = $("#gourmetAdrStr").val();
//var iwContent = "<div>"+gourmetAdrStr+"</div>" ;// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
var iwContent = '<div style="padding:5px;">맛집위치</div>';
var	iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
/*     '+${gourmetInfo.gourmetNm }+' */
// 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
    position : iwPosition,
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>


<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<!-- 헤더 링크이동 -->
<script type="text/javascript">
$(function() {
	var sid = $("#userId").val();
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
		$(location).attr('href','./gotoMain.do');
	});
});
</script>
<!-- 댓글삭제 -->
<script type="text/javascript">
function deleteReply(replyNum) {
	var replyNums = replyNum;
	var data1 = {"replyNum" : replyNums, "gourmetNum" : $('#gourmetNum').val()};
	$.ajax({
		     type : 'POST',  
		     data: data1,
		     dataType : 'text',
		     url : 'member/19.do',  
		     success : function(data) {
		    	 if(data == '1'){
					alert("댓글이 삭제되었습니다");
					location.reload();
		    	 }else{
		    		alert("댓글이 삭제되지 않았습니다 다시 시도해주세요");
		    	 }
		     } ,
		     error : function(xhr, status, e) {  
				alert("ddd");
		     }
		  }); 
	}
</script>
<!-- 댓글수정 -->
<script type="text/javascript">
function modifyReply(replyNum) {
	var replyNums = replyNum;
	var replyContent = $('#modifyarea'+replyNums+'').val();
	//var replyContent = "수정수정";
	var data1 = {"replyNum" : replyNums, "gourmetNum" : $('#gourmetNum').val(), "replyContent" : replyContent};
	$.ajax({
		     type : 'POST',  
		     data: data1,
		     dataType : 'text',
		     url : 'member/20.do',  
		     success : function(data) {
		    	 if(data == '1'){
					alert("댓글이 수정되었습니다");
					location.reload();
		    	 }else{
		    		alert("댓글이 수정되지 않았습니다 다시 시도해주세요");
		    	 }
		     } ,
		     error : function(xhr, status, e) {  
				alert("ddd");
		     }
		  }); 
	}
</script>
<!-- 댓글수정폼부르기 -->
<script type="text/javascript">
function letmodify(replyNum) {
	var replyNum = replyNum;
	var letmodifyarea = document.getElementById('letmodifyarea'+replyNum+'');// id값 입력 해주기
	if(letmodifyarea.style.display == "block"){
		letmodifyarea.style.display= "none";
	}else{
		letmodifyarea.style.display= "block"
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

</script>
<!-- footer -->
<footer>
	<p>©2017 송명우와 마부시이 Design by 송명우</p>
</footer>
</html>