<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

</head>
<body>
	<div id="myInfoPageHeader">
		<h1 style="border-bottom: 1px solid;">&nbsp; 내 정보 관리</h1>
	</div>


	<div class="div_user_info">
		<label>아이디 : </label> <span>${UserInfo.user_id}</span>
	</div>

	<div class="div_user_info">
		<label>닉네임 : </label> <span>${UserInfo.user_nick}</span>
		<button class="btn btn-primary">
			<a id="update_nick_Atag" href="#updateNickModal" data-toggle="modal"
				data-target="#updateNickModal">닉네임 변경</a>
		</button>
	</div>

	<div class="div_user_info">
		<label>이메일 : </label> <span>${UserInfo.user_email}</span>
	</div>

	<div class="div_user_info">
		<label >회원등급 : </label> <span>${UserInfo.user_grade}</span>
	</div>

	<div class="div_user_info">
		<label >가입일자 : </label> <span><fmt:formatDate
				pattern="yyyy-MM-dd" value="${UserInfo.user_reg_date}" /></span>
	</div>

	<div id="myinfo_box-footer">
		<button class="btn btn-primary">
			<a id="update_passowrd" href="#updatePasswordModal"
				data-toggle="modal" data-target="#updatePasswordModal">패스워드 변경</a>
		</button>
		<button class="btn btn-primary">
			<a id="delete_user" href="#delete_userModal" data-toggle="modal"
				data-target="#delete_userModal">회원 탈퇴</a>
		</button>
		<button class="btn btn-primary">
			<a id="goto_myPost" href="/user/myPost">내글 목록</a>
		</button>
	</div>

	<!-- UpdateNickName Modal -->
	<form>
		<div class="modal fade" id="updateNickModal" tabindex="-1"
			role="dialog" aria-labelledby="logInModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="loginModalLabel">
							<i class="fas fa-sign-in-alt"></i>&nbsp 수정할 닉네임을 입력하세요.
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="" class="was-validated">
							<div class="form-group">
								<label for="userNick">닉네임</label><br> <input
									id='myinfo_input_userNick' type="text" placeholder="Enter Nick"
									required>
								<button id="btn_submit_nickName" type="button"
									class="btn btn-primary" style="margin-left: 60%;">변경하기</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<span>SAMOCNS</span>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- UpdatePassword Modal -->
	<form>
		<div class="modal fade" id="updatePasswordModal" tabindex="-1"
			role="dialog" aria-labelledby="logInModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="update_password_modal_ladbel">
							<i class="fas fa-sign-in-alt"></i>&nbsp 수정할 비밀번호를 입력하세요.
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="" class="was-validated">
							<div class="form-group">
								<input id='myinfo_input_CurrentuserPassword' type="password"
									placeholder="Enter passowrd" required> <label
									for="userpassword">현재 비밀번호</label><input
									id='myinfo_input_userPassword1' type="password"
									placeholder="Enter passowrd" required><label
									for="userpassword">&nbsp변경할 비밀번호</label><br> <input
									id='myinfo_input_userPassword2' type="password"
									placeholder="Enter passowrd" required> <label
									for="userpassword">변경할 비밀번호 확인</label><br>
									 <input id="input_behinded_userid" type="text" value="${UserInfo.user_id}" name="user_id" >
									 <input id="input_behinded_userpw" type="text" value="${UserInfo.user_pw}" name="user_pw" >
								<button id="btn_submit_password" type="button"
									class="btn btn-primary" style="margin-left: 60%;">변경하기</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>

							</div>
						</form>
					</div>
					<div class="modal-footer">
						<span>SAMOCNS</span>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	
		<!-- DeleteUser Modal -->
	<form>
		<div class="modal fade" id="delete_userModal" tabindex="-1"
			role="dialog" aria-labelledby="deleteUserlabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="deleteUser_modal_ladbel">
							<i class="fas fa-sign-in-alt"></i>&nbsp 회원 탈퇴
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="" class="was-validated">
							<div class="form-group">
							<span>탈퇴한 계정은 복구 할 수 없습니다. <br>계속 진행하시려면 '동의합니다' 5글자를 정확하게 입력해주세요.</span>
								<input id='text_confirmDelete' type="text"
									placeholder="문구 입력" required> <label
									for="userpassword"></label>
									 <input id="input_behinded_userid2" type="text" value="${UserInfo.user_id}" name="user_id" readonly="readonly" >
								<button id="btn_submit_delete" type="button"
									class="btn btn-primary" style="margin-left: 60%;">탈퇴하기</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>

							</div>
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

	<script>
	$(document)
			.ready(
					function() {
						$("#btn_my_post").on("click", function() {
							location.href = "/user/myPost";
						});
												

						// 닉네임 변경
						$("#btn_submit_nickName")
								.on(
										"click",
										function(evt) {

											var user_nick = document
													.getElementById('myinfo_input_userNick').value;
											console.log("asdasdasd");
											console.log(user_nick);

											$
													.ajax({
														type : 'post',
														url : '/userInfo/updateNick',
														headers : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "POST"
														},
														dataType : 'text',
														data : JSON
																.stringify({
																	user_nick : user_nick
																}),
														success : function(
																result) {
															console.log(result);
															if (result == "SUCCESS") {
																alert("닉네임 변경이 완료되었습니다.");
																location.href = "/user/myInfo"
															} else if (result == "FAILED") {
																alert("닉네임 변경에 실패했습니다.");
															}
														}
													});
										});

						// 비밀번호 변경
						$("#btn_submit_password")
								.on(
										"click",
										function(evt) {
											
											var result_PW_Validation = checkPW();
											
											if(result_PW_Validation==true){
												var user_id = document
												.getElementById('input_behinded_userid').value;
												console.log("현재 사용자 ID : " + user_id);
												
												var user_pw = document
												.getElementById('input_behinded_userpw').value;
												console.log("현재 사용자 PW : " + user_pw);
												
												
												var user_current_password = document
												.getElementById('myinfo_input_CurrentuserPassword').value;
												
												var user_password1 = document
												.getElementById('myinfo_input_userPassword1').value;
												
												var user_password2 = document
												.getElementById('myinfo_input_userPassword2').value;
												
												console.log("현재 비밀번호 : " + user_current_password);
												console.log("바꿀 비밀번호 : " + user_password1);
												console.log("바꿀 비밀번호 확인 : "+ user_password2);
												
												if(user_password1 != user_password2){
													alert("변경할 비밀번호가 서로 일치하지 않습니다.");
												}else{
													$
													.ajax({
														type : 'POST',
														url : '/userInfo/updatePassword',
														headers : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "POST"
														},
														dataType : 'text',
														data : JSON
																.stringify({
																	user_id : user_id,
																	user_pw : user_pw,
																new_user_pw : user_password1
																}),
														success : function(
																result) {
															console.log(result);
															if (result == "SUCCESS") {
																alert("비밀번호 변경이 완료되었습니다.");
																location.href = "/user/myInfo";
															} else if (result == "FAILED") {
																alert("비밀번호 변경에 실패했습니다.");
																location.href = "/user/myInfo";
															}
														}
													});
												}
											}
											
											
											

										});
						
						// 회원탈퇴
						$("#btn_submit_delete")
								.on(
										"click",
										function(evt) {
											
											var confirm_text = document
											.getElementById('text_confirmDelete').value;
											
											if(confirm_text !="동의합니다"){
												alert("문구가 잘못 작성되었습니다. 문구를 올바르게 입력해주세요.")
											}else{
												var user_id = document
												.getElementById('input_behinded_userid2').value;


										$
												.ajax({
													type : 'post',
													url : '/userInfo/deleteUser',
													headers : {
														"Content-Type" : "application/json",
														"X-HTTP-Method-Override" : "POST"
													},
													dataType : 'text',
													data : JSON
															.stringify({
																user_id : user_id
															}),
													success : function(
															result) {
														console.log(result);
														if (result == "SUCCESS") {
															alert("회원탈퇴가 정상적으로 처리되었습니다.");
															location.href = "/user/logout"
														} else if (result == "FAILED") {
															alert("회원탈퇴 실패");
														}
													}
												});
											}
											
										});
						
						//비밀번호 유효성 검사 함수
						function checkPW(){

							 var pw = $("#myinfo_input_userPassword1").val();
							 var num = pw.search(/[0-9]/g);
							 var eng = pw.search(/[a-z]/ig);
							 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

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

					});
</script>

</html>