<%@page import="com.javalec.ex.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MembersDao dao = MembersDao.getInstance();
	int result = dao.userCheck(id, pw);
	if(result==-1){
%>
<script>
	alert('아이디가 없습니다.');
	history.back();
</script>
<%}else if(result==0){ %>
<script>
	alert('비밀번호가 틀립니다.');
	history.back();
</script>
<%}else if(result==1){ 
	session.setAttribute("id", id);%>
<script>
	alert('로그인 성공!');
	location.href="/bigdata/index.jsp";
</script>
<%} %>
</body>
</html>