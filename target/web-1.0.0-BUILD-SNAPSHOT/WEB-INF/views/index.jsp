<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Spring_Web_board_Project</title>
<script>
	$(document).ready(
			function() {
				$('#btn_writer').on("click", function(evt) {
					self.location = "/board/register";
				});

				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "/" + '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});

			});
</script>

</head>
<body>


	<div id="nav_searchbar_container" class="container">
		<nav id="nav_searchbar_box" class="navbar navbar-light bg-dark">
			<i id="search_icon" class="fas fa-search fa-2x"></i>
			<form id="search_form" class="d-flex">
				<select name="searchType">
					<option value="t"
						<c:out value="${cri.searchType eq 't' ? 'selected':''}"/>>
						Title</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c' ? 'selected':''}"/>>
						Content</option>
					<option value="w"
						<c:out value="${cri.searchType eq 'w' ? 'selected':''}"/>>
						Writer</option>
					<option value="tc"
						<c:out value="${cri.searchType eq 'tc' ? 'selecte':''}"/>>
						Title OR Content</option>
					<option value="cw"
						<c:out value="${cri.searchType eq 'cw' ? 'selecte':''}"/>>
						Content OR Writer</option>
					<option value="tcw"
						<c:out value="${cri.searchType eq 'tcw' ? 'selecte':''}"/>>
						Title OR Content OR Writer</option>
				</select> <input type="text" name="keyword" id="keywordInput"
					value="${cri.keyword}">
				<button id='searchBtn' class="btn btn-outline-success">Search</button>
			</form>
		</nav>
	</div>

	<!-- /.box-body -->	
		<ul id="perPage_dropDown" class="navbar-nav ms-auto ms-md-0 me-3 me-lg-3">
			<li id="nav_dropDown_item" class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">5개씩 보기</a>
				<ul class="dropdown-menu dropdown-menu"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="/pn?perPageNum=5">5개씩 보기</a></li>
					<li><a class="dropdown-item" href="/pn?perPageNum=10">10개씩 보기</a></li>
					<li><a class="dropdown-item" href="/pn?perPageNum=20">20개씩 보기</a></li>
					<li><a class="dropdown-item" href="/pn?perPageNum=50">50개씩 보기</a></li>
					<li><a class="dropdown-item" href="/pn?perPageNum=100">100개씩 보기</a></li>
				</ul></li>
		</ul>
	
	<div id="board_table">
		<table class="table table-bordered">
			<tr align="center">
				<th>게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

			<c:forEach items="${list}" var="boardVO">
				<tr>
					<td>${boardVO.category}</td>
					<td><a
						href="/board/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}">${boardVO.title}</a></td>
					<td>${boardVO.user_id}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${boardVO.board_reg_date}" /></td>
					<td><span class="badge bg-red">${boardVO.view_cnt}</span></td>
				</tr>
			</c:forEach>

		</table>
	</div>

	<div>
		<button id="btn_writer" type="button" class="btn btn-primary"  style="width:30%; margin-left: 35%;">글 작성하기</button>
	</div>

	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="${pageMaker.makeSearch(pageMaker.startPage -1) }">&laquo;</a>
				</li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
					<a href="${pageMaker.makeSearch(idx)}"> ${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</div>

</body>
</html>