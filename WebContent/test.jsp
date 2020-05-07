<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Timer"%>
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
if(result==0){
%>
<script>
	alert('비밀번호를 잘못입력하셨습니다.');
	history.back();
</script>
<%
}else if(result==1){
	
%>
<script>
	TimerTask task = new TimerTask(){
</script>			
<%			
	result = dao.membersDelete(id);		
	session.invalidate();
%>
	<script>
	}
	Timer timer = new Timer();
	timer.schedule(task, 5000, 3000);
	alert('회원탈퇴가 정상처리되었습니다. 더 좋은 서비스로 다시뵙겠습니다.');
	location.href = 'login.jsp';
	</script>
<%}%>
