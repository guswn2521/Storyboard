<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<table class="board">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회</th>
	</tr>

	<%for(int i=1;i<=10;i++){ %>
	<tr>
		<td><%=i %></td>
		<td><a href="/bigdata/board/view.jsp">게시판 글입니다 <%=i %></a></td>
		<td>지후니</td>
		<td>2020/11/<%=23-i %></td>
		<td>1234</td>
	</tr>
	<%} %>

	<tr>
		<td colspan="5"><a href="#">[1]</a><a href="#">[2]</a><a href="#">[3]</a></td>
	</tr>
</table>
<button>
	<a href="bigdata/board/write.jsp">글쓰기</a>
</button>
