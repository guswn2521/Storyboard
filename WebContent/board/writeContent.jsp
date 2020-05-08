<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>게시판 글쓰기</h1>
<form action="<%=request.getContextPath() %>/board/writeOk.jsp" method="post" name="writeForm">
	<label for="writer">작성자</label>
	<input type="text" name="writer" id="writer"><br>
	<label for="mail">E-Mail</label>
	<input type="text" name="mail" id="mail"><br>
	<label for="homepage">홈페이지</label>
	<input type="text" name="homepage" id="homepage"><br>
	<label for="title">제목</label>
	<input type="text" name="title" id="title"><br>
	<label for="content">내용</label>
	<input type="text" name="contents" id="content"><br>
	<label for="pw">비밀번호</label>
	<input type="text" name="pw" id="pw"><br>
	<div>
		<input type="submit" class="buttons" value="등록" onclick="writingcheck();">
		<input type="button" class="buttons" value="뒤로" onclick="window.history.back()">
	</div>
</form>