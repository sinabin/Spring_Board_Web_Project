<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head >
<meta charset="utf-8">
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	

<script>
	$(document).ready(function() {
		let s1 = document.getElementById("input_behinded_userid").value;
		console.log(s1);
		
		$('#summernote').summernote({
			height : 400, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true,
			lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
		// set focus to editable area after initializing summernote
		});
	});

	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>

<title>SAMOCNS</title>

</head>
<body>
	<div class="box_body">
		<form action="/board/register" role="form" method="post">
			<div class="box-body">
				<div class="form-group">
					<span class="span_border"><label for="exampleInputEmail">게시판</label></span>
					<span> <select name="category">
							<option value="공지사항">공지사항</option>
							<option value="자유게시판">자유게시판</option>
							<option value="제품 Q&A">제품 Q&A</option>
							<option value="개인정보보호 및 관리 토론">개인정보보호 및 관리 토론</option>
					</select>
					</span>
				</div>

				<div class="form-group">
					<label for="exampleInputTitle">Title</label> <input type="text"
						name="title" class="form-control" placeholder="Enter Title">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">Content</label>
					<textarea name="content" id="summernote" value=""></textarea>
				</div>

				<div id = "behinded_userid" class="form-group">
					<input id = "input_behinded_userid" type="text" value="${UserInfo.user_id}"
						name="user_id" placeholder="Enter Title">
				</div>

			</div>

			<!-- /.box-body -->
			<div class="footer" style="text-align: center;">
				<button id="btn_writing" type="submit" class="btn btn-primary" style="width: 30%; margin-left: 5%">등록하기</button>
			</div>
		</form>
	</div>


</body>
</html>