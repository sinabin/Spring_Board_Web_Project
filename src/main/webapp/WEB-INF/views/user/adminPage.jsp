<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div id="adminPageHeader">
		<h1 style="border-bottom: 1px solid;">&nbsp; 회원관리</h1>
	</div>

	<div id="board_table">
		<table class="table table-bordered">
			<tr>
				<th>회원 ID</th>
				<th>회원 등급</th>
				<th>이메일</th>
				<th>가입일자</th>
			</tr>

			<c:forEach items="${AdminInfo}" var="UserVO">
				<tr>
					<td><input style="border: 0px;" type="text" value="${UserVO.user_id}" readonly="readonly"></td>
					<td>${UserVO.user_grade}<select>
							<option value="none">===선택하세요.===</option>
							<option value="admin">관리자계정</option>
							<option value="nomal">일반회원</option>
					</select>
					</td>
					<td>${UserVO.user_email}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${UserVO.user_reg_date}" /></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	
	<div id ="adminPage_footer">
		<button id="btn_reloadGrade" type="button" class="btn btn-primary">회원 등급 변경</button>
	</div>
</body>
</html>