<%@page import="vote.Vote"%>
<%@page import="member.member" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>
<%@ page import="vote.voteDAO" %>
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
<link rel="stylesheet" href="./css/swiper.min2.css">
<link href="./css/vote.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  <!-- jquery -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('tr td:nth-child(3)').click(function(){
			$('tr td:nth-child(3)').removeClass('backimg');
			$(this).toggleClass('backimg');
			$(this).children('input').prop('checked', true);   //this 자식중 input태그값 조정 
		})
	})
</script>
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
	voteDAO voteDAO = new voteDAO();
	member member = memberDAO.member(student_id);
	
	String college= "";
	switch(member.getCollege()){
	case "신학대학":
		college = "theological_college";
		break;
	case "인문대학":
		college = "College_of_Humanities";
		break;
	case "사회과학대학":
		college = "College_of_Social_Sciences";
		break;
	case "글로벌 경영 기술 대학":
		college = "Global_College_of_Management_Technology";
		break;
	case "사범대학":
		college = "College_of_Education";
		break;
	case "IT공과대학":
		college = "it_engineering_college";
		break;
	case "예술대학":
		college = "art_college";
		break;
	}
	ArrayList list = voteDAO.getvotedata(college);
	Vote votedata = new Vote();
	%>
	<% 
		String student_council = request.getParameter("student_council");
		if(student_council == null){
			%><script>window.alert("투표를 안하셨습니다")</script><%
			%><script>history.back();</script><% 
		}
	%>
	<div class="container" style="padding-top: 40px;">
		<div class="col-md-6" style="border-radius: 10px; padding-top: 20px;">
			<form method="POST" action="./vote3.jsp">
				<h2><%=member.getCollege()%> 선거 투표</h2><br>
				<%
					for(int i =0; i<list.size(); i++){
						votedata=(Vote)list.get(i);
					
				%>
				<table border="1">
					<tr>
						<td>기호<%=votedata.getNo() %>번</td>
						<td>
							<span><%=votedata.getSlogan()%></span><br>
							<span>정</span>&nbsp;<%=votedata.getCandidate1() %>&nbsp;
							<span>부</span>&nbsp;<%=votedata.getCandidate2()%>
						</td>
						<td><input type="radio" name="college" value="<%=votedata.getNo() %>"></td>
					</tr>
				</table><br><br>
				<%} %>
				<input type="text" name="student_council" value="<%=student_council%>" style="display:none;">
				<button type="submit" class="btn btn-default">다음</button>
			</form>
		</div>
	</div>
</body>
</html>