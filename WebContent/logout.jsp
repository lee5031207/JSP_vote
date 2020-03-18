<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<%
		session.invalidate();
%>
<body>
	<script>
		window.alert("로그아웃 되셨습니다");
		location.href = "login.jsp";
	</script>
</body>
</html>