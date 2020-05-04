<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>회원가입</h1>

<form action="joinOk.jsp" method="post" id="contents" name="joinForm">
	<h4>사이트 이용정보 입력</h4>
	
	<input type="text" placeholder="아이디" name="id" onclick="value=''"><br>
	<p>영문자, 숫자, _만 입력 가능, 최소 3자이상 입력하세요.</p>
	
	<input type="text" placeholder="비밀번호" name="pw" onclick="value=''"><br> 
	<input type="text" placeholder="비밀번호확인" name="repw" onclick="value=''"><br>
	
	<hr><br>
	<h4>개인정보 입력</h4>
	<input type="text" placeholder="이름" name="name" onclick="value=''"><br>
	<p>
		공백없이 한글,영문,숫자만 입력 가능 (한글 2자, 영문 4자 이상) <br>닉네임을 바꾸시면 앞으로 60일
		이내에는 변경 할 수 없습니다.
	</p>
	<input type="text" placeholder="닉네임" name="nickname" onclick="value=''"><br> 
	<input type="text" placeholder="E-mail" name="mail" onclick="value=''"><br>
	
	<input type="button" value="취소" id="cancle" onclick="location.href='/bigdata/login/login.jsp'">
	<input type="submit" id="join" value="회원가입" onclick="joincheck()">
</form>
