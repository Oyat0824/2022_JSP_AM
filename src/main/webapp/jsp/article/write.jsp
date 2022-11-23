<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<h1>게시물 작성</h1>
	<form action="doWrite" method="post">
		<label>제목 : <input type="text" name="title" placeholder="제목을 적어주세요." required="required" /></label><br /><br />
		<label>내용 : <textarea name="body" cols="22" rows="5" placeholder="내용을 적어주세요."></textarea></label><br /><br />
		
		<button type="button" onclick="location.href='list'">목록</button>
		<button type="submit">작성</button>
		<button type="reset">초기화</button>
	</form>
</body>
</html>