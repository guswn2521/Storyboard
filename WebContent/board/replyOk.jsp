<%@page import="com.javalec.ex.boardDao"%>
<%@page import="com.bigdata.dto.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
//String sIdx = request.getParameter("idx");
//int idx = Integer.parseInt(sIdx);
String name = request.getParameter("writer");
String email = request.getParameter("mail");
String homepage = request.getParameter("homepage");
String title = request.getParameter("title");
String content = request.getParameter("contents");
String pw = request.getParameter("pw");
String sGroup = request.getParameter("group");
int group = Integer.parseInt(sGroup);
String sStep = request.getParameter("step");
int step = Integer.parseInt(sStep);
String sIndent = request.getParameter("indent");
int indent = Integer.parseInt(sIndent);

//dto
boardDto board = new boardDto(name, email, homepage, title, content, pw, group, step, indent);
//dao
boardDao dao = boardDao.getInstance();
//insert
int ri = dao.setBoardReply(board);

//글입력 후 이동.
%>
<script>
<%if(ri==1){%>
	alert('답변이 등록되었습니다.');
	location.href='<%=request.getContextPath()%>/index.jsp';
<%}else{%>
	alert('답변 실패.');
	history.back();//history.go(-1)
<%}%>
</script>