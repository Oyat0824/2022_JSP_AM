<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDateTime" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// (자료형 지정)request.꺼내오기(키값)
Map<String, Object> articleRow = (Map<String, Object>)request.getAttribute("articleRow");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
	<h1><%= (int)articleRow.get("id") %>번 게시물 수정</h1>
	<form action="doModify" method="post">
		<input type="hidden" name="id" value="${param.id}"/>
		<div>번호 : <%= (int)articleRow.get("id") %>번</div>
		<div>날짜 : <%= (LocalDateTime)articleRow.get("regDate") %></div>
		<label>제목 : <input type="text" name="title" placeholder="제목을 적어주세요." required="required" value="<%= (String)articleRow.get("title") %>"/></label><br /><br />
		<label>내용 : <textarea name="body" cols="22" rows="5" placeholder="내용을 적어주세요."><%= (String)articleRow.get("body") %></textarea></label><br /><br />
		
		<button type="button" onclick="location.href='list'">목록</button>
		<button type="submit">수정</button>
		<button type="reset">초기화</button>
	</form>
</body>
</html>