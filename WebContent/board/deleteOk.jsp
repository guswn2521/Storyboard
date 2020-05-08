<%@page import="com.bigdata.dto.boardDto"%>
<%@page import="com.javalec.ex.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sIdx = request.getParameter("idx");
int idx = Integer.parseInt(sIdx);
String pw = request.getParameter("dpw");
boardDao dao = boardDao.getInstance();
boardDto board = null;
//idx,pw 체크
board = dao.getBoardOne(idx);
if(pw.equals(board.getPw())){
	//delete실행
	int ri = dao.setBoardDelete(idx);
	if(ri==1){%>
		<script>
			alert('삭제성공.');
			location.href='<%=request.getContextPath()%>/index.jsp';
		</script>
	<%}else{%>
		<script>
			alert('삭제실패.');
			history.back();
		</script>
	<%}
	}else{%>
	<script>
		alert('비번이 틀렸습니다.');
		history.back();
	</script>
<%}%>