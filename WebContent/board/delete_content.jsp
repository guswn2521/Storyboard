<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx");
%>


<h3>작성자의 비밀번호를 입력해주세요.</h3>
<br>
<form action="<%=request.getContextPath()%>/board/deleteOk.jsp" method="post" id="contents" name="deleteForm">
	<input type="text" name="idx" value=<%=idx %>>
	<input type="text" name="dpw" onclick="value=''" id="dpw"> <br>
	<br>
	<br>
	<hr>
	<br>
	<div class="dbuttons">
		<input type="button" class="buttons" value="삭제완료"
			onclick="deletecheck();"> 
		<input type="button" class="buttons"
			value="뒤로" onclick="window.history.back()">
	</div>
</form>