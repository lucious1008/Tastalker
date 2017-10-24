<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
/* 검색영역 */
.searchArea{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px;
	border: 1px solid #b5121b;
}
.search{margin: 10px 35px;}
.headerDate{
	font-size: 15px;
}
/* 결과영역 */
#resultArea{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px;
	border: 1px solid #b5121b;
}
.list{
	margin: 20px 35px;
}
table {
	width: 90%;
}
/* 결과테이블 앵커 */
.tableA:LINK{color: #000000; text-decoration: none;font-size: 15px;}
.tableA:VISITED{color: #6f6f6f}
.tableA:ACTIVE{color: #000000}
.tableA:FOCUS{color: #000000}
/* ------------- */
/* 페이징 앵커 */
.bodyContent:LINK{color: #000000; text-decoration: none;font-size: 19px;}
.bodyContent:VISITED{color: #000000}
.bodyContent:ACTIVE{color: #000000}
.bodyContent:FOCUS{color: #000000}
.bodyContent{margin: 1px;}

/* ------------- */
table tr:NTH-CHILD(1):HOVER{
	background-color: #ffffff;
}
table tr:HOVER{
	background-color: #e6e6e6;
}
table tr th{
	border-bottom: 1px solid;
}
table tr td{
	text-align: center; font-size: 15px; cursor: pointer;
	height: 25px;
}
.paging{text-align:center; margin-top: 10px; cursor: pointer;}
#number{color: #b5121b;}
</style>
<title>Insert title here</title>
</head>
<body onload="onload()">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/admin/headerFooter/header.jsp"/>
	<section class="searchArea">
		<h3>[채팅검색]</h3>
		<article class="search">
			<form action="/admin/15-1.do">
				<span class="headerDate">날짜입력</span>
				<input type="date"  id="startDate" name="startDate">~<input type="date" id="endDate"  name="endDate">
				<select id="area" name="area">
					<option value="">선택</option>
					<option value="도봉구">도봉구</option>
					<option value="노원구">노원구</option>
					<option value="강북구">강북구</option>
					<option value="은평구">은평구</option>
					<option value="성북구">성북구</option>
					<option value="중량구">중량구</option>
					<option value="종로구">종로구</option>
					<option value="서대문구">서대문구</option>
					<option value="동대문구">동대문구</option>
					<option value="마포구">마포구</option>
					<option value="중구">중구</option>
					<option value="성동구">성동구</option>
					<option value="용산구">용산구</option>
					<option value="광진구">광진구</option>
					<option value="강서구">강서구</option>
					<option value="양천구">양천구</option>
					<option value="영등포구">영등포구</option>
					<option value="구로구">구로구</option>
					<option value="금천구">금천구</option>
					<option value="동작구">동작구</option>
					<option value="관악구">관악구</option>
					<option value="서초구">서초구</option>
					<option value="강남구">강남구</option>
					<option value="송파구">송파구</option>
					<option value="강동구">강동구</option>
				</select>				
				<input type="hidden" name="pageNum" value="1">
				<input type="submit" onclick="return search()" value="검색">
			</form>
		</article>
	</section>
	<section id="resultArea">
		<h3>[채팅기록목록]</h3>	
		<article class="list">
			<table id="table">
			<fmt:parseNumber var="totalPage" value="${(totalNum-1)/3+1 }" integerOnly="true" />
			<fmt:parseNumber var="firstPage" value="${((pageNum-1)/5) }" integerOnly="true" />			
			<c:forEach items="${logSet}" var="set" varStatus="i">
			<c:if test="${i.count>=(pageNum-1)*3+1 && i.count<=pageNum*3}">
			<tr><td><a href="/admin/16.do?titles=${set }">${set }</a></td></tr>
			</c:if>
			</c:forEach>
			</table>
			<div class="paging" id="paging">
			<c:if test="${pageNum>1 }">
			<a href="/admin/15-1.do?pageNum=1&startDate=${startDate}&endDate=${endDate}&area=${area}">◀</a>			
			</c:if>
			<c:if test="${pageNum>1 }">
			<a href="/admin/15-1.do?pageNum=${pageNum-1 }&startDate=${startDate}&endDate=${endDate}&area=${area}">◁</a>
			</c:if>
			<c:forEach begin="${firstPage*5 + 1 }" end="${firstPage*5 + 5 }" varStatus="i">
			<c:if test="${i.current<=totalPage }"><a href="/admin/15-1.do?pageNum=${i.current }&startDate=${startDate}&endDate=${endDate}&area=${area}">${i.current }</a></c:if>			
			</c:forEach>
			<c:if test="${pageNum<totalPage }">
			<a href="/admin/15-1.do?pageNum=${pageNum+1 }&startDate=${startDate}&endDate=${endDate}&area=${area}">▷</a>
			</c:if>
			<c:if test="${pageNum<totalPage }">
			<a href="/admin/15-1.do?pageNum=${totalPage }&startDate=${startDate}&endDate=${endDate}&area=${area}">▶</a>
			</c:if>				
			</div>			
		</article>
		
	</section>
	<jsp:include page="/WEB-INF/views/admin/headerFooter/footer.jsp"/>
<script>
function search(){
	var start = document.getElementById("startDate").value;
	var end = document.getElementById("endDate").value;
	var area = document.getElementById("area");
	var areaRe = area.options[area.selectedIndex].value;
	var startDate = new Date(start);
	var endDate = new Date(end);

	if(start == "" && end == "" && areaRe == "none" ){
		alert("검색기간 또는 검색지역을 입력해 주세요.");
		return false;
	}else if(start != "" && end == "" && areaRe == "none"){
		alert("검색 마지막 날짜를 입력해 주세요.");
		document.getElementById("endDate").focus();
		return false;
	}else if(start == "" && end != "" && areaRe == "none" ){
		alert("검색 시작 날짜를 입력해 주세요.");
		document.getElementById("startDate").focus();
		return false;
	}else if(startDate > endDate){
		alert("검색 마지막 날짜가 시작날짜보다 빠릅니다.");
		document.getElementById("startDate").focus();
		return false;
	}else if(startDate > new Date() || endDate > new Date()){
		alert("검색 날짜를 확인해 주세요.");
		document.getElementById("startDate").focus();
		return false;
	}
	
	
}


</script>
</body>
</html>