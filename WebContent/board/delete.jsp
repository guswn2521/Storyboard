<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>delete.jsp</title>
<link rel="stylesheet" href="/bigdata/css/common.css">
<link rel="stylesheet" href="/bigdata/css/board.css">
</head>
<body>
	<div id="wrap">
		<header id="content-wrap">
			<%@include file="/layout/header.jsp"%>
		</header>
		<div id="line"></div>
		<div class="content-wrapper">
			<h3>작성자의 비밀번호를 입력해주세요.</h3>
			<br>
			<form method="post" id="contents" name="deleteForm">
				<input type="text" name="dpw" onclick="value=''" id="dpw"> <br>
				<br><br><hr><br>
				<div class="dbuttons">
					<input type="button" id="deletecomplete" value="삭제완료"
						onclick="deletecheck();"> 
					<input type="button" id="back3" value="뒤로" onclick="window.history.back()">
				</div>
			</form>
		</div>
		<!-- footer -->
		<%@include file="/layout/footer.jsp"%>
	</div>
	<script src="/bigdata/js/board.js"></script>
</body>
</html>