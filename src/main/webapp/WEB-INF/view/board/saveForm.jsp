<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="container p-5">
    <div class="card">
        <div class="card-header"><b>익명 글쓰기 화면입니다</b></div>
        <div class="card-body">
            <form action="/board/save" method="post">
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="작성자" name="author" maxlength="10">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="제목 (20글자 이하)" name="title" maxlength="20">
                </div>
                <div class="mb-3">
                    <textarea class="form-control" rows="5" name="content" maxlength="20" placeholder="20글자까지 작성 가능"></textarea>
                </div>
                <button type="submit" class="btn btn-primary form-control">글쓰기완료</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>  