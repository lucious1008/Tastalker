<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-join</title>
</head>

<!-- body style -->
<style>
body{margin: 0; background-color: #f0f0f0;}
	#mainbody{background-color: #f0f0f0; width:870px; height:600px; margin: auto;
		padding-left: 45px; padding-right: 45px; padding-top: 70px; 
		}
		#userinfo{border:1px solid #b5121b; width: 700px; height:500px; background-color: white; margin: 5px 0 10px 5px; padding-left: 10px; margin:auto;}
			#userinfo hr{width: 650px;}
				.front{width: 150px; float: left; padding-left: 150px; padding-top: 3px;}
				.front1{width: 150px; float: left; padding-left: 150px; padding-top: 10px;}
				.front2{width: 150px; float: left; padding-left: 150px; padding-top: 15px;}
				#letmodify{background-color: gray; width: 160px; height: 30px; text-align: center; 
							margin-left: 200px;}
				#cancle{background-color: gray; width: 80px; height: 30px; text-align: center; }
			#map{display: none;}
</style>


<!-- footer -->
<style>
	footer{width:100%; height: 150px; background-color: #b5121b; background-image: url("../../resources/images/footerBg.PNG")}
	footer p{text-align: center; color: white;  line-height: 150px; margin: 0;}
</style>


<body>
<!-- mainbody -->
	<div id="mainbody">
			<div id="userinfo">
				<form method="post" action="29-1.do" onsubmit="return validCheck()" id="infoForm">
				<p>테이스토커 회원가입</p><hr>
				<span class="front1">아이디</span><p><input type="text" id="userId" name="userId" onkeyup="userIdChk()" autocomplete="off"><span id="chkId"></span></p>
				<span class="front">비밀번호</span><p><input type="password" id="userPw" name="userPw" onkeyup="userPwChk()" autocomplete="off"><span id="chkPw"></span></p>
				<span class="front">비밀번호 재입력</span><p><input type="password" id="userPw2" onkeyup="userPw2Chk()" autocomplete="off"><span id="chkSamePw"></span></p>
				<span class="front">이름</span><p><input type="text" id="userNm" name="userNm" onkeyup="userNmChk()" autocomplete="off"><span id="chkNm"></span></p>
				<span class="front">성별</span><p><input type="radio"  value="M" name="userGender">남자
												 <input type="radio"  value="F" name="userGender">여자</p>
				<span class="front">주소</span><p><input type="text" readonly="readonly" placeholder="우편번호" id="sample4_postcode">
												<input type="button" onclick="sample4_execDaumPostcode()" value="우편검색" style="margin-left: 5px"></p>
				<span class="front"></span><p><input type="text" style=" width :300px" readonly="readonly" id="sample4_roadAddress" placeholder="주소"></p>
				<span class="front"></span><p><input type="text" style=" width :300px" placeholder="상세주소를 입력해주세요" id="sample4_address2" onkeyup="sendAdr()"></p>
				<div id="map" style="width:100%;height:400px;"></div>
				<span class="front">이메일</span><p><input type="email" id="userEmail" name="userEmail" onkeyup="userEmailChk()" autocomplete="off"><span id="chkEmail"></span></p>
				<span id="guide" style="color:#999"></span>
				<button id="letmodify" type="submit">회원가입완료</button>
				<input id="cancle" type="button" value="취소">
				
				<input type="hidden" id="sample4_jibunAddress">
				<input type="hidden" id="userAdrStr" name="userAdrStr">
				<input type="hidden" id="userAdrLat" name="userAdrLat">
				<input type="hidden" id="userAdrLon" name="userAdrLon">
				
				<input type="hidden" id="idChk" value="N">
				</form>
			</div>
	</div>
</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
	<!-- 링크이동 -->
<script type="text/javascript">
$(function() {
	$("#cancle").click(function() {
		$(location).attr('href','24.do');
	});
});
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
		        document.getElementById('userAdrLon').value = result.items[0].point.y;

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

<!-- userId중복검사  09.15.-->
<script type="text/javascript">
function userIdChk() {
	var userId = $('#userId').val();
	if(userId.length < 8){
		$("#chkId").text("ID는 8자 이상 입니다.");
		$("#idChk").val('N');
	}else if(userId.length >= 8 && userId.length <= 15){
		if(userIdChk2()){
			$.ajax({
			     type : 'POST',  
			     data:"userId="+ userId,
			     dataType : 'text',
			     url : '29-2.do',  
			     success : function(rData, textStatus, xhr) {
			      var chkRst = rData;
			      console.log(chkRst)
			      if(chkRst == "0"){
			       $("#chkId").text("등록 가능 합니다.");
			       $("#idChk").val('Y');
			      }else{
			       $("#chkId").text("중복 되어 있습니다.");
			       $("#idChk").val('N');
			      }
			     },
			     error : function(xhr, status, e) {  
			      alert(e);
			     }
			  });//중복검사
		}//아이디 체크
		$('#chkId').text('숫자 또는 영문자로 8~15자리를 사용해야 합니다.');
		$("#idChk").val('N');
		return false;
	}else{
		$("#chkId").text("ID는 15자 이하 입니다.");
		$("#idChk").val('N');
	}
}

</script>

<!-- 아이디 체크 -->
<script type="text/javascript">
	var userIdRules = /^[a-zA-Z0-9]{8,15}$/;
function userIdChk2() {
	var userId = $('#userId').val();
	if(!userIdRules.test(userId)){
		$('#chkId').text('숫자 또는 영문자로 8~15자리를 사용해야 합니다.');
		return false;
	}
	$('#chkId').text("사용가능한 아이디 입니다.");
	return true; 
} 
</script>

<!-- 비밀번호 중복 체크 -->
<script type="text/javascript">
	var passwordRules = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
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
	
	if($("#idChk").val() == "N"){
		alert("아이디를 확인 해주세요");
		return false;
	}else if(!userPwChk()){
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
</script>

<!-- footer -->
<footer>
	<p>©2017 송명우와 마부시이 Design by 송명우</p>
</footer>
</html>