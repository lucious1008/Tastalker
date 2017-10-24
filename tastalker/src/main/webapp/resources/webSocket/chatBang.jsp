<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
#uploadExit{
	position: absolute;
	top: 375px;
	left: 414px;
	
}
#register{
	position: absolute;
	top: 375px;
	left: 330px;
}
#cma_image{
	max-width: 150px;
	max-height: 150px;
}
.uploadBox{	
	text-align:center;
	display:none;	
	background-color: white;
	border-style: solid;
}
.views{
	overflow: hidden;
	width:470px;
    height:400px;
    position: absolute;
}
#sendButton{
	line-height:45px;
	text-align:center;
	width:20%;
 	background-color: #b5121b;
 	height: 45px;
 	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
	border-top-left-radius: 30px;
	border-top-right-radius: 30px;
	color: white;
}
.views > .chatTable > ul{
	width: 90%;
	list-style: none;
	margin-right: 30px;
}
.views >.chatTable{
	width: 100%;
	margin-top:15px;
	height:70%;
    overflow-y:scroll;
}
.views >.chatTable > ul > .myChatSide{
	width:100%;
	color: green;
	text-align: left;
}
.views >.chatTable > ul > .othersChatSide{
	
	width:100%;
	color: blue;
	text-align: right;
}
.chatInput{
	margin-left:5px;
	width:470px;
	position: absolute;
	top: 350px;	
}
.chatInputContent{
	float: left;
}
#textInputBar{
	width: 70%;
	height: 40px;
	
}
.myChatBox{	
	background-color: yellow;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
	border-top-left-radius: 30px;
	border-top-right-radius: 30px;
}
.othersChatBox{	
	background-color: lime;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
	border-top-left-radius: 30px;
	border-top-right-radius: 30px;
}

.close-lt-chat{
	position: absolute;
	left: 93%;
}

.chatBox{
	border-color: black;
	border-style:ridge;
	width: 470px;
	height: 400px;
	text-align: center;
	background-color: white;
	
}
.secondDepth{
	width: 470px;
	height: 400px;
	overflow: hidden;
	
}


.chatSelectLabel,#chatTitle{
	margin: auto;
	text-align: center;
	width: 150px;
	border-bottom-color: #b5121b;
	border-bottom-style: solid;
}
.left-arrow-chat{
	position: absolute;
}
</style>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input id="SID" type="hidden" value="${param.SID }">
<input id="area" type="hidden" value="${param.area }">
<input id="rank" type="hidden" value="${param.rank }">

<div class="chatBox" id="chatBox">
<!-- first depth  start-->

<!-- first depth end -->
<!-- second depth start-->
<div class="secondDepth" id="secondDepth">
<div class="blank" id="downloadText">이전 채팅 불러오기</div>
<div class="left-arrow-chat" id="left-arrow-chat"><img src="picture/left-arrow-chat.png" width="30px" height="30px"></div>
<div id="chatTitle">${param.area } 채팅방</div>
<div class="views">
<div class="chatTable">
<ul id="chatUl">

</ul>
</div>
</div>
<hr>
<div class="chatInput">
<div class="chatInputContent" id="pictureUpload"><img src="picture/plus-chat.png"></div><input type="text" class="chatInputContent" id="textInputBar" name="chatText"><div class="chatInputContent" id="sendButton">전송</div>
</div>
</div>
<!-- second depth end-->
<div>
</div>
</div>
<!-- chatBox end-->
<!-- uploadBox start-->
<div class="uploadBox" id="uploadBox">
<input type="file" id="picturefile" name="picturefile" onchange="getThumbnailPrivew(this,$('#cma_image'))">
<div id="cma_image"></div>
<button id="uploadExit">나가기</button>
<button id="register">사진 업로드</button>
</div>
</body>
<script type="text/javascript">

var sid = $('#SID').val(); //세션에서 얻어온다
var area = $('#area').val();//세션에서 얻어온다
var rank = $('#rank').val();//세션에서 얻어온다

var openURL = 'ws://192.168.0.10:8080/broadCasting?area='+area+'&SID='+sid+'&rank='+rank;	
var openSocket = new WebSocket(openURL);

openSocket.onopen = function(event){	
	onOpens(event);
}
function onOpens(event){	
	$('#chatUl').append('<li>채팅방 입장</li>');
}
 
openSocket.onmessage = function(event){
	onMessage(event);
}
function onMessage(event){	
	var slash = event.data.split(':tastakerChattingSlash:');
	var id = slash[0];
	var message = slash[1];
	var time = slash[2];
	var rank = slash[3];
	var IMG_FORMAT = "\.(bmp|gif|jpg|jpeg|png)$";
	var date = new Date();
	
	if(id == sid){//나의 채팅
		if((new RegExp(IMG_FORMAT, "i")).test(message)){//사진
			$('#chatUl').append("<li class='myChatSide'><span class='myChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+id+" : </span><img src='/resources/webSocket/photo/"+message+"' width='150px' height='150px'>"+time+"</span></li><br>");		}else{//텍스트
			$('#chatUl').append("<li class='myChatSide'><span class='myChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+id+" : </span>"+message+" "+time+"</span></li><br>");
		}
		
	}
	else{//상대 채팅
		if((new RegExp(IMG_FORMAT, "i")).test(message)){//사진
			$('#chatUl').append("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+id+" : </span><img src='/resources/webSocket/photo/"+message+"' width='150px' height='150px'> "+time+" </span></li><br>");			
		}else{//텍스트
			$('#chatUl').append("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+id+" : </span>"+message+" "+time+" </span></li><br>");
		}
		
	}
	
	
	$(".chatTable").scrollTop($(".chatTable")[0].scrollHeight);
};
openSocket.onclose = function(event){
	onClose(event);
}
function onClose(event){	
	
};
openSocket.onerror = function(event){
	onError(event);
}
function onError(event){
	
}

$('#left-arrow-chat').click(function(){ //해당 채팅방에서 나간다
	history.go(-1);
});

//업로드 화면 열기
$('#pictureUpload').click(function(){
	var uploadBox = document.getElementById('uploadBox')
	if(uploadBox.style.display == 'none'){
		
		uploadBox.style.display = 'block';
		uploadBox.style.position = 'absolute';
		uploadBox.style.top = '10px';
		uploadBox.style.left = '10px';
		uploadBox.style.width = '470px';
		uploadBox.style.height = '400px';
	}else{
		uploadBox.style.display = 'none'
	}
});


//업로드 화면 닫기
$('#uploadExit').click(function(){
	var uploadBox = document.getElementById('uploadBox');
if(uploadBox.style.display == 'block'){
		
		uploadBox.style.display = 'none';
	}else{
		uploadBox.style.display = 'block'
	}
});

//채팅전송 클릭
$('#sendButton').click(function(){
	var text = $('#textInputBar').val();	
	openSocket.send(text);
	/* $('#chatUl').append('<li class="myChatSide"><span class="myChatBox"><span class="myChatId"><img src="picture/'+rank+'.png">'+sid+' : </span>'+text+'</span></li><br>'); */
	document.getElementById('textInputBar').value = '';
	$(".chatTable").scrollTop($(".chatTable")[0].scrollHeight);
});
//채팅전송 엔터
$('#textInputBar').keypress(function(event){
	if(event.which == 13){	
		var text = $('#textInputBar').val();		
		openSocket.send(text);
		/* $('#chatUl').append('<li class="myChatSide"><span class="myChatBox"><span class="myChatId"><img src="picture/'+rank+'.png">'+sid+' : </span>'+text+'</span></li><br>'); */
		document.getElementById('textInputBar').value = '';
		$(".chatTable").scrollTop($(".chatTable")[0].scrollHeight);
	}
});

//업로드
$('#register').click(function(){
	var files = document.getElementById('picturefile').files[0];	
	if(files.type.match("image")&&files.size<5*1024*1024){
		openSocket.send('tastyPictureUpload:'+files.name);	
	    var reader = new FileReader();
	    var rawData = new ArrayBuffer(6000);
	    reader.loadend = function() {		
		
	    }
	    reader.onload = function(e) {	    	
	    	rawData = e.target.result;
	        openSocket.send(rawData);  
	        openSocket.send('tastyPictureUploads');        
	    }
	    
	    reader.readAsArrayBuffer(files);
	    /* $('#chatUl').append('<li class="myChatSide"><span class="myChatBox"><span class="myChatId"><img src="picture/'+rank+'.png">'+sid+' : </span>'+'<img src = "../resources/photo/'+files.name+'" width = "150px" height = "150px"">'+'</span></li><br>'); */
	    
		uploadBox.style.display = 'none';
		$(".chatTable").scrollTop($(".chatTable")[0].scrollHeight);
	}else{
		alert("5MB 이내의 사진 파일만 올리세요");
		return false
	}
	
});

function getThumbnailPrivew(html, $target) {	
    if (html.files && html.files[0] && html.files[0].type.match("image") &&html.files[0].size<5*1024*1024) {
        var reader = new FileReader();
        reader.onload = function (e) {           
            $target.html('<img src="' + e.target.result + '" border="0" alt="" width ="470px" height ="350px"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }else{    	
    	alert("5MB 이내의 사진 파일만 올리세요");
    	return false;
    }
}
$('#downloadText').click(function(){
	alert("이전 채팅은 상대방과 자신의 채팅이 구별되지 않습니다")
	var date = new Date();
	var today = convertDate(date);
	var area = $('#area').val();
	var fileNm = today+area;
	var fullFile = fileNm+'.txt';
    $.ajax({      
        type:"GET",  
        url:"searchTxtFile.jsp?fileNm="+fullFile,        
        success:function(args){   
            $("#chatUl").append(args);
            $(".chatTable").scrollTop($(".chatTable")[0].scrollHeight);
        },         
        error:function(e){  
            alert("기록이 존재하지 않거나 오류가 발생하였습니다");  
        }  
    }); 
	
});

function convertDate(date) {
	  var yyyy = date.getFullYear().toString();
	  var mm = (date.getMonth()+1).toString();
	  var dd  = date.getDate().toString();

	  var mmChars = mm.split('');
	  var ddChars = dd.split('');

	  return yyyy + '' + (mmChars[1]?mm:"0"+mmChars[0]) + '' + (ddChars[1]?dd:"0"+ddChars[0]);
	}

</script>
</html>