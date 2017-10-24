<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
/* 검색영역 */
.searchArea{
	width: 920px;
	height: 85px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px;
	border: 1px solid #b5121b;
}
.search{margin: 10px 35px;}
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
table tr:NTH-CHILD(1):HOVER{
	background-color: #ffffff;
}
table tr:HOVER{
	background-color: #e6e6e6;
}
table tr th{
	border-bottom: 1px solid;
	height: 25px
}
table tr td{
	text-align: center; font-size: 15px; cursor: pointer;height: 25px
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
/* ------------- */
.id{width: 130px;}
.name{width: 100px;}
.gender{width: 40px;}
.grade{width: 70px;}
.email{width: 240px;}
.address{width: 275px;}
.paging{text-align: center;margin-top: 10px; cursor: pointer;}
#number{color: #b5121b;}


.paging {
	margin-top: 15px;
	text-align: center;
	font-size: 0;
	margin-bottom: 5px;
	color: #000000;
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
	color: #000000;
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
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/admin/headerFooter/header.jsp"/>	
	<section class="searchArea">
		<h3>[회원검색]</h3>
		<article class="search">
			<form action="/admin/5-1.do">
				<input type="radio" name="searchType" value="userId" checked onclick="radChng()"><span>회원ID</span>
				<input type="radio" name="searchType" value="userNm" onclick="radChng2()"><span>이름</span>
				<input type="text"  name="userId">				
				<input type="hidden" name="nowPage" value="1"/>
				<input type="submit"  value="검색"><br/>
				<select class="Headergrade" name="userRank" id="userRank">
					<option value="0">등급</option>
					<option value="1">브론즈</option>
					<option value="2">실버</option>
					<option value="3">골드</option>
					<option value="4">플레티넘</option>
					<option value="5">다이아몬드</option>
				</select>
				<select class="headerAddress" name="userAdrStr" id="userAdrStr">
					<option value="">구 선택</option>
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
				<select class="headerGender" name="userGender" id="userGender">
					<option value="">성별 </option>
					<option value="M">남자</option>
					<option value="F">여자</option>
				</select>
			</form>
		</article>
	</section>
	<section id="resultArea">
		<h3>[회원목록]</h3>
		<article class="list">
				<c:choose>
					<c:when test="${list eq null }">
							<p>등록된 정보가 없습니다.</p>
					</c:when>
					<c:otherwise>
						<table class="table-hover">
							<tr>
								<th class="id">회원ID</th><th class="name">이름</th><th class="gender">성별</th><th class="grade">등급</th>
								<th class="email">이메일</th><th class="address">주소</th>
							</tr>
						<c:forEach items="${list }" var="list">
							<tr>
								<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">${list.userId }</a></td>
								<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">${list.userNm }</a></td>
								<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">${list.userGender }</a></td>
								<c:choose>
									<c:when test="${list.userRank eq 0 }">
										<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">관리자</a></td>
									</c:when>
									<c:when test="${list.userRank eq 1 }">
										<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">브론즈</a></td>
									</c:when>
									<c:when test="${list.userRank eq 2 }">
										<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">실버</a></td>
									</c:when>
									<c:when test="${list.userRank eq 3 }">
										<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">골드</a></td>
									</c:when>
									<c:when test="${list.userRank eq 4 }">
										<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">플래티넘</a></td>
									</c:when>
									<c:otherwise>
										<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">다이아몬드</a></td>
									</c:otherwise>
								</c:choose>
								<td><a href="/admin/6.do?userId=${list.userId }" class="tableA">${list.userEmail }</a></td>
								<td><a href="/admin/6.do?userId=${list.userId }"  class="tableA">${list.userAdrStr }</a></td>
							</tr>
						</c:forEach>
						</table>
					<div class="paging">					
					<%
									
					int totalReportNum = ((Integer)request.getAttribute("totalListNum")).intValue(); 
					
					int maxPage = (totalReportNum - 1)/3 + 1 ;
					int nowPage = ((Integer)request.getAttribute("nowPage")).intValue();
					
					
					int pageStart = (nowPage-1)/5+1;
					
					int	pageLast = pageStart + 4;
					%>
		<a href="/admin/5-1.do?nowPage=1&userGender=${userGender }&userAdrStr=${userAdrStr}&userRank=${userRank}&userNm=${userNm}&userId=${userId}" class="direction first"></a>
					<%if(nowPage != 1 ){%>
					<a href="/admin/5-1.do?nowPage=<%=nowPage-1%>&userGender=${userGender }&userAdrStr=${userAdrStr}&userRank=${userRank}&userNm=${userNm}&userId=${userId}" class="direction prev"></a>
					<%}%>
					<%
					for(int i = pageStart; i <= pageLast; i++){ 
						if(i > maxPage){
							break;
						}
					%>
					<a href="/admin/5-1.do?nowPage=<%= i %>&userGender=${userGender }&userAdrStr=${userAdrStr}&userRank=${userRank}&userNm=${userNm}&userId=${userId}"><%= i %></a>
					<%
					}
					%>
					<%if(nowPage != maxPage ){%>
					<a href="/admin/5-1.do?nowPage=<%=nowPage+1%>&userGender=${userGender }&userAdrStr=${userAdrStr}&userRank=${userRank}&userNm=${userNm}&userId=${userId}" class="direction next"></a>
					<%}%>
					<a href="/admin/5-1.do?nowPage=<%=maxPage%>&userGender=${userGender }&userAdrStr=${userAdrStr}&userRank=${userRank}&userNm=${userNm}&userId=${userId}" class="direction last"></a>

				</div>
				</c:otherwise>
			</c:choose>	
		</article>
	</section>
	<jsp:include page="/WEB-INF/views/admin/headerFooter/footer.jsp"/>

<script>

	function radChng(){		
		$('input[name="userNm"]').attr('name','userId');						
	}
	function radChng2(){		
		$('input[name="userId"]').attr('name','userNm');
	}
	function nextPage(page,last, now){
		
		var da = ${sumPage};
		var da01 = da/3;
		var last = Math.ceil(da01);
		
		switch (page) {
		case 0:
			var add = now + 1;
			if((last+1) == add)
				alert("마지막 페이지입니다.");
			else
				location.href="/admin/5-2.do?loPage="+add+"&flag=0";
			break;
		case 1:
			if((last) == now)
				alert("마지막 페이지입니다.")
			else
				location.href="/admin/5-2.do?loPage="+last+"&flag=2";
			break;
		case 2:
			var add = now - 1;
			if(1 > add)
				alert("첫 페이지입니다.")
			else
				location.href="/admin/5-2.do?loPage="+add+"&flag=1";
			break;
		case 3:
			if(1 == now)
				alert("첫 페이지입니다.")
			else
				location.href="/admin/5-2.do?loPage="+1+"&flag=0";
			break;
		}	
	}
	function nextSearchPage(page,last, now) {
		
		var userId = "${searchVal.userId}";
		var userNm = "${searchVal.userNm}";
		var userAdrStr = "${searchVal.userAdrStr}";
		var userGender= "${searchVal.userGender }";
		
		
		var da = ${sumPage};
		var da01 = da/3;
		var last = Math.ceil(da01);
		
		switch (page) {
		case 0:
			var add = now + 1;
			if((last+1) == add)
				alert("마지막 페이지입니다.");
			else
				location.href="/admin/5-4.do?loPage="+add+"&flag=0&userId="+userId+"&userNm="+userNm+"&userAdrStr="+userAdrStr+"&userGender="+userGender;
			break;
		case 1:
			if((last) == now)
				alert("마지막 페이지입니다.")
			else
				location.href="/admin/5-4.do?loPage="+last+"&flag=2&userId="+userId+"&userNm="+userNm+"&userAdrStr="+userAdrStr+"&userGender="+userGender;;
			break;
		case 2:
			var add = now - 1;
			if(1 > add)
				alert("첫 페이지입니다.")
			else
				location.href="/admin/5-4.do?loPage="+add+"&flag=1&userId="+userId+"&userNm="+userNm+"&userAdrStr="+userAdrStr+"&userGender="+userGender;;
			break;
		case 3:
			if(1 == now)
				alert("첫 페이지입니다.")
			else
				location.href="/admin/5-4.do?loPage="+1+"&flag=0&userId="+userId+"&userNm="+userNm+"&userAdrStr="+userAdrStr+"&userGender="+userGender;;
			break;
		}
	}
</script>
</body>
</html>