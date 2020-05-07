<%@page import="com.javalec.ex.boardDao"%>
<%@page import="com.bigdata.dto.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int idx = (Integer)session.getAttribute("idx");
String name = request.getParameter("writer");
String email = request.getParameter("mail");
String homepage = request.getParameter("homepage");
String title = request.getParameter("title");
String content = request.getParameter("contents");
String pw = request.getParameter("pw");

boardDto board = new boardDto(name,email,homepage,title,content,pw);
boardDao dao = boardDao.getInstance();
int result = dao.updateBoard(board);
if(result==1){%>
	<script>
		alert('글이 수정되었습니다.');
		location.href='/bigdata/index.jsp';
	</script>
<%}else{%>
	<script>
		alert('회원정보 수정에 실패했습니다.');
		location.href='/update.jsp';
	</script>

<%}%>

</body>
</html>