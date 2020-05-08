<%@page import="com.bigdata.dto.boardDto"%>
<%@page import="com.javalec.ex.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String sIdx = request.getParameter("idx");
	int idx = Integer.parseInt(sIdx);
	boardDao dao = boardDao.getInstance();
	//조회수 증가시키기
	dao.setBoardHit(idx);
	//글 1개 가져오기
	boardDto board = dao.getBoardOne(idx);
	String content = board.getContent().replace("\n","<br>");
%>
<h1>글 읽기</h1>
<table>
	<tr>
		<th>작성자</th>
		<td><%=board.getName() %></td>
		<th>작성일</th>
		<td><%=board.getRegdate() %></td>
	</tr>
	<tr>
		<th>E-mail</th>
		<td><%=board.getEmail() %></td>
		<th>홈페이지</th>
		<%if(board.getHomepage().length()==0){%>
			<td></td>
		<%}else{ %>
			<td><a href="<%=board.getHomepage()%>" target="_blank"><%=board.getHomepage() %></a></td>
		<%} %>
		
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><%=board.getTitle() %></td>
	</tr>
	<tr>
		<td colspan="4" id="material"><%=content %>
		</td>
	</tr>
	<tr>
		<td colspan="4">조회수 : <%=board.getHit() %></td>
	</tr>
</table>
<div class="button">
	[<a href="/bigdata/index.jsp">목록</a>| <a
		href="/bigdata/board/update.jsp?idx=<%=idx%>">수정</a>| <a
		href="/bigdata/board/answer.jsp?idx=<%=idx%>">답변</a>| <a
		href="/bigdata/board/delete.jsp?idx=<%=idx%>">삭제</a>]
</div>