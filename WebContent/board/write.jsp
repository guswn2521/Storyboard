<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 쓰기</title>
    <link rel="stylesheet" href="/bigdata/css/common.css">
    <link rel="stylesheet" href="/bigdata/css/board.css">
</head>
<body>
    <header id="content-wrap">
        <%@include file="/layout/header.jsp" %>
    </header>
    <div id="line"></div>
    <div class="content-wrapper">
        <h1>게시판 글쓰기</h1>
        <form method="post" name="writeForm">
            <input type="text" name="writer" id="user" placeholder="작성자"><br>
            <input type="text" name="mail" id="mail" placeholder="E-Mail"><br>
            <input type="text" name="homepage" id="home" placeholder="홈페이지"><br>
            <input type="text" name="title" id="title" placeholder="제목"><br>
            <input type="text" name="contents" id="content" placeholder="내용"><br>
            <input type="text" name="pw" id="pw" placeholder="비밀번호"><br>
            <div>
                <input type="button" id="enroll" value="등록" onclick="writingcheck();">
                <input type="button" id="back1" value="뒤로" onclick="window.history.back()">
            </div>
        </form>
    </div>
    <%@include file="/layout/footer.jsp" %>
    <script src="/bigdata/js/board.js"></script>
</body>
</html>