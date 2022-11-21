<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 몇단을 할지
String inputDan = request.getParameter("dan");
if(inputDan == null) {
	inputDan = "1";
}

// 몇까지 할지
String inputLimit = request.getParameter("limit");
if(inputLimit == null) {
	inputLimit = "9";
}

// 전체 색상 변경
String inputColor = request.getParameter("color");
if(inputColor == null) {
	inputColor = "black";
}

// 가져온 파라미터 값은 String 이기에 형변환을 해줘야함
int dan = Integer.parseInt(inputDan);
int limit = Integer.parseInt(inputLimit);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 테스트 결과물</title>
</head>
<body>
	<div style="color: <%= inputColor %>">== <%= dan %>단 출력 ==</div>
	<% for(int i = 1; i <= limit; i++) { %>
		<div style="color: <%= inputColor %>"><%= dan %> * <%= i %> = <%= dan * i %></div>
	<% } %>
</body>
</html>