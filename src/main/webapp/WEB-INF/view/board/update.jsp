<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="container p-5">
		<div class="card">
			<div class="card-header">
				<b>익명 글쓰기 화면입니다</b>
			</div>
			<div class="card-body">
				<form action="/board/update/${board.id}" method="post">
					<div class="mb-3">
						<input type="text" class="form-control" placeholder="작성자"
							name="author" maxlength="10" value="${board.author}">
					</div>
					<div class="mb-3">
						<input type="text" class="form-control" placeholder="제목"
							name="title" maxlength="20" value="${board.title}">
					</div>
					<div class="mb-3">
						<textarea class="form-control" rows="5" name="content"
							maxlength="20">${board.content}</textarea>
					</div>
					<button type="submit" class="btn btn-primary form-control">글쓰기완료</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
