<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	font: 19px arial;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
	background-color: #f2f2f2;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
.menuUl :LINK{color: #fff; text-decoration: none;}
.menuUl :VISITED{color: #fff}
.menuUl :ACTIVE{color: #fff}
.menuUl :FOCUS{color: #fff}
header{
	width:100%;
	height:140px;
    background: red; /* For browsers that do not support gradients */    
    background: -webkit-linear-gradient(left, #b5121b ,#b5121b, white , white); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(right, #b5121b, #b5121b,white, white); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(right, #b5121b, #b5121b,white, white); /* For Firefox 3.6 to 15 */
    background: linear-gradient(to right, #b5121b , #b5121b,white, white); /* Standard syntax (must be last) */
    border-bottom: 1px solid #b5121b;
	
}
.titleArea{
	width: 960px;
	height: 100px;
	margin: auto;
	background: #f2f2f2; /* For browsers that do not support gradients */    
    background: -webkit-linear-gradient(left, #cccccc,white); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(right,#cccccc,white); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(right,#cccccc, white); /* For Firefox 3.6 to 15 */
    background: linear-gradient(to right,#cccccc, white); /* Standard syntax (must be last) */
}
.title, .s1, .s2, .s3, .s4, .s5{float: left;}
.title{
	width: 315px;
	height: 100px;
	background-color: #b5121b;
	text-align: center;
	line-height: 100px;
	font-size: 36px;
	color: white;
	cursor: pointer;
}
.s1{
	width: 150px; height: 100px; background-color: #d1151e;
}
.s2{
	width: 120px; height: 100px; background-color: #ea2e38;
}
.s3{
	width: 90px; height: 100px; background-color: #ed454e;
}
.s4{
	width: 40px; height: 100px; background-color: #f1747a;
}
.s5{
	width: 20px; height: 100px; background-color: #fad1d3;
}
.menubar{
	width: 960px; height: 40px; margin: auto;
}
.menuUl{
	width:60%; height: 40px;
	float: left;
}
.menuUl li{
	padding: 10px 15px;
	float: left;
	color: white;
	cursor: pointer;
}
.menuSelect{text-shadow: 3px 2px #000000;}
.menuUl li:HOVER{
	text-shadow: 3px 2px #000000;
}
#logout{float: right; padding: 10px;cursor: pointer;}

.logoutClass:LINK{color: #000000; text-decoration: none;}
.logoutClass:VISITED{color: #000000}
.logoutClass:ACTIVE{color: #000000}
.logoutClass:FOCUS{color: #000000}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<header>
	<section class="titleArea">
		<div class="title" onclick="main()">테이스토커</div>
		<div class="s1"></div>
		<div class="s2"></div>
		<div class="s3"></div>
		<div class="s4"></div>
		<div class="s5"></div>
	</section>
	<section class="menubar">
		<ul class="menuUl">
			<li class="member"><a href="/admin/5.do">회원관리</a></li>
			<li class="report"><a href="/admin/10.do?pageNum=1">제보관리</a></li>
			<li class="gourmet"><a href="/admin/1.do?pageNum=1">맛집관리</a></li>
			<li class="chat"><a href="/admin/15.do">채팅목록관리</a></li>
		</ul>
		<div id="logout"><a class="logoutClass" href="/member/logout.do">로그아웃</a></div>
	</section>
</header>
<script type="text/javascript">
$(document).ready(function(){
	var nowMenu = "${nowMenu}";
	var hascl = $(".menuUl li").hasClass(nowMenu);
	if(hascl){
		$(".${nowMenu}").addClass("menuSelect");
	}
})
function main(){
	location.href="/admin/5-1.do?pageNum=1";
}
</script>
</body>
</html>