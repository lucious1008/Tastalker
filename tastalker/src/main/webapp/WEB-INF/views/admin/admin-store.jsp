<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
.searchName{font-size: 15px;}
/* 검색결과영역 */
#resultArea{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px;
	border: 1px solid #b5121b;
}
.list{
	margin: 20px 80px;
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
}
.num{width: 130px;}
.seperate{width: 100px;}
.resultStoreName{width: 240px;}
.storeAddress{width: 275px;}
.paging{text-align: center;margin-top: 10px; cursor: pointer;}
#number{color: #b5121b;}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/admin/headerFooter/header.jsp"/>
	<section class="searchArea">
		<h3>[맛집검색]</h3>
		<article class="search">
			<form action="/admin/1-5.do">
				<select class="cate" name="gourmetSort" id="sort">
					<option value="0">대분류 </option>
					<option value="1">치킨</option>
					<option value="2">피자</option>
					<option value="3">중국집</option>
					<option value="4">양식</option>
					<option value="5">한식/분식</option>
					<option value="6">회/일식</option>
					<option value="7">족발/보쌈</option>
					<option value="8">도시락</option>
					<option value="9">패스트푸드</option>
				</select>
				<select class="address" name="gourmetAdrStr" id="adrGu">
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
				<input type="text" placeholder="동을 입력하세요" name="address" id="adrGuText">
				<span class="searchName">상호명 :</span> <input type="text" name="gourmetNm" id="storeNm">
				<input type="hidden" name="pageNum" value="1"/>
				<input type="submit" onclick="srch(); return false" value="검색"><br/>
			</form>
		</article>
	</section>
	<section id="resultArea">
		<h3>[맛집목록]</h3>
		<article class="list">
			<c:choose>
				<c:when test="${gourmet eq null }">
					<p>등록된 맛집이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<table>
						<tr>
							<th class="num">맛집번호</th><th class="seperate">대분류</th><th class="resultStoreName">상호명</th><th class="storeAddress">주소</th>
						</tr>
						<c:forEach items="${gourmet }" var="i">
							<tr>
								
								<td>
									<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">${i.gourmetNum }</a>
								</td>
								<c:choose>
									<c:when test="${i.gourmetSort eq 1 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">치킨</a>
										</td>
									</c:when>
									<c:when test="${i.gourmetSort eq 2 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">피자</a>
										</td>
									</c:when>
									<c:when test="${i.gourmetSort eq 3 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">중식</a>
										</td>
									</c:when>
									<c:when test="${i.gourmetSort eq 4 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">양식</a>
										</td>
									</c:when>
									<c:when test="${i.gourmetSort eq 5 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">한식/분식</a>
										</td>
									</c:when>
									<c:when test="${i.gourmetSort eq 6 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">회/일식</a>
										</td>
									</c:when>
									<c:when test="${i.gourmetSort eq 7 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">족발/보쌈</a>
										</td>
									</c:when>
									<c:when test="${i.gourmetSort eq 8 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">도시락</a>
										</td>
									</c:when>
									<c:when test="${i.gourmetSort eq 9 }">
										<td>
											<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">패스트푸드</a>
										</td>
									</c:when>
								</c:choose>
								<td>
									<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">${i.gourmetNm }</a>
								</td>
								<td>
									<a href="/admin/4.do?gourmetNum=${i.gourmetNum }&pageNum=${pageNum}" class="tableA">${i.gourmetAdrStr }</a>
								</td>
							</tr>
						
						</c:forEach>
					
					</table>
					<div class="paging">
						 <c:choose> 
						 	<c:when test="${searchVal eq null }">
						 		<c:if test="${1  ne nowPage  }">
						 			<a href="#" onclick="nextPage(3,${sumPage},${nowPage })" class="bodyContent">&lt;&lt;</a> 
									<a href="#" onclick="nextPage(2,${sumPage},${nowPage })" class="bodyContent"> &lt;</a>
								</c:if>
								<c:forEach var="i" begin="${firstPage }" end="${lastPage }">
									<c:choose>
										<c:when test="${i eq pageNum }">
											<a href="/admin/1-1.do?pageNum=${i }" class="bodyContent" id = "number">${i}</a>
										</c:when>
										<c:otherwise>
											<a href="/admin/1-1.do?pageNum=${i }" class="bodyContent">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pagingSum  ne nowPage  }">
									<a href="#" onclick="nextPage(0,${sumPage},${nowPage })" class="bodyContent">&gt;</a>
									<a href="#" onclick="nextPage(1,${sumPage},${nowPage })" class="bodyContent">&gt;&gt;</a>
								</c:if>
							</c:when>
							
							<c:otherwise>
								<c:if test="${1 ne nowPage }">
									<a href="#" onclick="nextSearchPage(3,${sumPage},${nowPage })" class="bodyContent">&lt;&lt;</a> 
									<a href="#" onclick="nextSearchPage(2,${sumPage},${nowPage })" class="bodyContent"> &lt;</a>
								</c:if>
								<c:forEach var="i" begin="${firstPage }" end="${lastPage }">
									<c:choose>
										<c:when test="${i eq pageNum }">
											<a href="/admin/1-6.do?pageNum=${i }&gourmetSort=${searchVal.gourmetSort }&gourmetAdrStr=${searchVal.gourmetAdrStr}&gourmetAdrDong=${ address}&gourmetNm=${searchVal.gourmetNm }"  class="bodyContent" id="number">${i}</a>
										</c:when>
										<c:otherwise>
											<a href="/admin/1-6.do?pageNum=${i }&gourmetSort=${searchVal.gourmetSort }&gourmetAdrStr=${searchVal.gourmetAdrStr}&gourmetAdrDong=${ address}&gourmetNm=${searchVal.gourmetNm }"  class="bodyContent">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pagingSum  ne nowPage  }">
									<a href="#" onclick="nextSearchPage(0,${sumPage},${nowPage })" class="bodyContent">&gt;</a>
									<a href="#" onclick="nextSearchPage(1,${sumPage},${nowPage })" class="bodyContent">&gt;&gt;</a>
								</c:if>
								
							
							</c:otherwise>
						</c:choose>
					
					</div>
				
				</c:otherwise>
			</c:choose>
		</article>
	</section>
	<jsp:include page="/WEB-INF/views/admin/headerFooter/footer.jsp"/>
<script>
function srch(){
 	var guSelect = document.getElementById("adrGu");
	var dongText = document.getElementById("adrGuText").value;
	var storeText = document.getElementById("storeNm").value;
	var sortSlect = document.getElementById("sort");
	var sort_chk = null;
	var gu_chk = null;
	
	//대분류 값을 찾는다.
	for(i=0;i<sortSlect.length; i++){
		if(sortSlect[i].selected == true){
			sort_chk = sortSlect[i].value;
			break;
		}
	}
	//선택된 구의 값을 찾는다.
	for(i=0;i<guSelect.length; i++){
		if(guSelect[i].selected == true){
			gu_chk = guSelect[i].value;
			break;
		}
	}
	if(sort_chk == 0 && gu_chk == "null" && dongText == "" && storeText == ""){
		alert("검색어 또는 검색 조건을 입력해주세요");
	}else{
		form.submit();
	}
	
	
	
}
//페이징 꺽쇠 값
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
			location.href="/admin/1-2.do?loPage="+add+"&flag=0";
		break;
	case 1:
		if((last) == now)
			alert("마지막 페이지입니다.")
		else
			location.href="/admin/1-2.do?loPage="+last+"&flag=2";
		break;
	case 2:
		var add = now - 1;
		if(1 > add)
			alert("첫 페이지입니다.")
		else
			location.href="/admin/1-2.do?loPage="+add+"&flag=1";
		break;
	case 3:
		if(1 == now)
			alert("첫 페이지입니다.")
		else
			location.href="/admin/1-2.do?loPage="+1+"&flag=0";
		break;
	}	
}

function nextSearchPage(page,last, now) {
	
	var sort = "${searchVal.gourmetSort}";
	var adrGu = "${searchVal.gourmetAdrStr}";
	var adrDong = "${address}";
	var name= "${searchVal.gourmetNm }";
	
	
	var da = ${sumPage};
	var da01 = da/3;
	var last = Math.ceil(da01);
	
	switch (page) {
	case 0:
		var add = now + 1;
		if((last+1) == add)
			alert("마지막 페이지입니다.");
		else
			location.href="/admin/1-7.do?loPage="+add+"&flag=0&gourmetSort="+sort+"&gourmetAdrStr="+adrGu+"&address="+adrDong+"&gourmetNm="+name;
		break;
	case 1:
		if((last) == now)
			alert("마지막 페이지입니다.")
		else
			location.href="/admin/1-7.do?loPage="+last+"&flag=2&gourmetSort="+sort+"&gourmetAdrStr="+adrGu+"&address="+adrDong+"&gourmetNm="+name;
		break;
	case 2:
		var add = now - 1;
		if(1 > add)
			alert("첫 페이지입니다.")
		else
			location.href="/admin/1-7.do?loPage="+add+"&flag=1&gourmetSort="+sort+"&gourmetAdrStr="+adrGu+"&address="+adrDong+"&gourmetNm="+name;
		break;
	case 3:
		if(1 == now)
			alert("첫 페이지입니다.")
		else
			location.href="/admin/1-7.do?loPage="+1+"&flag=0&gourmetSort="+sort+"&gourmetAdrStr="+adrGu+"&address="+adrDong+"&gourmetNm="+name;
		break;
	}
}
</script>
</body>
</html>