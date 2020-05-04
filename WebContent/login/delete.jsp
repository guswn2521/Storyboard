<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
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
			<h1>회원탈퇴</h1>
			<form action="deleteOk.jsp" method="post">
				PW : <input type="text" name="pw"><br>
				<input type="submit" value="탈퇴하기" class="button">
			</form>
		</div>

		<!-- footer -->
		<%@include file="/layout/footer.jsp"%>
	</div>



</body>
</html>