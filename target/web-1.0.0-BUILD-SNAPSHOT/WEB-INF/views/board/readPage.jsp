<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header.jsp"%>
<!-- include summernote css/js-->


<!DOCTYPE html>
<html>
<head>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<meta charset="UTF-8">
<title>Spring Web_project</title>
<link rel="stylesheet" href="/resources/css/mycss.css">
<script>
	$(document).ready(function() {
		let formObj = $("form[role='form']");

		console.log(formObj);
		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/");
			formObj.submit();
		});

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/board/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();

		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/board/remove");
			formObj.submit();
		});
		
		ele = document.getElementById('text_content').value;
		console.log(ele);
		var newText =ele.replace(/(<([^>]+)>)/ig,"");
		console.log(newText);
		document.getElementById('text_content').value = newText;
	

	});
</script>


</head>
<body>

	<form role="form" action="modifyPage" method="post">
		<input type='hidden' name='bno' value="${boardVO.bno}"> <input
			type='hidden' name='page' value="${cri.page}"> <input
			type='hidden' name='perPageNum' value="${cri.perPageNum}">
	</form>

	<div class="box_body">
		<div class="form-group">
			<br>
			<input type="text" name="title" class="form-control" style="font-size: 30px;" value="${boardVO.title}" readonly="readonly">
			<br>
			<label>카테고리</label>
			<span>${boardVO.category}</span>
			<br>
			<label>작성자</label>
			<span>${boardVO.user_id}</span>
		</div>
		<div class="form-group">
			<label>Content</label>
			<textarea id="text_content" style = "height:500px" class="form-control" name="content" rows="3"
				readonly="readonly">${boardVO.content}</textarea>
		</div>
	</div>

	<!-- /.box-body -->
	<div>
		<button type="submit" class="btn btn-primary" style="width: 25%; margin-left: 35%">메인으로</button>
	</div>



</body>
</html>