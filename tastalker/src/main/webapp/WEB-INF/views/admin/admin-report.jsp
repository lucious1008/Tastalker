<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
/* 결과영역 */
#resultArea{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px;
	border: 1px solid #b5121b;
}
.subTitle{
	width: 100%;
	height: 30px;
	overflow: hidden;
}
h3{float: left;}
.reportStatu{
	float:right;
	margin: 2px;
}
#list{
	margin: 20px 35px;
}
/* table {
	height:258px;
} */
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
	border-bottom: 1px solid; height: 25px
}
table tr td{
	text-align: center; font-size: 15px; cursor: pointer;
	height: 25px;
}
.no{width: 130px;}
.name{width: 150px;}
.reporter{width: 132px;}
.statu{width: 194px;}
.date{width: 240px;}
.paging{text-align: center;margin-top: 10px; cursor: pointer;}
#number{color: #b5121b;}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/admin/headerFooter/header.jsp"/>
	<section id="resultArea">
		<article class="subTitle">
			<h3>[제보목록]</h3>
			<select class="reportStatu" name="reportStut" onchange="showStatus(this.value,1)">
				<option value="3">전체</option>
				<option value="0" <c:if test="${reportStatus eq 0}">selected</c:if> >대기중</option>
				<option value="1" <c:if test="${reportStatus eq 1}">selected</c:if>>승인</option>
				<option value="2" <c:if test="${reportStatus eq 2}">selected</c:if>>거부</option>
			</select>
		</article>
		<article id="list">
			<c:choose>
				<c:when test="${report eq null }">
					<p>등록된 정보가 없습니다.</p>
				</c:when>
				<c:otherwise>
					<table>
						<tr>
							<th class="no">NO.</th><th class="name">상호명</th><th class="reporter">제보자</th><th class="statu">제보상태</th>
							<th class="date">제보일자</th>
						</tr>
						<c:forEach items="${report }" var="report">
							<tr>
								<td><a href="/admin/12.do?reportNum=${report.reportNum }" class="tableA">${report.reportNum }</a></td>
								<td><a href="/admin/12.do?reportNum=${report.reportNum }" class="tableA">${report.reportNm }</a></td>
								<td><a href="/admin/12.do?reportNum=${report.reportNum }" class="tableA">${report.reportUser }</a></td>
								<c:choose>
									<c:when test="${report.reportStatus eq 0 }">
										<td><a href="/admin/12.do?reportNum=${report.reportNum }" class="tableA">대기중</a></td>
									</c:when>
									<c:when test="${report.reportStatus eq 1 }">
										<td><a href="/admin/12.do?reportNum=${report.reportNum }" class="tableA">승인</a></td>
									</c:when>
									<c:otherwise>
										<td><a href="/admin/12.do?reportNum=${report.reportNum }" class="tableA">거부</a></td>
									</c:otherwise>
								</c:choose>
								<td><a href="/admin/12.do?reportNum=${report.reportNum }" class="tableA"><fmt:formatDate value="${report.reportReg }" pattern="yyyy-MM-dd HH:mm"/>
								</a></td>
							</tr>
						</c:forEach>
					</table>
					<div class="paging">
						<c:choose>
							<c:when test="${searchVal eq null }">
								<c:if test="${1 ne nowPage }">
									<a href="#" onclick="nextPage(3,${sumPage},${nowPage })" class="bodyContent">&lt;&lt;</a> 
									<a href="#" onclick="nextPage(2,${sumPage},${nowPage })" class="bodyContent"> &lt;</a>
								</c:if>
								<c:forEach begin="${firstPage }" end="${lastPage }" var="i">
									<c:choose>
										<c:when test="${i eq pageNum }">
											<a href="/admin/10-1.do?pageNum=${i }" class="bodyContent" id="number">${i }</a>
										</c:when>
										<c:otherwise>
											<a href="/admin/10-1.do?pageNum=${i }" class="bodyContent">${i }</a>
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
									<a href="#" onclick="nextSearchPage(3,${sumPage},${nowPage },${reportStatus})" class="bodyContent">&lt;&lt;</a> 
									<a href="#" onclick="nextSearchPage(2,${sumPage},${nowPage },${reportStatus})" class="bodyContent"> &lt;</a>
								</c:if>
								<c:forEach begin="${firstPage }" end="${lastPage }" var="i">
									<c:choose>
										<c:when test="${i eq pageNum }">
											<a href="/admin/11.do?pageNum=${i }&reportStatus=${reportStatus}" class="bodyContent" id="number">${i }</a>
										</c:when>
										<c:otherwise>
											<a href="/admin/11.do?pageNum=${i }&reportStatus=${reportStatus}" class="bodyContent">${i }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pagingSum  ne nowPage  }">
									<a href="#" onclick="nextSearchPage(0,${sumPage},${nowPage },${reportStatus})" class="bodyContent">&gt;</a>
									<a href="#" onclick="nextSearchPage(1,${sumPage},${nowPage },${reportStatus})" class="bodyContent">&gt;&gt;</a>
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
function nextPage(page,last, now){
	var pageNum = ${pageNum}
	var da = ${sumPage};
	var da01 = da/3;
	var last = Math.ceil(da01);
	
	switch (page) {
	case 0:
		var add = now+1;
		if((last+1) == add)
			alert("마지막 페이지입니다.");
		else
			location.href="/admin/10-2.do?loPage="+add+"&flag=0";
		break;
	case 1:
		if((last) == now)
			alert("마지막 페이지입니다.")
		else
			location.href="/admin/10-2.do?loPage="+last+"&flag=2";
		break;
	case 2:
		var add = now - 1;
		if(1 > add)
			alert("첫 페이지입니다.")
		else
			location.href="/admin/10-2.do?loPage="+add+"&flag=1";
		break;
	case 3:
		if(1 == now)
			alert("첫 페이지입니다.")
		else
			location.href="/admin/10-2.do?loPage="+1+"&flag=0";
		break;
	}	
}
function nextSearchPage(page,last, now,status) {
	var da = ${sumPage};
	var da01 = da/3;
	var last = Math.ceil(da01);
	switch (page) {
	case 0:
		var add = now + 1;
		if((last+1) == add)
			alert("마지막 페이지입니다.");
		else
			location.href="/admin/11-2.do?loPage="+add+"&reportStatus="+ status +"&flag=0";
		break;
	case 1:
		if(last == now)
			alert("마지막 페이지입니다.")
		else
			location.href="/admin/11-2.do?loPage="+last+"&reportStatus="+ status +"&flag=2";
		break;
	case 2:
		var add = now - 1;
		if(1 > add)
			alert("첫 페이지입니다.")
		else
			location.href="/admin/11-2.do?loPage="+add+"&reportStatus="+ status+"&flag=1";
		break;
	case 3:
		if(1 == now)
			alert("첫 페이지입니다.")
		else
			location.href="/admin/11-2.do?loPage="+1+"&reportStatus="+ status+"&flag=0";
		break;
	}
}
function showStatus(val,page) {
	if(val==3)
		location.href = "/admin/10.do?pageNum=1";
	else
		location.href = "/admin/11.do?reportStatus="+ val + "&pageNum="+page;

}


</script>
</body>
</html>