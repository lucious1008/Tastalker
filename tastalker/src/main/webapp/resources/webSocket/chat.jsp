<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.divTable{
	margin-top:30px;
	display: table;
	width: 100%;
}
.close-lt-chat{
	position: absolute;
	left: 93%;
}
.divTableRow {
	display: table-row;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
}
.divTableCell, .divTableHead {
	height: 60px;
	display: table-cell;
	padding: 3px 10px;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}
.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}
.divTableBody {
	display: table-row-group;
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
	display: none;
}
.blank{
	color: white;
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
<title>test</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<body>
<input type="hidden" value="" id="area">
<!-- 470*400 가로 세로 -->
<div class="chatBox" id="chatBox">
<!-- first depth  start-->
<div class="firstDepth" id="firstDepth">
<div class="blank">맛있는 채팅 테이스토커!</div>
<div class="chatSelectLabel">채팅방 선택</div>
<div class="divTable">
<div class="divTableBody">
<div class="divTableRow">
<div class="divTableCell"><a href="chatBang.jsp?area=강남구&SID=${SID}&rank=${rank}">강남구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=강동구&SID=${SID}&rank=${rank}">강동구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=강북구&SID=${SID}&rank=${rank}">강북구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=강서구&SID=${SID}&rank=${rank}">강서구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=관악구&SID=${SID}&rank=${rank}">관악구</a></div>
</div>
<div class="divTableRow">
<div class="divTableCell"><a href="chatBang.jsp?area=광진구&SID=${SID}&rank=${rank}">광진구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=구로구&SID=${SID}&rank=${rank}">구로구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=금천구&SID=${SID}&rank=${rank}">금천구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=노원구&SID=${SID}&rank=${rank}">노원구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=도봉구&SID=${SID}&rank=${rank}">도봉구</a></div>
</div>
<div class="divTableRow">
<div class="divTableCell"><a href="chatBang.jsp?area=동대문구&SID=${SID}&rank=${rank}">동대문구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=동작구&SID=${SID}&rank=${rank}">동작구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=마포구&SID=${SID}&rank=${rank}">마포구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=서대문구&SID=${SID}&rank=${rank}">서대문구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=서초구&SID=${SID}&rank=${rank}">서초구</a></div>
</div>
<div class="divTableRow">
<div class="divTableCell"><a href="chatBang.jsp?area=성동구&SID=${SID}&rank=${rank}">성동구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=성북구&SID=${SID}&rank=${rank}">성북구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=송파구&SID=${SID}&rank=${rank}">송파구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=양천구&SID=${SID}&rank=${rank}">양천구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=영등포구&SID=${SID}&rank=${rank}">영등포구</a></div>
</div>
<div class="divTableRow">
<div class="divTableCell"><a href="chatBang.jsp?area=용산구&SID=${SID}&rank=${rank}">용산구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=은평구&SID=${SID}&rank=${rank}">은평구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=종로구&SID=${SID}&rank=${rank}">종로구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=중구&SID=${SID}&rank=${rank}">중구</a></div>
<div class="divTableCell"><a href="chatBang.jsp?area=중랑구&SID=${SID}&rank=${rank}">중랑구</a></div>
</div>
</div>
</div>
</div>
<!-- first depth end -->
<!-- second depth start-->

<!-- second depth end-->
<div>
</div>
</div>
<!-- chatBox end-->
<!-- uploadBox start-->

</body>
</html>