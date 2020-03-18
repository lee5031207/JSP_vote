<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.member" scope="page"/>
<jsp:setProperty name="member" property="student_id" />
<jsp:setProperty name="member" property="pw" />
<jsp:setProperty name="member" property="college" />
<jsp:setProperty name="member" property="major" />
<jsp:setProperty name="member" property="student_name" />
<jsp:setProperty name="member" property="current_student" />
<jsp:setProperty name="member" property="vote_2019" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	if( member.getMajor() == null || member.getStudent_name() == null || member.getPw() == null || member.getStudent_id() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력 안된 항목이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		memberDAO memberDAO = new memberDAO();
		int result = memberDAO.join(member);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디,학번 입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 되셨습니다  입력하신 ID로 로그인 해 주십시오')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
	}
%>
</body>
</html>