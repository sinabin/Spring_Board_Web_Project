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
											console.log("zzzzzzzzzzzz")

											var user_password1 = document
											.getElementById('myinfo_input_userPassword1').value;
											var user_password2 = document
											.getElementById('myinfo_input_userPassword2').value;
											console.log("asdasdasd");
											console.log(user_password1);
											console.log(user_password2);
											
											if(user_password1 != user_password2){
												alert("변경할 비밀번호가 서로 일치하지 않습니다.");
											}

											$
													.ajax({
														type : 'post',
														url : '/userInfo/updatePassword',
														headers : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "POST"
														},
														dataType : 'text',
														data : JSON
																.stringify({
																	user_nick : user_password1
																}),
														success : function(
																result) {
															console.log(result);
															if (result == "SUCCESS") {
																alert("비밀번호 변경이 완료되었습니다.");
															} else if (result == "FAILED") {
																alert("현재 비밀번호가 올바르지 않습니다.");
															}
														}
													});
										});

					});