
<%@page import="com.javalec.ex.MembersDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.bigdata.dto.MembersDto"/>
<jsp:setProperty property="*" name="dto"/>

<%

MembersDao dao = MembersDao.getInstance();
int result = dao.confirmId(dto.getId());
if(result==1){
%>
<script>
	alert('아이디가 이미 존재합니다.');
	history.back();
</script>
<%}else{
	 result = dao.membersInsert(dto); 
	 if(result ==1){
%>
<script>
 alert('회원가입 성공.');
 location.href="/bigdata/login/login.jsp";
</script>
<%		 
	 }else{
%>
<<script>
alert('회원가입 실패. 잠시후 다시 해주세요.');
history.back();
</script>

<%		 
	 }
 }
 %>
	 
	 