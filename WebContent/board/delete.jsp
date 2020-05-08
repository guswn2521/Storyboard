<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>delete.jsp</title>
<link rel="stylesheet" href="/bigdata/css/common.css">
<link rel="stylesheet" href="/bigdata/css/board.css">
</head>
<body>
	<div id="wrap">
		<header id="content-wrap">
			<%@include file="/layout/header.jsp"%>
		</header>
		<div id="line"></div>
		<div class="content-wrapper">
			<%@include file="delete_content.jsp" %>
		</div>
		<!-- footer -->
		<%@include file="/layout/footer.jsp"%>
	</div>
	<script src="/bigdata/js/board.js"></script>
</body>
</html>