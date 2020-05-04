<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<form action="loginOk.jsp" method="post" name="loginForm">
	<h1>로그인</h1><br> 
	
	<input type="text" name="id" placeholder="아이디(필수)" onclick="value=''"> <br>
	<input type="text" name="pw" placeholder="비밀번호(필수)" onclick="value=''"><br>
	
	<a href="/bigdata/join/join.jsp">회원가입</a> 
	<input type="submit" onclick="login();" value="로그인" class="button"> <br>
	
</form>