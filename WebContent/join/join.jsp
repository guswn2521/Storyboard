<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/layout/common.jsp" %>
    <%page_name="join"; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>join.jsp</title>
    <link rel="stylesheet" href="/bigdata/css/common.css">
    <link rel="stylesheet" href="/bigdata/css/join.css">
</head>
<body>
	<div id="wrap">
		<header id="content-wrap">
		<%@include file="/layout/header.jsp" %>
		</header>
		<div id="line"></div>
		<div class="content-wrapper">
		
		<%@include file="join_content.jsp" %>
		
		</div>
		
		<!-- footer -->
		<%@include file="/layout/footer.jsp" %>
	</div>
	
	<script src="/bigdata/js/join.js"></script>
</body>
</html>