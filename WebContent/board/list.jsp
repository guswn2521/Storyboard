<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		<%@include file="list_content.jsp" %>
	</div>
	<!-- footer -->
		<%@include file="/layout/footer.jsp" %>
	</div>
</body>
</html>