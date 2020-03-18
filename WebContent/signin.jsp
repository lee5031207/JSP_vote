<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 투표 시스템</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/signin.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
    <div class="container" style="padding-top: 40px;">
    	<div class="col-md-6" style="border-radius: 10px;">
	    	<h2>회원가입</h2>
	    	<form method="POST" action="signin_post.jsp">
	    	<!-- 	<div class="form-group">
	    			<label>아이디 *</label>
	                <input type="text" name="user_id"  placeholder="아이디를 입력하시오"><br><br>
                	<span class="double_result" style="color:gray;">(아이디는 영문,숫자 4~15자리)</span><br>
	            </div> -->
	            <div class="form-group">
	                <label>학번 *</label>
	                <input type="text" name="student_id" placeholder="학번을 입력하시오">
	            </div>
	            <div class="form-group">
	            	<label>비밀번호 *</label>
	                <input type="password" name="pw" placeholder="비밀번호를 입력하시오">
	            </div>
	            <div class="form-group">
	                <label>이름 *</label>
	                <input type="text" name="student_name" placeholder="이름을 입력하시오">
	            </div>
	            <div class="form-group">
	                <label>단과대</label>
	                <select name="college" class="form-control" >
	                  <option value="" selected disabled hidden >소속 단과대학을 선택하세요</option>
					  <option>신학대학</option>
					  <option>인문대학</option>
					  <option>사회과학대학</option>
					  <option>글로벌 경영 기술 대학</option>
					  <option>사범대학</option>
					  <option>IT공과대학</option>
					  <option>예술대학</option>
					  <option>파이데이아칼리지</option>
					  <option>융합대학</option>
					</select>
	            </div>
	            <div class="form-group">
	                <label>학부</label>
	                <select class="form-control" name="major">
	                  <option value="" selected disabled hidden >학과를 선택하세요</option>
					  <option>신학부</option>
					  <option>국어국문학과</option>
					  <option>영어영문학과</option>
					  <option>일어일문학과</option>
					  <option>중어중문학과</option>
					  <option>국제개발협력과</option>
					  <option>사회복지학과</option>
					  <option>관광개발학과</option>
					  <option>경영학과</option>
					  <option>동아시아물류학부</option>
					  <option>산업경영공학과</option>
					  <option>유아교육과</option>
					  <option>체육교육과</option>
					  <option>컴퓨터공학과</option>
					  <option>정보통신공학과</option>
					  <option>미디어소프트웨어학과</option>
					  <option>도시디자인정보공학과</option>
					  <option>음악학부</option>
					  <option>연극영화학부</option>
					  <option>뷰티디자인학부</option>
					  <option>공연음악예술학부</option>
					  <option>융합학부</option>
					</select>
	            </div>
	           <!--  <div class="form-group">
	                <label>성별</label>
	                <select class="form-control" name="gender">
	                	<option value="" selected disabled hidden >성별을 선택하세요</option>
	                	<option>남자</option>
	                	<option>여자</option>
	                </select>
	            </div>
	            <div class="form-group">
	                <label>e-mail</label>
	                <input type="text" name="email" placeholder="e-mail을 입력하시오">
	            </div>
	            <div class="form-group">
	                <label>생년월일</label>
	                <input type="text" name="birth" placeholder="생년월일을 입력하시오">
	            </div>
	            <div class="form-group">
	                <label>주소</label>
	                <input type="text" name="addr_1" placeholder="주소를 입력하시오">
	            </div>
	            <div class="form-group">
	                <label>상세주소</label>
	                <input type="text" name="addr_2" placeholder="상세 주소를 입력하시오">
	            </div> -->
	            <div class="form-group">
	                <label>재학생 여부</label>
	                <input type="radio" name="current_student" value="true" style="width:10%">재학생
	            </div>
	           	<!--  <div class="form-group">
	               	<label>뭐해</label>
	                <input type="radio" name="vote_2019" value="false" style="width:10%; display:none;">
	            </div> -->
	             <button type="submit" style="margin-bottom:20px;">
                	가입하기
                </button>    
	    	</form>
	    </div>
    </div>
</body>
</html>