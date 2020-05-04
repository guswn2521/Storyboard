<%@page import="com.javalec.ex.MembersDao"%>
<%@page import="com.bigdata.dto.MembersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOk.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String mail = request.getParameter("mail");

MembersDto member = new MembersDto(id,pw,name,nickname,mail);
MembersDao dao = MembersDao.getInstance();
int result = dao.membersUpdate(member);
if(result==1){
%>
<script>
 	alert('정보가 수정되었습니다.');
 	location.href='/bigdata/member.jsp';
 </script>
<%}else{ %>
 <script>
 	alert('회원정보 수정에 실패했습니다.');
 	location.href='modify.jsp';
 </script>
<%}%>

</body>
</html>