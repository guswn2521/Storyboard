<%@page import="com.bigdata.dto.boardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javalec.ex.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//글 목록 전체 가져오기
boardDao dao = boardDao.getInstance();
ArrayList<boardDto> boards = dao.getBoardAll();
%>


<table class="board">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회</th>
	</tr>

	<%
	if(boards.size()>0){
		String viewPath = "";
		for(boardDto board : boards){
			viewPath = request.getContextPath()+"/board/view.jsp?idx="+board.getIdx();
	
	 %>
	<tr>
		<td><%=board.getIdx() %></td>
		<td><a href="<%=viewPath%>"> <%=board.getTitle() %></a></td>
		<td><%=board.getName() %></td>
		<td><%=board.getRegdate() %></td>
		<td><%=board.getHit() %></td>
	</tr>
	<%} 
	}else{
		out.println("<tr><td colspan='5'>게시글이 없습니다.</td></tr>");
	}%>

	<tr>
		<td colspan="5"><a href="#">[1]</a><a href="#">[2]</a><a href="#">[3]</a></td>
	</tr>
</table>
<input type="button" onclick="location.href='/bigdata/board/write.jsp';" value="글쓰기" name="writebutton">