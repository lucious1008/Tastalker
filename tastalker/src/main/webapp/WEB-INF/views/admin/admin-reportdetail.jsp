<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
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
#selectSort{margin-right: 100px; margin-top: 10px;}
table{width: 85%; margin:auto;}
table tr td{
	text-align: center; font-size: 15px; cursor: pointer;
}
.menu, .price{ width: 50%; border-bottom: 1px solid}
.titleMenu{width: 15%;}
/* 이미지 영역 */
.demoImage{
	width: 175px; height: 165px; float: left; margin-right:9px;
}
img{width:175px; height: 137px;}
.del{margin-left: 64px;}
.buttons{text-align: center;margin: 10px;}
</style>
</head>
<body  onload="onload()">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/admin/headerFooter/header.jsp"/>
	<section class="resultArea">
		<article class="topArea">
			<p class="top left1">제보번호</p>
			<p class="top right1">${reportOne.reportNum }</p>
			<p class="top left1">대분류</p>
			<div class="top right1">
				<select id="sortSel">
					<option value="1" <c:if test="${reportOne.reportSort eq 1}">selected</c:if> >치킨</option>
					<option value="2" <c:if test="${reportOne.reportSort eq 2}">selected</c:if> >피자</option>
					<option value="3" <c:if test="${reportOne.reportSort eq 3}">selected</c:if> >중국집</option>
					<option value="4" <c:if test="${reportOne.reportSort eq 4}">selected</c:if> >양식</option>
					<option value="5" <c:if test="${reportOne.reportSort eq 5}">selected</c:if> >한식/분식</option>
					<option value="6" <c:if test="${reportOne.reportSort eq 6}">selected</c:if> >회/일식</option>
					<option value="7" <c:if test="${reportOne.reportSort eq 7}">selected</c:if> >족발/보쌈</option>
					<option value="8" <c:if test="${reportOne.reportSort eq 8}">selected</c:if> >도시락</option>
					<option value="9" <c:if test="${reportOne.reportSort eq 9}">selected</c:if> >패스트푸트</option>
				</select>
			</div>
			<p class="top left2">상호명</p>
			<p class="top right2">${reportOne.reportNm }</p>
			<p class="top left1">전화번호</p>
			<p class="top right1">${reportOne.reportTel }</p>
			<p class="top left1">제보상태</p>
			<p class="top right1" id="update">${reportOne.reportStatus }</p>
			<p class="top left1">제보자</p>
			<p class="top right1">${reportOne.reportUser }</p>
			<p class="top left3">제보내용</p>
			<p class="top right3">${reportOne.reportComment }</p>
		
		</article>
		
	</section>
	<section class="resultArea">
		<h3 class="top titleMenu">메뉴</h3>
		<table id="table">
			<!-- 테이블 영역//스크립트 참조 -->
		</table>
	</section>
	<section class="resultArea">
		<h3 class="imageRegi">이미지 등록</h3>
		<hr>
		<ul id="images">

		</ul>
	</section>
	<section class="resultArea">
		<h3 class="imageRege">주소</h3>
		<hr>
		<!-- daum맵영역 -->
		<div id="map" style="width:100%;height:400px; margin-bottom:10px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1"></script>
		<script>
			var lst = ${reportOne.reportAdrLat};
			var lon = ${reportOne.reportAdrLon};
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(lst,lon), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new daum.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition = new daum.maps.LatLng(lst,lon);

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">${reportOne.reportNm} <br><a href="http://map.daum.net/link/map/Hello World!,${reportOne.reportAdrLat},${reportOne.reportAdrLon}" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/${reportOne.reportNm},${reportOne.reportAdrLat},${reportOne.reportAdrLon}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new daum.maps.LatLng(lst,lon); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
		</script>
		<p class="top left1">지번주소</p>
		<p class="top right1">${reportOne.reportAdrStr }</p>
	</section>
	<article class="buttons">
		<c:choose>
			<c:when test="${reportOne.reportStatus eq 0 }">
				<form action="/admin/13.do">
					<input type="hidden" name="reportNum" value="${reportOne.reportNum }"/>
					<input type="hidden" name="reportUser" value="${reportOne.reportUser }"/>
					<input type="hidden" id= "resultImages" name="reportPictureName" value=""/>
					<input type="hidden" id= "resultSort" name="reportSort" value=""/>
					<button type="submit" onclick="approve()" class="accept">승인</button>
					<button type="button" onclick="re(${reportOne.reportNum})" class="reject">거부</button>
					<button type="button" onclick="confirm()" class="cancel">확인</button>
				</form>
			</c:when>
			<c:when test="${reportOne.reportStatus eq 1 }">
				<button type="button" onclick="confirm()" class="cancel">확인</button>
			</c:when>
			<c:when test="${reportOne.reportStatus eq 2}">
				<button type="button" onclick="confirm()" class="cancel">확인</button>
			</c:when>
	
		</c:choose>
		
	</article>
	
	<jsp:include page="/WEB-INF/views/admin/headerFooter/footer.jsp"/>
	
<script>
var kli = "${reportOne.reportPictureName}";
var sp = kli.split("|");

function onload(){
	//menu
	var ei = "${reportOne.reportMenu}";
	var menu = ei.split("|");
	var table = "<th class='menu'>메뉴명</th>	<th class='price'>가격</th>";

	for(i=0;i<menu.length-1; i++){
		var lm=menu[i].split("*");
		table+= "<tr><td>"+lm[0]+"</td><td>"+lm[1]+"</td></tr>";
	}
	document.getElementById("table").innerHTML = table;
	
	//images area
	
	var ul = "";
	for(i=0; i<sp.length-1; i++){
		ul += "<li class='demoImage '><img src='/resources/report/image/"+sp[i]+"' alt='"+sp[i]+"'/><c:if test="${reportOne.reportStatus eq 0 }"><input type='button' class='del' name='input' onclick='del("+i+")' value='삭제'>	</c:if></li>";
	}
	document.getElementById("images").innerHTML = ul;
}
var result = "";
var name = [];
//image del button
 function del(val){	
 	var del = document.querySelectorAll(".del")[val];
	$(del).parent().remove();
	var length = $('input[name=input]').length;
	for(var i = 0; i<length;i++){
		$('.del').attr('onclick','del('+i+')');	
	}
		
	
}
;

//승인버튼
function approve(){
	//이미지 갱신된 값을 가져온다.
	var imagesResult = ""
	
	if(result == "")
		imagesResult = kli;
	else
		imagesResult = result;
	
	//대분류 값을 가져온다.
	var selectResult = 0;
	var x = document.getElementById("sortSel");
	for(i=0; i<x.options.length; i++) {
	    if(x.options[i].selected == true) {
	    	selectResult = x.options[i].value;
	        break;
	    }
	}
	
	
	document.getElementById("resultImages").value = imagesResult;
	document.getElementById("resultSort").value = selectResult;
	
}

//거절 버튼
function re(val){
	location.href="/admin/14.do?reportNum="+val;
}

//확인버튼
function confirm(){
	history.back();
}
</script>
</body>
</html>