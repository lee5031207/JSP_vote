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
	
	String student_council_no = request.getParameter("student_council");
	String college_no =request.getParameter("college");
	String major_no =request.getParameter("major");
	
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
	
	
	voteDAO voteDAO = new voteDAO();
	voteDAO.update_vote_check(student_id);
	int x = voteDAO.vote("student_council", student_council_no);
	int y = voteDAO.vote(college,college_no);
	int z = voteDAO.vote(major,major_no);
	
	if(x==1 && y==1 && z==1){
		%><script>alert("소중한 한표 감사합니다")</script><%
	}else if(x == -1 || y == -1 || z == -1){
		%><script>alert("오류")</script><%
	}
	%>
	<script>
		location.href="./main.jsp";
	</script>
</body>
</html>