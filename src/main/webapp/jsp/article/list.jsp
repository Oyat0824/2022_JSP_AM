<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDateTime" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
// (자료형 지정)request.꺼내오기(키값)
List<Map<String, Object>> articleRows = (List<Map<String, Object>>)request.getAttribute("articleRows");
int curPage = (int)request.getAttribute("page");
int totalPage = (int)request.getAttribute("totalPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
<style type="text/css">
	.page {
		margin: 20px auto;
		text-align: center;
	}
	
	.page > a.red {
		color: red;
		font-weight: bold;
	}
</style>
</head>
<body>
	<%@ include file="../part/topBar.jsp" %>
	<h1>게시물 리스트</h1>
	<button type="button" onclick="location.href='../home/main'">메인화면</button>
	<button type="button" onclick="location.href='write'">게시물 작성</button>
	<table width="100%" border="2" bordercolor="#999" cellspacing="0" cellpadding="5">
	<colgroup>
		<col width="50px" />
		<col width="150px" />
		<col width="80px" />
		<col width="200px" />
	</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		
		<% for(Map<String, Object> articleRow : articleRows) { %>
		<tr>
			<td><%= (int)articleRow.get("id") %></td>
			<td><a href="detail?id=<%=(int)articleRow.get("id")%>"><%= (String)articleRow.get("title") %></a></td>
			<td><%= (String)articleRow.get("WriterName") %></td>
			<td><%= (LocalDateTime)articleRow.get("regDate") %></td>
		</tr>
		<% } %>
	</table>
	
	<div class="page">
		<% if(curPage > 1) { %>
			<a href="list?page=<%=1%>">&lt;&lt;</a> 
			<a href="list?page=<%=curPage-1%>">◀</a>
		<% } %>
		
		<% 
		int pageSize = 5;
		
		int from = curPage - pageSize;
		int end = curPage + pageSize;
		
		if(from < 1) from = 1;
		if(end > totalPage) end = totalPage;

		for(int i = from; i <= end; i++) {
		%>
			<a class="<%= curPage == i ? "red" : "" %>" href="list?page=<%= i %>"><%= i %></a>
		<% } %>
		
		<% if(curPage < totalPage) { %>
			<a href="list?page=<%=curPage+1%>">▶</a>
			<a href="list?page=<%=totalPage%>">&gt;&gt;</a>
		<% } %>
	</div>
</body>
</html>