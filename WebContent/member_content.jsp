<%@page import="com.bigdata.dto.MembersDto"%>
<%@page import="com.javalec.ex.MembersDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%if(session.getAttribute("id") ==null){ %>
<h3>Member-로그인전</h3>
<table class="board">
	<tr>
		<th>num</th>
		<th>id</th>
		<th>pw</th>
		<th>name</th>
		<th>nickname</th>
		<th>email</th>
	</tr>
	<%//db에서 전체멤버 정보가져오기.
	MembersDao dao = MembersDao.getInstance();
	ArrayList<MembersDto> memberList = dao.getMemberList();
	int i=1;
	for(MembersDto member : memberList){ %>
	<tr>
		<td><%=i %></td>
		<td><%=member.getId() %></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<%
		i++;
	} %>
</table>
<%}else{ %>
<h3>Member-로그인후</h3>
<table class="board">
	<tr>
		<th>num</th>
		<th>id</th>
		<th>pw</th>
		<th>name</th>
		<th>nickname</th>
		<th>email</th>
	</tr>
	<%//db에서 전체멤버 정보가져오기.
	MembersDao dao = MembersDao.getInstance();
	ArrayList<MembersDto> memberList = dao.getMemberList();
	int i=1;
	for(MembersDto member : memberList){ %>
	<tr>
		<td><%=i %></td>
		<td><%=member.getId() %></td>
		<td><%=member.getPw() %></td>
		<td><%=member.getName() %></td>
		<td><%=member.getNickname() %></td>
		<td><%=member.getMail() %></td>
	</tr>
	<%
		i++;
	} %>
</table>
<%} %>