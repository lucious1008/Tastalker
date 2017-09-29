<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-report</title>
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
.right4{width: 50%; padding: 0px 10px; margin-bottom: auto;}
table{width: 85%; margin:auto;}
table tr td{
	text-align: center; font-size: 15px; cursor: pointer;
}
.menu, .price{ width: 50%; border-bottom: 1px solid}
.titleMenu{width: 15%;}
/* 메뉴추가영역 */
#addmenu{margin-left: 700px;}
/* 이미지 영역 */
.demoImage{width: 167px; height: 137px; float: left; margin-right:9px; list-style: none;}
	
.showImage{width: 167px; height: 137px; float: left; margin-right:9px; list-style: none;}

#addimg{width: 200px; float: left;}
#addfile{width: 100px; margin-top:20px; margin-left: 550px; margin-bottom: 20px;}
/* img{width:175px; height: 137px;} */
.del{margin-left: 64px;}
.resultAreaimg{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px 30px;
	border: 1px solid #b5121b;
	overflow: hidden;
}
.resultAreaimg1{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px 60px;
	border: 1px solid #b5121b;
	overflow: hidden;
}
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
</style>

<!-- footer -->
<style>
	footer{width:100%; height: 150px; background-color: #b5121b; background-image: url("/resources/images/footerBg.PNG")}
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
				<img src="/resources/images/logo.png" id="logo">
			</div>
				<div id="search">
					<span class='green_window'>
					<input type='text' class='input_text' id="searchEnter"/>
					</span>
					<button type='submit' class='sch_smit' id="searchButton">검색</button>
				</div>
		</div>
		
		<div id="header-bottom">
			<div id="header-location">현재위치<img src="/resources/images/radar-header1.png" id="header-radar" onclick="whichs()">서울 용산구 용산동2가 산 1-11</div>
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
<form method="post" action="report.do" enctype="multipart/form-data" onsubmit="return validCheck()">
<section class="resultArea">
		<article class="topArea">
			<p class="top left1">대분류</p>
			<p class="top right1"><select name="reportSort">
				<option value="1">치킨</option>
				<option value="2">피자</option>
				<option value="3">중국집</option>
				<option value="4">양식</option>
				<option value="5">한식/분식</option>
				<option value="6">회/일식</option>
				<option value="7">족발/보쌈</option>
				<option value="8">도시락</option>
				<option value="9">패스트푸드</option>
			</select></p>
			<p class="top left2">상호명</p>
			<p class="top right2"><input type="text" id="reportNm" name="reportNm" onkeyup="reportNmChk()" autocomplete="off"><span id="chkNm"></span></p>
			<p class="top left1">전화번호</p>
			<p class="top right1"><input type="text" id="reportTel" name="reportTel" onkeyup="reportTelChk()" autocomplete="off"><span id="chkTel"></span></p>
			<p class="top left3">제보내용</p>
			<p class="top right3"><textarea rows="9" cols="110" name="reportComment" style="width: 99.2%"></textarea></p>
		</article>
		
	</section>
	<section class="resultArea">
		<h3 class="top titleMenu">메뉴</h3>
		<input type="button" value="메뉴추가" id="addmenu">
		<table id="foodmenu">
			<tr>
				<th class="menu">메뉴명</th>
				<th class="price">가격</th>
			</tr>
		</table>
		<p><span id="chkMenu" style="margin-left: 25%" >For The Menu Test</span><span style="margin-left: 25%" id="chkPrice">For The Price Test</span></p>
	</section>
	<section class="resultAreaimg1">
		<h3 class="imageRegi" id="addimg">이미지 등록</h3>
		<section>
		<input type="button" value="파일추가" id="addfile">
		<input type="button" value="삭제" id="delimg">
		</section>
		<hr>
		<ul id="imgarea">
		</ul>
	</section>
	<section class="resultArea">
		<h3 class="imageRege">주소</h3>
		<hr>
		<!-- 구글맵영역 -->
		<!-- <div id="googleMap" style="width:100%;height:400px;margin-bottom:10px"></div> -->
		<div class="map_wrap">
			<div id="map" style="width:100%;height:400px;margin-bottom:10px;overflow:hidden;"></div>
			<div class="hAddr">
		        <span class="title">지도중심기준 행정동 주소정보</span>
		        <span id="centerAddr"></span>
	   		</div>
   		</div>
		<p class="top left1">지번주소</p>
		<p class="top right4"><input type="text" id="reportAdrStr1" value="" readonly="readonly" style="width:100%;"></p>
		<p class="top right4"><input type="text" id="reportAdrStr2" placeholder="상세주소를 입력해주세요" onkeyup="SumAdr()" style="width:50%;"></p>
		
	</section>
	<article class="buttons">
		<button type="submit" class="letReport">확인</button>
	</article>
	
	<input type="hidden" name="reportUser" value="${SID }">
	<input type="hidden" id="chkMenuValue" value="">
	<input type="hidden" id="chkMenuPriceValue" value="">
	<input type="hidden" id="countAddMenu" value="">
<!-- 상호명 체크 -->
<script type="text/javascript">
var nmPattern = /^[가-힣a-zA-Z0-9\s]+$/;
function reportNmChk() {
	var reportNm = $('#reportNm').val();
	if(!nmPattern.test(reportNm)){
		$('#chkNm').text('숫자,한글,영어로 기입해주세요');
		return false;
	}
	$('#chkNm').text("");
	return true; 
} 
</script>
	
<!-- 전화번호 체크 -->
<script type="text/javascript">
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
</script>

<!-- 메뉴,가격 체크 -->
<script type="text/javascript">
var pattern = /^[^=!@%^*_+.,/:`~|]+$/;//메뉴 확인용
var pattern1 = /^[0-9]+$/;//가격 확인용 
function reportMenuChk() {
	var totalMenu = $("#countAddMenu").val();
	for(i = 1; i<=totalMenu; i++){
		var menuName = $("#menuName"+i+"").val();
		if(!pattern.test(menuName)){
			$('#chkMenu').text('적합하지않은 문자가 있습니다. 재기입해주세요');
			document.getElementById('chkMenuValue').value = "N";
			return false;
			break;
		}else{
			$('#chkMenu').text("좋은메뉴명 입니다.");
			document.getElementById('chkMenuValue').value = "Y";
		}
	}
			return true;
}

function reportMenuPriceChk() {
	var totalMenu = $("#countAddMenu").val();
	for(i = 1; i<=totalMenu; i++){
		var menuPrice = $("#menuPrice"+i+"").val();
		if(!pattern1.test($("#menuPrice"+i+"").val())){
			$('#chkPrice').text('숫자만 기입 할 수 있습니다. 재기입해주세요');
			document.getElementById('chkMenuPriceValue').value = "N";
			return false;
			break;
		}else{
			$('#chkPrice').text("좋은가격");
			document.getElementById('chkMenuPriceValue').value = "Y";
		}
	}
			return true; 
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
</script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
	<!-- 사진추가 스크립트 -->
<script type="text/javascript">
		var countAddImg = 0;
	$(function() {
		$("#addfile").click(function() {//추가
			if(countAddImg > 4 ){
				alert("사진파일은 최대5장까지 업로드 가능합니다.");
			}else{
			countAddImg++;
			var row = "<li class='demoImage'>";
			row += "<td><input type='file' class='files1' name='files1' id='imgNum"
					+countAddImg+"' value='' onchange="+"getPriview(this,$('#showImage"+countAddImg+"'))"+"></td>";
			row += "<td><div class='showImage' id='showImage"+countAddImg+"'></div></td>";
			row += "</li>";
			$("#imgarea").append(row);
			}
		});
		$("#delimg").on("click", function() {//삭제
			$("li:last-child").closest(".demoImage").remove();
			countAddImg--;
		});
	});
</script>

<!-- 사진 미리보기  -->
<script>
function getPriview(html, $target) {
	if(html.files && html.files[0] && html.files[0].type.match("image")){
		var reader = new FileReader();
		reader.onload = function(e){
			$target.html('<img src="' + e.target.result + '" border="0" alt="demo" class="showImage"/>');
		}
		reader.readAsDataURL(html.files[0]);
	}
}
		
</script>
<!-- 사진삭제 -->
<script type="text/javascript">

</script>
<!-- 사진 빈값 방지 -->
<script type="text/javascript">

function validCheck(){
	mergeMenuNPrice();
	var length = document.getElementsByClassName("files1").length;
	for(i=0;i<length;i++){
		if(document.getElementsByClassName("files1")[i].value == '' || !document.getElementsByClassName("files1")[i].files[0].type.match("image")){
			alert("사진 파일은 사진 파일로만 등록해주세요");
			return false;
		}
	}
	if(!reportNmChk()){
		alert("상호명을 확인 해주세요");
		return false;
	}
	if(!reportTelChk()){
		alert("전화번호를 확인 해주세요");
		return false;
	}
	if($('#chkMenuValue').val() == "N"){
		alert("메뉴명을 확인 해주세요");
		return false;
	}
	if($('#chkMenuPriceValue').val() == "N"){
		alert("메뉴 가격을 확인 해주세요");
		return false;
	}
	return true;
}

</script>

	<!-- 메뉴추가 스크립트 -->
<script type="text/javascript">
	var countAddMenu = 0;
	$(function() {
		$("#addmenu").click(function() {//추가
			countAddMenu++;
			document.getElementById('countAddMenu').value = countAddMenu;
			var row = "<tr>";
			row += "<td><input type='text' id='menuName"+countAddMenu+"' value='' onkeyup='reportMenuChk("+countAddMenu+")' /></td>";
			row += "<td><input type='text' id='menuPrice"+countAddMenu+"' value='' onkeyup='reportMenuPriceChk("+countAddMenu+")'/></td>";
			row += "<td><input type='button' id='delmenu' value='삭제'></td>";
			row += "</tr>";
			$("#foodmenu").append(row);
		});
		$("#foodmenu").on("click", "#delmenu", function() {//삭제
			$("tr:last-child").closest("tr").remove();
			$('#chkPrice').text('');
			$('#chkMenu').text('');
			document.getElementById('chkMenuValue').value = "";
			document.getElementById('chkMenuPriceValue').value = "";
			countAddMenu--;
			document.getElementById('countAddMenu').value = countAddMenu;
			reportMenuChk();
			reportMenuPriceChk();
		});
	});
</script>

<input type="hidden" name="reportMenu" id="reportMenu">
<input type="hidden" value="${SID }" id="SID">

<!-- 메뉴와 가격 합쳐서 메뉴에 넣기 -->
<script type="text/javascript">//메뉴 등록시 값이 너무 많으면 DB에서 받을 길이보다 길어짐
function mergeMenuNPrice() {
	var menuNum = 5;
	var menuTotal = "";
	for(var i = 1; i <= menuNum; i++){
		var menuName = $("#menuName"+i+"").val();
		var menuPrice = $("#menuPrice"+i+"").val();
		if($.trim(menuName).length == 0 || $.trim(menuPrice).length == 0){
			memuTotal="메뉴빈칸임"
		}else{
			var menuNPrice = menuName +"*"+menuPrice+"|";
			var menuTotal = menuTotal + menuNPrice; 
			document.getElementById('reportMenu').value = menuTotal;
//			eval("menuNPrice"+i+"="+menuNPrice);
		}
	}
	SumAdr();
}

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
			$(location).attr('href','/member/gotoReportPage.do');	
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
		$(location).attr('href','29.do');
	});
});

$(function() {
	$("#logo").click(function() {
		$(location).attr('href','/gotoMain.do');
	});
});
</script>
<!-- map -->
<input type="hidden" name="reportAdrStr" id="reportAdrStr">
<input type="hidden" name="reportAdrLat" id="reportAdrLat">
<input type="hidden" name="reportAdrLon" id="reportAdrLog">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.550947, 126.989297), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

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
            /* 명우 start */
            document.getElementById('reportAdrLat').value = lat;
		    document.getElementById('reportAdrLog').value = lng;
		    document.getElementById('reportAdrStr1').value = result[0].address.address_name;
            /* 명우 end */
            var content = '<div class="bAddr">' +
          			  '<span class="title"></span>' + 
           				 detailAddr+ '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            SumAdr();
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === daum.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
        infoDiv.innerHTML = result[0].address_name;
    }    
}
</script>

<!-- for sum address -->
<script type="text/javascript">
function SumAdr() {
	var roadAddress = $('#reportAdrStr1').val();
	var AddressDetail = $('#reportAdrStr2').val();
	var reportAdrStr = roadAddress.concat(" ",AddressDetail);
	document.getElementById('reportAdrStr').value = reportAdrStr;
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
</form>
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

<!-- footer -->
<footer>
	<p>©2017 송명우와 마부시이 Design by 송명우</p>
</footer>
</html>