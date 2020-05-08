<%@page import="com.javalec.ex.boardDao"%>
<%@page import="com.bigdata.dto.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String sIdx = request.getParameter("idx");
int idx = Integer.parseInt(sIdx);
String name = request.getParameter("writer");
String email = request.getParameter("mail");
String homepage = request.getParameter("homepage");
String title = request.getParameter("title");
String content = request.getParameter("contents");
String pw = request.getParameter("pw");


//dao
boardDao dao = boardDao.getInstance();
boardDto  board = null;
//비밀번호 체크 idx,pw
board=dao.getBoardOne(idx);
if(pw.equals(board.getPw())){//비번이 맞으면
	//글하나 생성
	board = new boardDto(name,email,homepage,title,content,pw);
	//update실행
	int ri = dao.setBoardUpdate(board, idx);
	
	//페이지 이동
	if(ri==1){%>
		<script>
			alert('수정 성공');
			location.href='<%=request.getContextPath()%>/board/view.jsp?idx=<%=idx%>';
		</script>
	<%}else{%>
		<script>
			alert('수정실패');
			history.back();
		</script>
	<%}
}else{%>
	<script>
		alert('비번이 틀렸습니다.');
		history.back();
	</script>
<%} %>
