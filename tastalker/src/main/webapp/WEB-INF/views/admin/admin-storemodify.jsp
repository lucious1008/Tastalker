<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>관리자-맛집수정</title>
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
.topContent{width: 138px; height: 29px;}
.topInput{margin-bottom: 6px;}
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
.addPrice{margin-left: 79%;}
.priceDel{float: right;}
/* 정규식 영역*/
.gourmetMod{font-size: 15px; margin-left: 12px;}
/* 이미지 영역 */
.demoImage{
	width: 175px; height: 165px; float: left; margin-right:9px;
}
img{width:175px; height: 137px;}
.del{margin-left: 64px;}
.buttons{text-align: center;margin: 10px;}
/* 지도영역 */

.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

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
	<form action="/admin/2.do">
	<section class="resultArea">
		<article class="top">
			<p class="topContent">대분류</p>
			<p class="topContent">상호명</p>
			<p class="topContent">전화번호</p>
		</article>
		<article class="topBody">
			<select class="topInput" name="gourmetSort">
				<option value="1" <c:if test="${gourmetModify.gourmetSort eq 1}">selected</c:if>>치킨</option>
				<option value="2" <c:if test="${gourmetModify.gourmetSort eq 2}">selected</c:if>>피자</option>
				<option value="3" <c:if test="${gourmetModify.gourmetSort eq 3}">selected</c:if>>중국집</option>
				<option value="4" <c:if test="${gourmetModify.gourmetSort eq 4}">selected</c:if>>양식</option>
				<option value="5" <c:if test="${gourmetModify.gourmetSort eq 5}">selected</c:if>>한식/분식</option>
				<option value="6" <c:if test="${gourmetModify.gourmetSort eq 6}">selected</c:if>>회/일식</option>
				<option value="7" <c:if test="${gourmetModify.gourmetSort eq 7}">selected</c:if>>족발/보쌈</option>
				<option value="8" <c:if test="${gourmetModify.gourmetSort eq 8}">selected</c:if>>도시락</option>
				<option value="9" <c:if test="${gourmetModify.gourmetSort eq 9}">selected</c:if>>패스트푸드</option>
			</select><br>
			<input type="text" name="gourmetNm" class="topInput" onkeyup="reportNmChk()" id="gourmetNameText" value="${gourmetModify.gourmetNm }"/><span class="gourmetMod" id="gourmetNmMod"></span><br>
			<input type="text" name="gourmetTel" class="topInput" onkeyup="reportTelChk()" id="reportTel" value="${gourmetModify.gourmetTel }"/><span class="gourmetMod" id="chkTel"></span>
		</article>

	</section>
	<section class="resultArea">
		<h3 class="top titleMenu">메뉴</h3>
		<input type="button" value="가격추가" class="addPrice">
		<hr>
		<table id="table">
			<!-- 메뉴 영역 스크립트 onload참조 -->	
		</table>
		<!-- 메뉴정보 -->
		<input type="hidden" id="gourmetMenu" name="gourmetMenu" value="${gourmetModify.gourmetMenu}"/> 
		<!-- 맛집 번호 -->
		<input type="hidden" id="gourmetNum" name="gourmetNum" value="${gourmetModify.gourmetNum}"/> 
		<input type="hidden" id="chkMenuValue" value="N">
		<input type="hidden" id="chkMenuPriceValue" value="N">
	</section>
	<section class="resultArea">
		<h3 class="imageRegi">이미지 등록</h3>
		<hr>
		<ul id="images">
			<!-- 이미지 영역 스크립트 onload참조 -->	
		</ul>
	</section>
	<section class="resultArea">
		<h3 class="imageRege">주소</h3>
		<hr>
		<!-- daum맵영역 -->
		<!-- map -->
		<!-- 주소정보 삽입 -->
		<input type="hidden" name="gourmetAdrStr" id="gourmetAdrStr" value= "${gourmetModify.gourmetAdrStr}">
		<!-- 위도 정보 삽입 -->
		<input type="hidden" name="gourmetAdrLat" id="gourmetAdrLat" value="${ gourmetModify.gourmetAdrLat}">
		<!-- 경도 정보 삽입 --> 
		<input type="hidden" name="gourmetAdrLon" id="gourmetAdrLon" value="${ gourmetModify.gourmetAdrLon}">
		<div id="map" style="width:100%;height:400px; margin-bottom:10px; position:relative;overflow:hidden;">
		</div>	
		<p class="top left1">현재주소</p>
		<input type="text" class="top right1" id="adrBox" value="${gourmetModify.gourmetAdrStr }"/>
	</section>
	<section class="resultArea">
		
		<div class="replyTitle">
			<h3 class="replyLeft">댓글</h3>
			<span class="score">${gourmetModify.gourmetTotalGrd }</span>
			<span class="score scoreRight">평점</span>
		</div>
		<hr>

		<c:choose>
			<c:when test="${reply eq null }">
				<p>등록된 댓글이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${reply }" var="i">
					<div class="replyArea">
						<article class="storeReplyHeader">
							<img src="/resources/webSocket/picture/${i.userRank }.png" alt="demo" class="replyLeft replyImg"> <span class="replyLeft">${i.userId }</span>
							<input type="button" class="replyRight" onclick="replyDel(${gourmetModify.gourmetNum },${i.replyNum})" value="삭제" />
						</article>
						<article class="storeReplyBody">
							<p class="replyLeft replyFont">${i.replyContent }</p>
							<p class="replyRight replyFont">
								<fmt:formatDate value="${i.replyReg }" pattern="yyyy-MM-dd HH:mm" />
							</p>
						</article>
						<hr>
					</div>
				</c:forEach>

			</c:otherwise>

		</c:choose>


	</section>

	<article class="buttons">
			
				<button type="submit" class="modify" onclick="goToModify()">확인</button>
				<button type="button" class="modify" onclick="goToDel(${gourmetModify.gourmetNum})">삭제</button>
				<button type="button" class="cancel" onclick="cancel()">취소</button>
			
		</article>
	</form>
	<jsp:include page="/WEB-INF/views/admin/headerFooter/footer.jsp"/>
	
<script>

var kli = "${gourmetModify.gourmetPictureName}";
var sp = kli.split("|");
//메뉴추가시 전체값을 누적;
var countSumMenu = 0;

function onload() {
	//menu
	var ei = "${gourmetModify.gourmetMenu}";
	var menu = ei.split("|");
	var table = "<th class='menu'>메뉴명</th>	<th class='price'>가격</th><th class='lastCol'></th>";
	countSumMenu = menu.length-1;
	for(i=0;i<menu.length-1; i++){
		var lm=menu[i].split("*");
		table+= "<tr><td><input type='text' value='"+lm[0]+"'/></td><td><input type='number' value='"+lm[1]+"'</td><td><input type='button' onclick='deleteLine(this)' class='menuDel' value='삭제'/></td></tr>";

		
	}
	document.getElementById("table").innerHTML = table;
	
//images area
	
	var ul = "";
	for(i=0; i<sp.length-1; i++){
		ul += "<li class='demoImage '><img src='/resources/report/image/"+sp[i]+"'class= "+sp[i]+" alt='"+sp[i]+"'/><c:if test="${reportOne.reportStatus eq 0 }"><input type='button' class='"+sp[i]+" del' id='j"+i+"' value='삭제'>	</c:if></li>";
	}
	document.getElementById("images").innerHTML = ul;
}

//reply delete ajax
function replyDel(num,val){
	
	
	var xhttp;    
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     
	    }
	  };
	  xhttp.open("GET", "4-2?gourmetNum="+num+"&replyNum="+val, true);
	  xhttp.send();
} 


//reply tag delete
$(document).ready(function(){
	$(".replyRight").click(function(){
		$(this).parents("div").remove();
	});
	
//메뉴추가

	$(".addPrice").click(function(){
		$("table").append("<tr><td><input type='text'><spam id='reportMenuChk'></span></td><td><input type='number'></td><td><input type='button' onclick='deleteLine(this)' class='menuDel' value='삭제'/></td></tr>");
		countSumMenu++;
	});
	
	
});

//메뉴삭제
function deleteLine(obj){
	var tr = $(obj).parent().parent();
	tr.remove();
}
//메뉴 val값 체크
var pattern = /^[^=!@%^*_+.,/:`~|]+$/;//메뉴 확인용
var pattern1 = /^[0-9]+$/;//가격 확인용 

function reportMenuChk(num) {
	var menuName = $("#menuName"+num+"").val();
	if(!pattern.test(menuName)){
		$('#chkMenu').text('적합하지않은 문자가 있습니다. 재기입해주세요');
		document.getElementById('chkMenuValue').value = "N";
		return false;
	}else{
		$('#chkMenu').text("좋은메뉴명");
		document.getElementById('chkMenuValue').value = "Y";
		return true;
	}
}
function reportMenuPriceChk(num) {
	var menuPrice = $("#menuPrice"+num+"").val();
	if(!pattern1.test(menuPrice)){
		$('#chkPrice').text('숫자만 기입 할 수 있습니다. 재기입해주세요');
		document.getElementById('chkMenuPriceValue').value = "N";
		return false;
	}else{
		$('#chkPrice').text("좋은가격");
		document.getElementById('chkMenuPriceValue').value = "Y";
		return true; 
	}
} 


 
//상호명 체크

	var nmPattern = /^[가-힣a-zA-Z0-9]+$/;
	function reportNmChk() {
		var reportNm = $('#gourmetNameText').val();
		if(!nmPattern.test(reportNm)){
			$('#gourmetNmMod').text('숫자,한글,영어로 기입해주세요');
			return false;
		}
		$('#gourmetNmMod').text("");
		return true; 
	} 
//전화번호 체크
	var telPattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	function reportTelChk() {
		var reportTel = $('#reportTel').val();
		if(!telPattern.test(reportTel)){
			$('#chkTel').text('OOO-OOO-OOOO 형식으로 기입해주세요');
			return false;
		}
		$('#chkTel').text("");
		return true; 
	} 
//메뉴와 가격 합치기
function goToModify(){
	var j = 0;
	var k = 1;
	var menuStr = "";
	var jx = (countSumMenu*3)-1;
	for(i=0; i<jx; i++){
		
		if(i == j){
			menuStr += document.getElementsByTagName("td")[i].childNodes[0].value + "*";
			j = i + 3;
		}else if(i == k){
			menuStr += document.getElementsByTagName("td")[i].childNodes[0].value + "|";
			k = i + 3;
		}
		
	}
	document.getElementById("gourmetMenu").value = menuStr;
}
//삭제버튼
function goToDel(val){
	location.href= "/admin/3.do?gourmetNum="+val;
}
//취소버튼
function cancel(){
	history.back();
}
//지도 영역
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(${lati}, ${lngi}), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
			infowindow = new daum.maps.InfoWindow({
				zindex : 1
			}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);

			// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === daum.maps.services.Status.OK) {        	
        	var lat = mouseEvent.latLng.getLat();
        	var lng = mouseEvent.latLng.getLng();
        	var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            document.getElementById('gourmetAdrLat').value = lat;
		    document.getElementById('gourmetAdrLon').value = lng;
		    document.getElementById('gourmetAdrStr').value = result[0].address.address_name;		    
		    document.getElementById('adrBox').value = result[0].address.address_name;
            var content = '<div class="bAddr">' +
          			  '<span></span>' + 
           				 detailAddr+ '</div>';

            // 마커를 클릭한 위치에 표시합니다            
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);            
            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);            
        }
    });
});

			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'idle', function() {
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});

			function searchAddrFromCoords(coords, callback) {
				// 좌표로 행정동 주소 정보를 요청합니다
				geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
						callback);
			}

			function searchDetailAddrFromCoords(coords, callback) {
				// 좌표로 법정동 상세 주소 정보를 요청합니다
				geocoder.coord2Address(coords.getLng(), coords.getLat(),
						callback);
			}

			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
				if (status === daum.maps.services.Status.OK) {					
					infoDiv.value = result[0].address_name;
				}
			}
		</script>
</body>
</html>