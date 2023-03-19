<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.spring.domain.UserVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootstrap css-->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/mycss.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="/resources/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/js/bootstrap.js" type="text/javascript"></script>
<script src="/resources/js/summernote-ko-KR.js" type="text/javascript"></script>
<!-- other bootStrap : resources에 있는 css랑 js 라이브러리랑 다른 기능을 함-->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"  rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- fontAwesome 관련 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- ID 중복체크 이벤트 처리 -->
<script>
	$(document).ready(function() {

		// 중복 ID 체크 및 유효성 검사
		$("#check_duplication_id").on("click", function(evt) {
			evt.preventDefault();
			let user_id = document.getElementById("input_userID").value;
			
			let result_ID_Validation = checkID();
			if(result_ID_Validation==true){ // ID 유효성 검사 통과시 ID 중복체크 수행
				$.ajax({
					type : 'post',
					url : '/signUp/check_duplication_id',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						user_id : user_id
					}),
					success : function(result) {
						console.log(result);
						if (result == "DUPLICATED") {
							alert("이미 등록된 아이디입니다.");
						} else if (result == "VALIED") {
							alert("사용가능한 아이디입니다.");
						}
					}
				});
			}
		});
		
		//비밀번호 유효성 검사 함수
		function checkPW(){

			 let pw = $("#input_userPW").val();
			 let num = pw.search(/[0-9]/g);
			 let eng = pw.search(/[a-z]/ig);
			 let spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			 if(pw.length < 8 || pw.length > 16){

			  alert("비밀번호는 8자리 ~ 16자리 이내로 입력해주세요.");
			  return false;
			 }else if(pw.search(/\s/) != -1){
			  alert("비밀번호는 공백 없이 입력해주세요.");
			  return false;
			 }else if(num < 0 || eng < 0 || spe < 0 ){
			  alert("비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			  return false;
			 }else {
				console.log("통과"); 
			    return true;
			 }

			}
		
		//ID 유효성 검사 함수 
		function checkID(){

			 let id = $("#input_userID").val();

			 let eng = id.search(/^[a-zA-Z]*$/);
			 let num = id.search(/[0-9]/g);

			 if(id.length < 6 || id.length > 12){

			  alert("아이디는 6자리 ~ 12자리 이내로 입력해주세요.");
			  return false;
			 }else if(id.search(/\s/) != -1){
			  alert("아이디는 공백 없이 입력해주세요.");
			  return false;
			 }else if(eng < 0 ){
			  alert("아이디는 영문으로만 작성해주세요");
			  console.log()
			  return false;
			 }else {
				console.log("통과"); 
			    return true;
			 }

			}
		// 이메일 유효성 검사
		function checkEmail(email) {
			let re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			
			if(re.test(email)==false){
				alert("올바르지 않은 이메일 형식입니다.");
				return false;
			}else{
				return true;
			}
			return ture;
			}
		
		
		// 회원가입 버튼 클릭기능
		$("#submit_signUp").on("click", function(evt) {
			evt.preventDefault();
						let user_id = document.getElementById("input_userID").value;
						let user_pw = document.getElementById("input_userPW").value;
						let user_nick = document.getElementById("input_userNick").value;
						let user_email = document.getElementById("input_userEmail").value;
						
						let result_PW_Validation = checkPW();
						let result_ID_Validation = checkID();
						let result_Emauil_Validation = checkEmail(user_email);
			
			if(result_ID_Validation ==true){
				if(result_ID_Validation==true){
					if(result_Emauil_Validation==true){

						$.ajax({
							type : 'post',
							url : '/signUp/register',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							dataType : 'text',
							data : JSON.stringify({
								user_id : user_id,
								user_pw : user_pw,
								user_nick : user_nick,
								user_email : user_email
							}),
							success : function(result) {
								console.log(result);
								if (result == "SUCCESS") {
									alert("회원 가입이 완료되었습니다.");
									location.href = "/"
								} else if (result == "FAILED") {
									alert("회원가입에 실패하였습니다. 입력된 정보를 확인해주세요.");
								}
							}
						});
					}
				}
			}
		});
	});
</script>
</head>
<body>
<!-- 상단 부분 -->
	<%
	UserVO vo = (UserVO) session.getAttribute("login");

	if (session.getAttribute("login") == null) { // 비로그인 상태
	%>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a id="main_logo" class="navbar-brand ps-3" href="/"><img
			alt="brand" src="/resources/img/logo.png"></a>
		<!-- Sidebar Toggle-->
		<!-- Navbar-->
		<ul id="nav_dropDown" class="navbar-nav ms-auto ms-md-0 me-3 me-lg-3">
			<li id="nav_dropDown_item" class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#loginModal"
						data-toggle="modal" data-target="#loginModal">로그인</a></li>
					<li><a class="dropdown-item" href="#singUpModal"
						data-toggle="modal" data-target="#signUpModal">회원가입</a></li>
					<li><hr class="dropdown-divider" /></li>
				</ul></li>
		</ul>
	</nav>

	<%
	} else if (session.getAttribute("login") != null && vo.getUser_grade().equals("관리자계정")) { //관리자 계정으로 로그인시
	%>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a id="main_logo" class="navbar-brand ps-3" href="/"><img
			alt="brand" src="/resources/img/logo.png"></a>
		<!-- Sidebar Toggle-->
		<!-- Navbar-->
		<ul id="nav_dropDown" class="navbar-nav ms-auto ms-md-0 me-3 me-lg-3">
			<li id="nav_dropDown_item" class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="/user/myInfo">내정보</a></li>
					<li><a class="dropdown-item" href="/user/myPost">내가쓴 게시물</a></li>
					<li><a class="dropdown-item" href="/user/logout">로그아웃</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="/user/adminPage">관리자 페이지</a></li>
				</ul></li>
		</ul>
	</nav>
	<%
	} else { // 일반 계정로그인시
	%>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a id="main_logo" class="navbar-brand ps-3" href="/"><img
			alt="brand" src="/resources/img/logo.png"></a>
		<!-- Sidebar Toggle-->
		<!-- Navbar-->
		<ul id="nav_dropDown" class="navbar-nav ms-auto ms-md-0 me-3 me-lg-3">
			<li id="nav_dropDown_item" class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="/user/myInfo">내정보</a></li>
					<li><a class="dropdown-item" href="/user/myPost">내가쓴 게시물</a></li>
					<li><a class="dropdown-item" href="/user/logout">로그아웃</a></li>
					<li><hr class="dropdown-divider" /></li>
				</ul></li>
		</ul>
	</nav>
	<%
	}
	%>

	<!-- Login Modal -->
	<form action="/user/loginPost" method="post">
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
			aria-labelledby="logInModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="loginModalLabel"><i class="fas fa-sign-in-alt"></i>&nbsp Log In</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body">
						<form action="" class="was-validated">
							<div class="form-group">
								<label for="user_id">아이디 </label> <input type="text" class="form-control" id="userId" placeholder="Enter ID" name="user_id" required>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<div class="form-group">
								<label for="user_pw">비밀번호 </label> <input type="password" class="form-control" id="userPw" placeholder="Enter Password" name="user_pw" required>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<button type="submit" class="btn btn-primary" style="margin-left: 70%;">로그인</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</form>
					</div>
					<div class="modal-footer">
						<span>SAMOCNS</span>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- signUp Modal -->
	<form>
		<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
			aria-labelledby="logInModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="loginModalLabel"><i class="fas fa-sign-in-alt"></i>&nbsp SignUp</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body">
						<form action="" class="was-validated">
							<div class="form-group">
								<label for="userId">아이디</label><br> <input type="text" minlength="6" maxlength="12" id="input_userID" placeholder="Enter ID" name="userId" required>
								<button type="submit" id="check_duplication_id" class="btn btn-secondary">ID 중복체크</button>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<div class="form-group">
								<label for="userPw">비밀번호 </label> <input type="password" class="form-control" id="input_userPW" placeholder="Enter Password" name="userPw" required>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<div class="form-group">
								<label for="userPw">닉네임 </label> <input type="text" class="form-control" id="input_userNick" placeholder="Enter NickName" name="userNick" required>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<div class="form-group">
								<label for="userPw">이메일 </label> <input type="email" class="form-control" id="input_userEmail" placeholder="Enter your Email" name="userEmail" required>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
							<button id="submit_signUp" type="submit" class="btn btn-primary" style="margin-left: 65%;">가입하기</button>
							<button type="submit" class="btn btn-danger" data-dismiss="modal">취소</button>
						</form>
					</div>
					<div class="modal-footer">
						<span>SAMOCNS</span>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>