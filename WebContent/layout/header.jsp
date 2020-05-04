<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a class="logo" href="/bigdata/index.jsp"> 
<img src="https://mir-s3-cdn-cf.behance.net/project_modules/hd/7da06d34950481.56e491b8759f6.jpg">
</a>
<%
	String name=(String)session.getAttribute("id");
	if(name==null){
%>
<nav>
	<ul class="nav-items">
		<li><a href="/bigdata/login/login.jsp">Login</a></li>
		<li><a href="/bigdata/join/join.jsp">회원가입</a></li>
		<li><a href="/bigdata/index.jsp">게시판</a></li>
		<li><a href="/bigdata/member.jsp">회원목록</a></li>
	</ul>
</nav>
<%}else{%>
    <nav>
    	<ul class="nav-items">
        <li><%=name %>님 환영합니다</li>
        <li><a href="/bigdata/login/logout.jsp">로그아웃</a></li>
        <li><a href="/bigdata/login/modify.jsp">회원정보수정</a></li>
        <li><a href="/bigdata/member.jsp">회원목록</a></li>
        </ul>
    </nav>

<%}%>