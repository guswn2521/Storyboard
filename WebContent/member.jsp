<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head> 
    <title>index.jsp</title>
    <link rel="stylesheet" href="/bigdata/css/common.css">
   
</head>

<body>
	<div id="wrap">
	<header id="content-wrap">
		<%@include file="/layout/header.jsp" %>
	</header>
	<div id="line"></div>
	<div class="content-wrapper">
		<%@include file="member_content.jsp" %>
	</div>
	<!-- footer -->
		<%@include file="/layout/footer.jsp" %>
	</div>
</body>
</html>