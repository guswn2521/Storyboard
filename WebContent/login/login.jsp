<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login.jsp</title>
<link rel="stylesheet" href="/bigdata/css/common.css">
<link rel="stylesheet" href="/bigdata/css/login.css">
</head>
<body>
	<div id="wrap">
		<header id="content-wrap">
			<%@include file="/layout/header.jsp"%>
		</header>
		<div id="line"></div>
		<div class="content-wrapper">
		
			<%@include file="/login/login_content.jsp" %>
			
		</div>
		
		<!-- footer -->
		<%@include file="/layout/footer.jsp"%>
	</div>
	<script src="/bigdata/js/login.js"></script>
</body>
</html>