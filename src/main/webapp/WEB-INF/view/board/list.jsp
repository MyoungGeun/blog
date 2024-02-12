<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<form action="/board/list" method="get">
	<div class="container p-5">

    <table class="table table-striped">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${board}" var="post" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>
            <td>${post.title}</td>
            <td>${post.content}</td>
            <td>${post.author}</td>
            <td>
                <div class="d-flex">
                    <form action="/board/delete/${post.id}" method="post">
                        <button class="btn btn-danger">삭제</button>
                    </form>
                    <form action="/board/update/${post.id}" method="get">
                        <button class="btn btn-warning">수정</button>
                        
                    </form>
                </div>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</form>
<script>
    $(document).ready(function() {
        $(".updateBtn").click(function(event) {
            event.preventDefault(); // 기본 동작 중단
            var postId = $(this).data("id"); // 수정할 글의 ID 가져오기
            
            // AJAX 요청
            $.ajax({
                type: "GET",
                url: "/board/update/" + postId, // 수정할 글의 내용을 가져올 경로
                success: function(response) {
                    // AJAX 요청 성공 시 모달 창에 글 내용 표시
                    $("#updateModal").modal("show");
                    $("#updateForm").attr("action", "/board/update/" + postId); // 수정할 글의 ID를 포함한 수정 액션 URL 설정
                    $("#author").val(response.author); // 작성자 필드에 가져온 작성자 정보 설정
                    $("#title").val(response.title); // 제목 필드에 가져온 제목 정보 설정
                    $("#content").val(response.content); // 내용 필드에 가져온 내용 정보 설정
                },
                error: function(xhr, status, error) {
                    // AJAX 요청 실패 시 처리
                    alert("글 내용을 가져오는 중 오류가 발생했습니다.");
                }
            });
        });
    });
</script>
</body>
</html>