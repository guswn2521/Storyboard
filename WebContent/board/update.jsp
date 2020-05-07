<%@page import="com.javalec.ex.boardDao"%>
<%@page import="com.bigdata.dto.boardDto"%>
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
		<%
			int idx = (Integer)session.getAttribute("idx");
			boardDao dao = boardDao.getInstance();
			boardDto board = dao.getBoardOne(idx);
		%>
		<form action="updateOk.jsp" method="post" name="updateForm">
        <h1>글 수정하기</h1>
        <input value="<%=board.getName() %>" type="text" name="writer" id="user"><br>
        <input value="<%=board.getEmail() %>" type="text" name="mail" id="mail"><br>
        <input value="<%=board.getHomepage() %>" type="text" name="homepage" id="home"><br>
        <input value="<%=board.getTitle() %>" type="text" name="title" id="title"><br>
        <input value="<%=board.getContent() %>" type="text" name="contents" id="content"><br>
        <input value="<%=board.getPw() %>" type="text" name="pw" id="pw"><br>
        <div class="buttons">
            <input type="submit" id="enroll" value="수정완료" onclick="updatecheck();">
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