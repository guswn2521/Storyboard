<%@page import="com.javalec.ex.MembersDao"%>
<%@page import="com.bigdata.dto.MembersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("id");
String pw = request.getParameter("pw");
MembersDao dao = MembersDao.getInstance();

int result = dao.userCheck(id, pw);
if(result==0){%>
	<script>
		alert('비밀번호를 잘못입력하셨습니다.');
		history.back();
	</script>
<%}else if(result==1){
	result=dao.membersDelete(id);
	if(result==0){%>
	<script>
		alert('회원탈퇴 실패. 잠시후 다시 시도해주세요.');
		history.back();
	</script>
	<%}else if(result==1){
		session.invalidate();%>
		<script>
			alert('회원탈퇴가 정상처리되었습니다. 더 조은 서비스로 다시뵙겠습니다.');
			location.href='login.jsp';
		</script>
	<%}
}%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteOk.jsp</title>
</head>
<body>

</body>
</html>