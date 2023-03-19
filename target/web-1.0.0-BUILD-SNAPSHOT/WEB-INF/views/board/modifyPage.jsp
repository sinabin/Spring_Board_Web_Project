<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			location.href = "/user/myPost"
		});

		$(".btn-primary").on("click", function() {
			formObj.submit();
		});
	});

	$(document).ready(function() {
		$('#summernote').summernote({
			height : 400, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		});
	});

	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/board/modify" role="form" method="post">
		<div class="box_body">
			<div class="form-group">
				<label>Title</label>
				<input type="text" value="${BoardVO.title}" name="title" class="form-control">
					<input id="input_behinded_userid" type="text" value="${BoardVO.user_id}" name="user_id">
					<input id="input_behinded_bno" type="text" value="${BoardVO.bno}" name="bno" >
			</div>

			<div class="form-group">
				<label>Content</label>
				<textarea name="content" id="summernote">${BoardVO.content}</textarea>
			</div>
			
		</div>

		<!-- /.box-body -->
		<div class="box-footer">
			<button type="submit" class="btn btn-primary">수정하기</button>
			<button type="submit" class="btn btn-warning">취소</button>
		</div>
	</form>

</body>
</html>