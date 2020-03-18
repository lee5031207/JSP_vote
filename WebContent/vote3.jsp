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
	
	String major ="";
	switch(member.getMajor()){
	case "신학부":
		major = "theology";
		break;
	case "국어국문학과":
		major = "korean";
		break;
	case "영어영문학과":
		major = "english";
		break;
	case "일어일문학과":
		major = "japanese";
		break;
	case "중어중문학과":
		major = "chinese";
		break;	
	case "국제개발협력과":
		major = "global";
		break;
	case "사회복지학과":
		major = "social_welfare";
		break;
	case "관광개발학과":
		major = "tour_develop";
		break;
	case "경영학과":
		major = "management";
		break;
	case "동아시아물류학부":
		major = "east_asia";
		break;
	case "산업경영공학과":
		major = "industrial_management";
		break;
	case "유아교육과":
		major = "kids_education";
		break;
	case "체육교육과":
		major = "physical_education";
		break;
	case "컴퓨터공학과":
		major = "computer_engineering";
		break;
	case "정보통신공학과":
		major = "information_communication_engineering";
		break;
	case "미디어소프트웨어학과":
		major = "media_software_engineering";
		break;
	case "도시디자인정보공학과":
		major = "city_design";
		break;
	case "음악학부":
		major = "music";
		break;
	case "연극영화학부":
		major = "Theater_Film";
		break;
	case "뷰티디자인학부":
		major = "beauty_design";
		break;
	case "공연음악예술학부":
		major = "performing_arts";
		break;
	}
	ArrayList list = voteDAO.getvotedata(major);
	Vote votedata = new Vote();
	%>
	<% 
		String student_council = request.getParameter("student_council");
		String college =request.getParameter("college");
		if(college == null){
			%><script>window.alert("투표를 안하셨습니다")</script><%
			%><script>history.back();</script><% 
		}
	%>
	<div class="container" style="padding-top: 40px;">
		<div class="col-md-6" style="border-radius: 10px; padding-top: 20px;">
			<form method="POST" action="./confirm.jsp">
				<h2 style="font-size:23px;"><%=member.getMajor() %> 선거 투표</h2><br>
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
						<td><input type="radio" name="major" value="<%=votedata.getNo() %>"></td>
					</tr>
				</table><br><br>
				<%} %>
				<input type="text" name="student_council" value="<%=student_council%>" style="display:none;">
				<input type="text" name="college" value="<%=college%>" style="display:none;">
				<button type="submit" class="btn btn-default">다음</button>
			</form>
		</div>
	</div>
</body>
</html>