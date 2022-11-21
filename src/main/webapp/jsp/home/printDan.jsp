<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String inputDan = request.getParameter("dan") == null ? "1" : request.getParameter("dan");
String inputLimit = request.getParameter("limit") == null ? "9" : request.getParameter("limit");
String color = request.getParameter("color") == null ? "black" : request.getParameter("color");

int dan = Integer.parseInt(inputDan);
int limit = Integer.parseInt(inputLimit);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="color: <%= color %>">== <%= dan %>단 출력 ==</div>
	<% for(int i = 1; i <= limit; i++) { %>
		<div style="color: <%= color %>"><%= dan %> * <%= i %> = <%= dan * i %></div>
	<% } %>
</body>
</html>