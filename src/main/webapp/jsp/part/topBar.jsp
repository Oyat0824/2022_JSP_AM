<%@ page import="java.util.Map" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean isLogined = (boolean)request.getAttribute("isLogined");
	int loginedMemberId = (int)request.getAttribute("loginedMemberId");
	String loginedMemberName = (String) request.getAttribute("loginedMemberName");
%>
<style type="text/css">
ul, ol, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

.top-bar {
	display: flex;
	justify-content: space-between;
	height: 50px;
	background-color: #ddd;
}

.top-bar > .left,
.top-bar > .right {
	display: flex;
	align-items: center;
}

.top-bar > .left > .logo,
.top-bar > .right > .inout {
	margin: 0 20px;
}

</style>

<div class="top-bar">
	<div class="left">
		<div class="logo">HOME</div>
		<div class="menu">
			<ul>
				<li><a href="../article/list">게시물 리스트</a></li>
			</ul>
		</div>
	</div>
	
	<div class="right">
		<div class="name">
			<% if (isLogined) { %>
			[ <%= loginedMemberName %> ] 
			<% } %>
		</div>
		<div class="inout">
			<% if (isLogined) { %>
			<a href="../member/doLogout">로그아웃</a>
			<%
			}
			%>
			<% if (!isLogined) { %>
			<a href="../member/login">로그인</a>
			<a href="../member/join">회원가입</a>
			<% } %>
		</div>
	</div>
</div>
