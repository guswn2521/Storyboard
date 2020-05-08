<%@page import="com.bigdata.dto.boardDto"%>
<%@page import="com.javalec.ex.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//답변할 글번호 받기
String sIdx = request.getParameter("idx");
int idx = Integer.parseInt(sIdx);
boardDao dao = boardDao.getInstance();
boardDto board = dao.getBoardOne(idx);

int group = board.getGroup();
int step = board.getStep();
int indent = board.getIndent();

//답변할 글 내용 가져오기

String title = "답변>>" + board.getTitle();
String content = board.getContent()+"\n\n ============원본===========\n";
%>
<form action="<%=request.getContextPath() %>/board/replyOk.jsp" method="post" name="updateForm">
	
	<h1>답변하기</h1>
	<input type="text" name="idx" value="<%=idx%>"><br>
	<input type="text" name="group" value="<%=group%>"><br>
	<input type="text" name="step" value="<%=step%>"><br>
	<input type="text" name="indent" value="<%=indent%>"><br>
	<input value="<%=board.getName()%>" type="text" name="writer"><br> 
	<input value="<%=board.getEmail()%>" type="text" name="mail"><br> 
	<input value="<%=board.getHomepage()%>" type="text" name="homepage"><br> 
	<input value="<%=title%>" type="text" name="title"><br> 
	<input value="<%=content%>" type="text" name="contents" id="content"><br> 
	<input value="" type="text" name="pw"><br>
	<div>
		<input type="submit" class="buttons" value="답변완료">
		<input type="button" class="buttons" value="뒤로" onclick="window.history.back()">
	</div>
	
</form>