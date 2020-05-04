<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//out.println(session.getMaxInactiveInterval());
	session.invalidate();
	//response.sendRedirect("/bigdata/index.jsp");
%>
<script>
	alert("안녕히가세요! 다음에 또 오세요.")
	location.href="/bigdata/index.jsp";
</script>