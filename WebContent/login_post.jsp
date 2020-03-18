<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.member" scope="page"/>
<jsp:setProperty name="member" property="student_id" />
<jsp:setProperty name="member" property="pw" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String student_id = null;
	if(session.getAttribute("student_id") != null){  //session에  user_id라는 값이 있으면
		student_id = (String)session.getAttribute("student_id");  //user_id에 그 값을 넣어줌
	}
	if(student_id != null){                  //그값이  null이 아니면 넣어줬으니 아니겠지
		PrintWriter script = response.getWriter();  
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.')");   // 이미 로그인 된상황이지
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	
	
	memberDAO memberDAO = new memberDAO();
	int result = memberDAO.login(member.getStudent_id(),member.getPw());
	if(result==1){
		session.setAttribute("student_id", member.getStudent_id());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if(result==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('일치하는 아이디가 없습니다')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result==-2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터 베이스 오류 입니다.문의전화 010-7486-1207')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>