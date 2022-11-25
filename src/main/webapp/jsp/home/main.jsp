<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	boolean isLogined = (boolean)request.getAttribute("isLogined");
	int LoginedMemberId = (int)request.getAttribute("LoginedMemberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h1>메인 페이지</h1>
	<div>
		<% if(isLogined) { %>
			<span><%= LoginedMemberId %>번 회원</span>
			<a href="../member/doLogout">로그아웃</a>
		<% } %>
		
		<% if(!isLogined) { %>
			<a href="../member/login">로그인</a>
			<a href="../member/join">회원가입</a>
		<% } %>
		<a href="../article/list">게시물 리스트</a>
	</div>
</body>
</html>