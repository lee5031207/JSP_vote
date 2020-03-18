<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 투표 시스템</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="./css/main2.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="./css/swiper.min2.css">
<link href="./css/agree.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	function check(){
		 var req = document.form.req.checked;
		 var num = 0;
		 if(req == true){
		  num = 1;
		 }
		 if(num==1){
		  location.href="./vote.jsp";
		 }else{
		  alert("개인정보 약관에 동의하셔야 합니다.");
		 }
		}
</script>
</head>
<body>
	<%
	if(session.getAttribute("student_id") == null){
		%><script>alert('로그인 후 이용해주세요')</script><%
		%><script>location.href="./login.jsp"</script><%
	}
	%>
	<div class="container" style="padding-top: 40px;">
		<div class="col-md-6" style="border-radius: 10px; padding-top: 20px;">
			<h2>이용약관</h2><br>
			<div class="agree">
			    어쩌구 저쩌구
			</div><br>
			<form name="form">
			<div><input type="checkbox" name="req">
			<label for="agree">상기 내용을 숙지하였으며, 약관에 동의 합니다.</label></div>
			<button type="button" class="btn btn-default" onclick="location='./main.jsp'" style="margin-left:19%;">이전</button>
			<button type="button" class="btn btn-default" onclick="check()">다음</button>
			</form>
		</div>
	</div>
</body>
</html>