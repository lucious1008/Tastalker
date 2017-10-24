<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.resultArea{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px;
	border: 1px solid #b5121b;
	overflow: hidden;
	
}
.topArea{
	overflow: hidden;
}
.topTitle{float: left}
.subTitle{float: right;}
.bodyContent{
	width: 100%;
	height: 300px;
	background-color: #ffe6e6;
	overflow: scroll;
}
.buttons{text-align: center;margin: 10px;}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/admin/headerFooter/header.jsp"/>
	<section class="resultArea">
		<article class="topArea">
			<h3 class="topTitle">${title } 채팅방</h3>
			<h4 class="subTitle">채팅방 등록일자: ${date }</h4>
		</article>
		<article class="bodyContent">
			<c:forEach items="${content }" var="i">
				${i }
			
			</c:forEach>
			
		</article>
	</section>
	<article class="buttons">
			<form>
				<button type="button" class="modify" onclick="confirm()">확인</button>
			</form>
		</article>
	<jsp:include page="/WEB-INF/views/admin/headerFooter/footer.jsp"/>
<script>
function confirm(){
	history.back();
}
</script>
</body>
</html>