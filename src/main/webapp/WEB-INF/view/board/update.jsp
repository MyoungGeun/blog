<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Post</title>
</head>
<body>
    <h1>Update Post</h1>
    <form action="/board/update/${post.id}" method="post">
        <label for="title">Title:</label><br>
        <input type="text" id="title" name="title" value="${post.title}"><br>
        <label for="content">Content:</label><br>
        <textarea id="content" name="content">${post.content}</textarea><br>
        <label for="author">Author:</label><br>
        <input type="text" id="author" name="author" value="${post.author}"><br><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
