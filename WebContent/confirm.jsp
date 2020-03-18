<%@page import="notice.Notice"%>
<%@page import="member.member" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>
<%@ page import="notice.noticeDAO" %>
<%@ page import="crolling.crollingtest" %><!-- 크롤링테스트 -->
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 투표 시스템</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="./css/main2.css" type="text/css" rel="stylesheet">
<link href="./css/confirm.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="./css/swiper.min2.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./js/paint.js"></script>

</head>
<body>
	<%
	
	String student_id = null;
	if(session.getAttribute("student_id") == null){
		%><script>alert('로그인 후 이용해주세요')</script><%
		%><script>location.href="./login.jsp"</script><%
	}else{
		student_id = (String)session.getAttribute("student_id");
	}
	
	memberDAO memberDAO = new memberDAO();
	member member = memberDAO.member(student_id);
	
	%>
	<% 
		String student_council = request.getParameter("student_council");
		String college =request.getParameter("college");
		String major =request.getParameter("major");
		if(major == null){
			%><script>window.alert("투표를 안하셨습니다")</script><%
			%><script>history.back();</script><% 
		}
	%>
	<div class="container" style="padding-top: 40px;">
		<div class="col-md-6" style="border-radius: 10px; padding-top: 20px;">
			<h4>제18대 성결대 학생 자치조직 선거 투표</h4><br>
			<div>
			제32대 총학생회 선거 투표 <span>기호<%=student_council%>번</span><br>
			제23대 <%=member.getCollege()%>&nbsp;<span>선거 투표 기호 <%=college%>번</span><br>
			제21대 <%=member.getMajor() %>&nbsp;<span>선거 투표 기호 <%=major %></span>번<br>
			</div>
			<br><br>
			본인(<%=member.getStudent_name() %>)은 상기에 기재된 내용으로<br> 제19대 성결대학교 학생자치단체 투표 합니다.
			<form action="./vote_post.jsp" method="POST">
			<input type="text" name="student_council" value="<%=student_council%>" style="display:none;">
			<input type="text" name="college" value="<%=college%>" style="display:none;">
			<input type="text" name="major" value="<%=major%>" style="display:none;">
			<div>
				<button type="button" class="btn btn-default" onclick="location.href='main.jsp'">취소</button>
				<button type="submit" class="btn btn-default">투표</button>
			</div>
			</form>
		</div> 
	</div>
</body>
</html>