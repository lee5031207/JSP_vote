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
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 투표 시스템</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="./css/main2.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="./css/swiper.min2.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<%
	String student_id = null;
	if(session.getAttribute("student_id") != null){   //만약 학번이 세션에있지 않다면
		student_id = (String)session.getAttribute("student_id");  //학번 변수에 세션에서 꺼내서 넣어준다
	}
	memberDAO memberDAO = new memberDAO();
	member member = memberDAO.member(student_id);
	
	voteDAO voteDAO = new voteDAO();
	double a = ((double)voteDAO.current_student());
	double b = ((double)voteDAO.vote_student());
	double c = (b/a)*100;
	
	double x = ((double)voteDAO.college_student(member.getCollege()));
	double y = ((double)voteDAO.college_vote_student(member.getCollege()));
	double z = (y/x)*100;
	
	double q =((double)voteDAO.major_student(member.getMajor()));
	double w =((double)voteDAO.major_vote_student(member.getMajor()));
	double e = (w/q)*100;
	
%>

<body>
	<div class="container" style="padding-top: 40px;">
		<div class="col-md-6" style="border-radius: 10px;">
			<div class="logout"><a href="logout.jsp"><%=member.getStudent_name() %>[<%=member.getStudent_id()%>]</a><br></div>
			<image src="./images/logo.bmp" width="25%;">
			<p class="sungkyul">성결대 모바일 전자투표</p><br>
			<!-- Swiper -->
			    <div class="swiper-container">
			        <div class="swiper-wrapper">
			            <div class="swiper-slide">
			            	<br><span>총학생회 투표율</span><br>
			            	<span style="font-size:30px">
			            		<%=String.format("%.1f", c)%>%
			            	</span>
			            </div>
			            <div class="swiper-slide">
			            	<br><span><%=member.getCollege()%> 투표율</span><br>
			            	<span style="font-size:30px">
			            		<%=String.format("%.1f", z)%>%
			            	</span>
			            </div>
			            <div class="swiper-slide">
			            	<br><span><%=member.getMajor() %> 투표율</span><br>
			            	<span style="font-size:30px">
			            		<%=String.format("%.1f", e)%>%
			            	</span>
			            </div>
			        </div>
			        <!-- Add Scrollbar -->
			        <div class="swiper-scrollbar"></div>
			    </div>
			<hr>
			<p style="margin-left:30px; font-size:20px;">공지사항</p>
			<div class="notice">
					<ul>
					<% 
						ArrayList<String> crolling_list = crollingtest.test();
						ArrayList<String> crolling_href = crollingtest.href();
						for(int i =0; i<crolling_list.size(); i++){	
					%>
					<li><a href="https://www.sungkyul.ac.kr/mbs/skukr/jsp/board/<%=crolling_href.get(i)%>"><%=crolling_list.get(i)%></a></li>
					<%}%>
			<%-- 		<% 
						noticeDAO noticeDAO = new noticeDAO();
						ArrayList<Notice> list = noticeDAO.list(); 					
						for(int i = 0; i<list.size(); i++){
					%>
						<li><a><%=list.get(i).getSubject()%></a></li>
					<%}%> --%>
					</ul>
			</div>
			    <hr>
			    <div class="votelogo">
			    	<img src="./images/votelogo.png" width="20%">
			    	<%
			    		if(member.isVote_2019() == false){
			    		%><a href="./agree.jsp">2019투표하러가기</a><%
			    		}else{
			    		%><a>소중한 한표 감사합니다</a><%
			    		}
			    	%>
			    	
			    </div>
			
			    <!-- Swiper JS -->
			    <script src="./js/swiper.min.js"></script>
			
			    <!-- Initialize Swiper -->
			    <script>
			    var swiper = new Swiper('.swiper-container', {
			        scrollbar: '.swiper-scrollbar',
			        scrollbarHide: true,
			        slidesPerView: 'auto',
			        centeredSlides: true,
			        spaceBetween: 30,
			        grabCursor: true
			    });
			    </script>
		</div>
	</div>	
</body>
</html>