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
	.page > a.red {
		color: red;
		font-weight: bold;
	}
</style>
</head>
<body>
	<h1>게시물 리스트</h1>
	<table border="2" bordercolor="#999" cellspacing="0" cellpadding="5">
		<colgroup>
			<col width="50" />
			<col width="150" />
			<col width="200" />
		</colgroup>
		
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>삭제</th>
		</tr>
		
		<% for(Map<String, Object> articleRow : articleRows) { %>
		<tr>
			<td><%= (int)articleRow.get("id") %></td>
			<td><a href="detail?id=<%=(int)articleRow.get("id")%>"><%= (String)articleRow.get("title") %></a></td>
			<td><%= (LocalDateTime)articleRow.get("regDate") %></td>
			<td><a href="javascript:void(0)" onclick="doDelete(<%= (int)articleRow.get("id") %>)">삭제</a></td>
		</tr>
		<% } %>
	</table>
	
	<div class="page">
		<% for(int i = 1; i <= totalPage; i++) { %>
			<a class="<%= curPage == i ? "red" : "" %>" href="list?page=<%= i %>"><%= i %></a>
		<% } %>
	</div>
</body>

<script type="text/javascript">
function doDelete(id) {
	if(confirm("삭제하시겠습니까?")) {
		location.href="doDelete?id="+id;
	}
}
</script>
</html>