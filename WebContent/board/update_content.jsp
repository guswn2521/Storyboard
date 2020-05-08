<%@page import="com.bigdata.dto.boardDto"%>
<%@page import="com.javalec.ex.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//수정할 글번호 받기
String sIdx = request.getParameter("idx");
int idx = Integer.parseInt(sIdx);
boardDao dao = boardDao.getInstance();

//수정할 글 내용 가져오기
boardDto board = dao.getBoardOne(idx);
%>
<form action="/bigdata/board/updateOk.jsp" method="post" name="updateForm">
	<input type="hidden" name="idx" value="<%=idx%>"><br>
	<h1>글 수정하기</h1>
	<input value="<%=board.getName()%>" type="text" name="writer"><br> 
	<input value="<%=board.getEmail()%>" type="text" name="mail"><br> 
	<input value="<%=board.getHomepage()%>" type="text" name="homepage"><br> 
	<input value="<%=board.getTitle()%>" type="text" name="title"><br> 
	<input value="<%=board.getContent()%>" type="text" name="contents" id="content"><br> 
	<input value="" type="text" name="pw"><br>
	<div>
		<input type="submit" class="buttons" value="수정완료" onclick="updatecheck();">
		<input type="button" class="buttons" value="다시 수정" onclick="reset();">
		<input type="button" class="buttons" value="뒤로" onclick="window.history.back()">
	</div>
	
</form>