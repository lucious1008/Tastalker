<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-modify</title>
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
			#usermodify{background-color: white;}
			#pagelocation{font-size: 15px;}
		#usercontents{background-color: silver; width: 725px; height:465px; float: right;}
			#userinfo{border:1px solid #b5121b; width: 700px; height:450px; background-color: white; margin: 5px 0 10px 5px; padding-left: 10px;}
			#userinfo hr{width: 650px;}
				.front{width: 150px; float: left; padding-left: 150px; padding-top: 3px;}
				.front1{width: 150px; float: left; padding-left: 150px; padding-top: 10px;}
				#letmodify{background-color: gray; width: 160px; height: 30px; text-align: center; 
							margin-left: 200px; margin-top: 20px; }
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
					<input type='text' class='input_text' />
					</span>
					<button type='submit' class='sch_smit'>검색</button>
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
				<form method="post" action="26-1.do" onsubmit="return validCheck()">
					<p>${SID }님의 정보수정</p><hr>
					<span class="front">비밀번호</span><p><input type="password" id="userPw" name="userPw" onkeyup="userPwChk()" autocomplete="off"><span id="chkPw"></span></p>
					<span class="front">비밀번호 재입력</span><p><input type="password" id="userPw2" onkeyup="userPw2Chk()" autocomplete="off"><span id="chkSamePw"></span></p>
					<span class="front">이름</span><p><input type="text" id="userNm" name="userNm" onkeyup="userNmChk()" autocomplete="off"><span id="chkNm"></span></p>
					<span class="front">주소</span><p><input type="text" readonly="readonly" placeholder="우편번호" id="sample4_postcode">
												<input type="button" onclick="sample4_execDaumPostcode()" value="우편검색" style="margin-left: 5px"></p>
					<span class="front"></span><p><input type="text" style=" width :300px" readonly="readonly" id="sample4_roadAddress" placeholder="주소"></p>
					<span class="front"></span><p><input type="text" style=" width :300px" placeholder="상세주소를 입력해주세요" id="sample4_address2" onkeyup="sendAdr()"></p>
					<div id="map" style="width:100%;height:400px; display: none;"></div>
					
					<span class="front">이메일</span><p><input type="email" id="userEmail" name="userEmail" onkeyup="userEmailChk()" autocomplete="off"><span id="chkEmail"></span></p>
					
					<input id="letmodify" type="submit" value="회원정보수정">
					<input id="cancle" type="button" value="취소">
					
					<span id="guide" style="color:#999"></span>
					<input type="hidden" id="sample4_jibunAddress">
					<input type="hidden" id="userAdrStr" name="userAdrStr">
					<input type="hidden" id="userAdrLat" name="userAdrLat">
					<input type="hidden" id="userAdrLog" name="userAdrLog">
					<input type="hidden" name="userId" value="${SID }">
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=864ab974522c3f297751b45a9653abc1&libraries=services"></script>

	<!-- 링크이동 -->
<script type="text/javascript">
$(function() {
	$("#useractive").click(function() {
		$(location).attr('href','../member/gotoUserInfo.do?page=1');
	});
});

$(function() {
	$("#userleave").click(function() {
		$(location).attr('href','../member/27.do');
	});
});

$(function() {
	$("#cancle").click(function() {
		$(location).attr('href','../member/gotoUserInfo.do?page=1');
	});
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
		$(location).attr('href','../gotoMain.do');
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
</script>

<!-- 다음 도로명 -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=L0UdaD7iya48wvsgGIbM&submodules=geocoder"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                
                ////
                
		        var map = new naver.maps.Map('map');
		    	var myaddress = data.jibunAddress;// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		    	var address = '';
		    	naver.maps.Service.geocode({address: myaddress}, function(status, response) {
		        if (status !== naver.maps.Service.Status.OK) {
		            return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
		        }
		        var result = response.result;
		        // 검색 결과 갯수: result.total
		        // 첫번째 결과 결과 주소: ㅊ
		        // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
		        var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
		        document.getElementById('userAdrLat').value = result.items[0].point.x;
		        document.getElementById('userAdrLog').value = result.items[0].point.y;
				
		        sendAdr();
		        
		        map.setCenter(myaddr); // 검색된 좌표로 지도 이동
		        // 마커 표시
		        var marker = new naver.maps.Marker({
		          position: myaddr,
		          map: map
		        });
		        // 마커 클릭 이벤트 처리
		        naver.maps.Event.addListener(marker, "click", function(e) {
		          if (infowindow.getMap()) {
		              infowindow.close();
		          } else {
		              infowindow.open(map, marker);
		          }
		        });
		        // 마크 클릭시 인포윈도우 오픈
		        var infowindow = new naver.maps.InfoWindow({
		            content: '<h4> [네이버 개발자센터]</h4><br> x좌표'+result.items[0].point.x+' y좌표 : '+result.items[0].point.y+'<br> 주소명 : '+result.items[0].address
		        });
		    });
		      
                
				////
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<!-- 주소값 합치기 -->
<script type="text/javascript">
function sendAdr(){
	var roadAddress = $('#sample4_roadAddress').val();
	var AddressDetail = $('#sample4_address2').val();
	var userAdrStr = roadAddress.concat(" ",AddressDetail);
	document.getElementById('userAdrStr').value = userAdrStr;
}
</script>

<!-- 비밀번호 중복 체크 -->
<script type="text/javascript">
	var passwordRules = /^(?=.*[a-z])(?=.*[=!@%^*_+.,/:`~|])(?=.*[0-9]).{8,12}/;
function userPwChk() {
	var userPw = $('#userPw').val();
	userPw2Chk();
	if(!passwordRules.test(userPw)){
		$('#chkPw').text('숫자,영문자,특수기호 조합으로 8~12자리를 사용해야 합니다. 단($,#,&,<,>,{,},[,(,),])이 포함된 문자는 사용할수가 없습니다. ');
		return false;
	}
	$('#chkPw').text("사용가능한 비밀번호 입니다.");
	return true; 
} 
</script>
<!-- 2차 비밀번호 일치 체크 -->
<script type="text/javascript">
function userPw2Chk() {
	var userPw = $('#userPw').val();
	var userPw2 = $('#userPw2').val();
	if(userPw != userPw2){
		$('#chkSamePw').text('비밀번호가 일치 하지않습니다.');
		return false;
	}
	$('#chkSamePw').text("비밀번호가 일치 합니다.");
	return true; 
} 
</script>

<!-- 이름 체크 -->
<script type="text/javascript">
var namePattern = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
function userNmChk() {
	var userNm = $('#userNm').val();
	if(!namePattern.test(userNm)){
		$('#chkNm').text('사용 할 수 없는 이름입니다.');
		return false;
	}
	$('#chkNm').text('사용 가능한 이름입니다.');
	return true; 
} 
</script>
<!-- 이메일 체크 -->
<script type="text/javascript">
var emailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
function userEmailChk() {
	var userEmail = $('#userEmail').val();
	if(!emailPattern.test(userEmail)){
		$('#chkEmail').text('사용 할 수 없는 이메일입니다.');
		return false;
	}
	$('#chkEmail').text("사용 가능한 이메일입니다.");
	return true; 
} 
</script>

<script type="text/javascript">
function validCheck() {
	
	if(!userPwChk()){
		alert("비밀번호를 확인 해주세요");
		return false;
	}else if(!userPw2Chk()){
		alert("비밀번호 일치를 확인 해주세요");
		return false;
	}else if(!userNmChk()){
		alert("이름을 확인 해주세요");
		return false;
	}else if(!userEmailChk()){
		alert("이메일를 확인 해주세요");
		return false;
	}else{
		return true;
	}
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
</script>

<!-- footer -->
<footer>
	<p>©2017 송명우와 마부시이 Design by 송명우</p>
</footer>
</html>