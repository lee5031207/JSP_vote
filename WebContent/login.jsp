<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 투표 시스템</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="./css/login2.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<%
	String student_id = null;
	if(session.getAttribute("student_id") != null){   //만약 학번이 세션에있다면
		PrintWriter script = response.getWriter();  
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
%>
	<div class="container" style="padding-top: 40px;">
		<div class="col-md-6" style="border-radius: 10px;">
			<image src="./images/logo.bmp" width="25%;">
			<p class="sungkyul">성결대학교 전자투표</p><br>
			<form method="POST" action="login_post.jsp">
				<input type="text" name="student_id" placeholder="학번을 입력해주세요">
				<input type="password" name="pw" placeholder="비밀번호를 입력해주세요">
				<button type="submit">로그인</button>
			</form>
			<button style="background-color:skyblue; border:1px solid skyblue;"
					onclick="location.href='signin.jsp' ">회원 가입</button>
		</div>
	</div>
</body>
</html>