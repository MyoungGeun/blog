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
                    <form action="/board/update/${post.id}">
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
</body>
</html>