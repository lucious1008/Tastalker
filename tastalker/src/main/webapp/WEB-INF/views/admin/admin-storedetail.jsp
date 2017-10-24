<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
/* 댓글영역 */
.storeReplyHeader, .storeReplyBody, .replyTitle{overflow: hidden;}
.replyLeft{float: left;}
.score{float:right}
.scoreRight{margin-right: 5px;}
.replyImg{width: 19px;height: 18px;}
.replyRight{float: right;}
.replyFont{font-size: 15px;}
</style>
</head>
<body onload="onload()">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/admin/headerFooter/header.jsp"/>
	<section class="resultArea">
		<article class="topArea">
			<p class="top left1">대분류</p>
			<p class="top right1">${sort }</p>
			<p class="top left2">상호명</p>
			<p class="top right2">${gourmetDetail.gourmetNm }</p>
			<p class="top left1">전화번호</p>
			<p class="top right1">${gourmetDetail.gourmetTel }</p>
		</article>
		
	</section>
	<section class="resultArea">
		<h3 class="top titleMenu">메뉴</h3>
			<table id="table">

			</table>

	</section>
	<section class="resultArea">
		<h3 class="imageRegi">이미지 등록</h3>
		<hr>
		<ul id = "images">
			<!-- call script area -->
		</ul>
	</section>
	<section class="resultArea">
		<h3 class="imageRege">주소</h3>
		<hr>
		<!-- daum맵영역 -->
		<div id="map" style="width:100%;height:400px; margin-bottom:10px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1"></script>
		<script>
			var lst = ${gourmetDetail.gourmetAdrLat};
			var lon = ${gourmetDetail.gourmetAdrLon};
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

			var iwContent = '<div style="padding:5px;">${gourmetDetail.gourmetNm} <br><a href="http://map.daum.net/link/map/Hello World!,${gourmetDetail.gourmetAdrLat},${gourmetDetail.gourmetAdrLon}" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/${gourmetDetail.gourmetNm},${gourmetDetail.gourmetAdrLat},${gourmetDetail.gourmetAdrLon}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
		<p class="top right1">${gourmetDetail.gourmetAdrStr }</p>
	</section>
	<section class="resultArea">
		<div class="replyTitle">
			<h3 class="replyLeft">댓글</h3>
			<span class="score">${gourmetDetail.gourmetTotalGrd }</span>
			<span class="score scoreRight">평점</span>
		</div>
		<hr>
		
		<c:choose>
			<c:when test="${reply eq null }">
				<p>등록된 댓글이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${reply }" var="i">
					<article class="storeReplyHeader">
						<img src="/resources/webSocket/picture/${i.userRank }.png" alt="demo" class="replyLeft replyImg"> <span class="replyLeft">${i.userId }</span>						
					</article>
					<article class="storeReplyBody">
						<p class="replyLeft replyFont">${i.replyContent }</p>
						<p class="replyRight replyFont"><fmt:formatDate value="${i.replyReg }" pattern="yyyy-MM-dd HH:mm"/></p>
					</article>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
				
	</section>
	<article class="buttons">
			<form action="/admin/4-1.do">
				<input type="hidden" name="gourmetNum" value="${gourmetDetail.gourmetNum }">			
				<input type="hidden" name="gourmetAdrLat" value="${gourmetDetail.gourmetAdrLat}">
				<input type="hidden" name="gourmetAdrLon" value="${gourmetDetail.gourmetAdrLon}">				
				<button type="submit" class="modify">수정</button>
				<button type="button" onclick="cancel(${pageNum})" class="cancel">취소</button>
			</form>
		</article>
	
	<jsp:include page="/WEB-INF/views/admin/headerFooter/footer.jsp"/>
	
<script>
function myMap() {
var mapProp= {
    center:new google.maps.LatLng(51.508742,-0.120850),
    zoom:5,
};
var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
//뒤로가기 버튼
function cancel(val){
	location.href="/admin/1-1.do?pageNum="+val;
}


//이미지 파일 받기
var kli = "${gourmetDetail.gourmetPictureName}";
var sp = kli.split("|");
function onload(){
	//menu
	var ei = "${gourmetDetail.gourmetMenu}";
	var menu = ei.split("|");
	var table = "<th class='menu'>메뉴명</th>	<th class='price'>가격</th>";

	for(i=0;i<menu.length-1; i++){
		var lm=menu[i].split("*");
		table+= "<tr><td>"+lm[0]+"</td><td>"+lm[1]+"</td></tr>";
	}
	document.getElementById("table").innerHTML = table+"</table>";
	
	//images area
	
	var ul = "";
	for(i=0; i<sp.length-1; i++){
		ul += "<li class='demoImage '><img src='/resources/report/image/"+sp[i]+"'class= "+sp[i]+" alt='"+sp[i]+"'/><c:if test="${reportOne.reportStatus eq 0 }"><input type='button' class='"+sp[i]+" del' id='j"+i+"' value='삭제'>	</c:if></li>";
	}
	document.getElementById("images").innerHTML = ul;
	
	
	//image del button
	$(document).ready(function(){
		$("input").click(function(){

			
			$(this).prevAll().remove();
			$(this).remove();
			var j = $(this).attr("id");
			alert(j);
			switch (j) {
			case "j0":
				result = kli.replace(sp[0], "");
				break;
			case "j1":
				result = kli.replace(sp[1], "");
				break;
			case "j2":
				result = kli.replace(sp[2], "");
				break;
			case "j3":
				result = kli.replace(sp[3], "");
				break;
			case "j4":
				result = kli.replace(sp[4], "");
				break;
			}
		})
	});
}


</script>
</body>
</html>