<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDateTime" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
// (자료형 지정)request.꺼내오기(키값)
Map<String, Object> articleRow = (Map<String, Object>)request.getAttribute("articleRow");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<h1><%= (int)articleRow.get("id") %>번 게시물</h1>
	<div>번호 : <%= (int)articleRow.get("id") %> 번</div>
	<div>날짜 : <%= (LocalDateTime)articleRow.get("regDate") %></div>
	<div>제목 : <%= (String)articleRow.get("title") %></div>
	<div>내용 : <%= (String)articleRow.get("body") %></div>
	
	<button onclick="location.href='list'">목록</button>
	<button onclick="location.href='modify?id=<%= (int)articleRow.get("id") %>'">수정</button>
	<button onclick="deleteChk(<%= (int)articleRow.get("id") %>)">삭제</button>
</body>
<script>
function deleteChk(id) {
	if(confirm('삭제하시겠습니까?') == false) {
		return false;
	} else {
		location.href="doDelete?id="+id;
	}
}
</script>
</html>