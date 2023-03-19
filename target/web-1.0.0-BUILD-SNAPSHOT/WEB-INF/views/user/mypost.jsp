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
	<div id="board_table">
		<table class="table table-bordered">
			<tr align="center">
				<th>게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>관리 </th>
			</tr>

			<c:forEach items="${UserMyPost}" var="boardVO">
				<tr>
					<td>${boardVO.category}</td>
					<td><a href="/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}">${boardVO.title}</a></td>
					<td>${boardVO.user_id}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${boardVO.board_reg_date}" /></td>
					<td><span class="badge bg-red">${boardVO.view_cnt}</span></td>
					<td>
					<button type="submit" id = "btn_goto_modify" class="btn btn-primary"><a id="Atag_modify" href="/board/modifyPage/${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}">수정</a></button>
					<form action="/board/remove/${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}" method="post">
					<input id ="behind_bno" type="text" value="${boardVO.bno}">
					 <button type="submit" id = "btn_goto_remove" class="btn btn-danger">삭제</button>
					</form>
					
					</td>
				</tr>
			</c:forEach>

		</table>
	</div>

	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li>
					<a href="${pageMaker.makeSearch(pageMaker.startPage -1) }">&laquo;</a>
				</li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
					<a href="${pageMaker.makeSearch(idx)}" > ${idx}</a>
				</li>			
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			 	<li>
					<a href="${pageMaker.makeSearch(pageMaker.endPage +1)}" >&raquo;</a>
				</li>
			</c:if>
		</ul>
	</div>
	

</body>
</html>