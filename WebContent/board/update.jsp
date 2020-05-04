<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시물 수정</title>
	<link rel="stylesheet" href="/bigdata/css/common.css">
	<link rel="stylesheet" href="/bigdata/css/board.css">
</head>
<body>
	<div id="wrap">
	<header id="content-wrap">
		<%@include file="/layout/header.jsp" %>
	</header>
	<div id="line"></div>
	<div class="content-wrapper">
		<form method="post" name="updateForm">
        <h1>글 수정하기</h1>
        <input type="text" name="writer" id="user" placeholder="작성자"><br>
        <input type="text" name="mail" id="mail" placeholder="E-Mail"><br>
        <input type="text" name="homepage" id="home" placeholder="홈페이지"><br>
        <input type="text" name="title" id="title" placeholder="제목"><br>
        <input type="text" name="contents" id="content" placeholder="내용"><br>
        <input type="text" name="pw" id="pw" placeholder="비밀번호"><br>
        <div class="buttons">
            <input type="button" id="enroll" value="수정완료" onclick="updatecheck();">
            <input type="button" id="fix" value="다시 수정" onclick="reset();">
            <input type="button" id="back2" value="뒤로" onclick="window.history.back()">
        </div>
        </form>
	</div>
	<!-- footer -->
		<%@include file="/layout/footer.jsp" %>
	</div>
	<script src="/bigdata/js/board.js"></script>
</body>
</html>