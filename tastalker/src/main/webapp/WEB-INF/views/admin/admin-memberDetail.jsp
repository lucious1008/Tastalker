<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.joinArea{
	width: 920px;
	background-color: white;
	margin: 10px auto;
	padding: 10px 20px;
	border: 1px solid #b5121b;
}
.list{
	margin: 20px 100px;
}
table {
	height:258px;
	margin: 0 auto;
}
table tr td{
	text-align: center; font-size: 15px; cursor: pointer; width: 120px;
}
.content{width: 300px;}
.buttons{text-align: center;}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/admin/headerFooter/header.jsp"/>
	
	<section class="joinArea">
		<h3>테이스토커 회원정보수정</h3>
		<form action="/admin/8.do">
		<article class="list">
			<table>
		
				<tr>
					<td>아이디</td><td class="content">${selectOne.userId }</td>
				</tr>
				<tr>
					<td>이름</td><td>${ selectOne.userNm}</td>
				</tr>
				<tr>
					<td>성별</td><td>${ selectOne.userGender}</td>
				</tr>
				<tr>
					<td>주소</td><td>${selectOne.userAdrStr }</td>
				</tr>
				<tr>
					<td>이메일</td><td>${selectOne.userEmail }</td>
				</tr>
				<tr>
					<td>등급</td>
					<td>
						<select class="grade" name="userRank">
							<option value="0" <c:if test="${selectOne.userRank eq 0 }">selected</c:if>>관리자</option>
							<option value="1" <c:if test="${selectOne.userRank eq 1 }">selected</c:if>>브론즈</option>
							<option value="2" <c:if test="${selectOne.userRank eq 2 }">selected</c:if>>실버</option>
							<option value="3" <c:if test="${selectOne.userRank eq 3 }">selected</c:if>>골드</option>
							<option value="4" <c:if test="${selectOne.userRank eq 4 }">selected</c:if>>플레티넘</option>
							<option value="5" <c:if test="${selectOne.userRank eq 5 }">selected</c:if>>다이아몬드</option>
						</select>
						<span>${selectOne.userPoint }</span>
					</td>
				</tr>
			</table>	
		</article>
		<article class="buttons">
			<input type ="hidden" name="userId" value="${selectOne.userId }">
			<button type="submit" class="modify">수정</button>
			<button type="button" class="delete" onclick="mdel('${selectOne.userId }')" >삭제</button>
			<button type="button" class="cancel" onclick="cencal()">취소</button>
		</article>
		</form>
	</section>
	
	
	<jsp:include page="/WEB-INF/views/admin/headerFooter/footer.jsp"/>
<script>
function mdel(l){
	var result = confirm("회원정보를 삭제하시겠습니까?");
	if(result){
		location.href="/admin/9.do?userId="+l;
	}
}
function cencal() {
	history.back();
}
</script>
</body>
</html>