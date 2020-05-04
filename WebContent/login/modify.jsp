<%@page import="com.bigdata.dto.MembersDto"%>
<%@page import="com.javalec.ex.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify.jsp</title>
<link rel="stylesheet" href="/bigdata/css/common.css">
<link rel="stylesheet" href="/bigdata/css/login.css">
<%@include file="/layout/logincheck.jsp"%>
</head>
<body>
	<div id="wrap">
		<header id="content-wrap">
			<%@include file="/layout/header.jsp"%>
		</header>
		<div id="line"></div>
		<div class="content-wrapper">
			<%
				MembersDao dao = MembersDao.getInstance();
				MembersDto member = dao.getMemberInfo(id);
			%>
			<h1>회원정보수정</h1>
			<form action="modifyOk.jsp" method="post" name="modifyForm">
				<p><%=member.getId()%>님<br> </p>
				PW : <input value="<%=member.getPw()%>" type="password" name="pw" size="20"><br>
				REPW : <input value="<%=member.getPw()%>" type="password" name="pw_check" size="20"><br> 
				Name : <input value="<%=member.getName()%>" type="text" name="name" size="20"><br>
				NickName : <input value="<%=member.getNickname()%>" type="text" name="nickname" size="20"><br> 
				E-mail : <input value="<%=member.getMail()%>" type="text" name="mail" size="20"><br>

				<input type="submit" value="정보수정완료" class="button"> 
				<input type="reset" value="취소" class="button" onclick="javascript:window.location='/bigdata/index.jsp'">
				<input type="button" value="회원탈퇴" class="button" onclick="javascript:window.location='/bigdata/login/delete.jsp'"><br>
			</form>
		</div>
		<!-- footer -->
		<%@include file="/layout/footer.jsp"%>
	</div>
</body>
</html>