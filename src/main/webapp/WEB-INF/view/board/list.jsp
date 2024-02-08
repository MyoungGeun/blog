<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <%@ include file="/WEB-INF/view/layout/header.jsp" %> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.btn {
	padding: 6px 10px;
	font-size: 14px; border-radius;
	margin-right: 5px;
}

.btn-edit {
	background-color: #FFA500;
	color: black;
	border: none;
}

.btn-delete {
	background-color: #DC143C;
	color: white;
	border: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form action="/board/list" method="get">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
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
							<form action="/board/delete/${post.id}" method="post">
								<button class="btn btn-delete">삭제</button>
							</form>
						</td>
						<td>
							<form action="/board//update/${post.id}" method="post">
								<button class="btn btn-edit">수정</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>