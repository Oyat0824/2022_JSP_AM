<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="doLogin" method="post" onsubmit="LoginFormSubmit(this); return false">
		<label>아이디 : <input type="text" autocomplete="off" name="loginId" placeholder="아이디" /></label><br /><br />
		<label>비밀번호 : <input type="password" name="loginPw" placeholder="비밀번호" /></label><br /><br />
		
		<button type="submit">로그인</button>
		<button type="button" onclick="location.href='../home/main'">취소</button>
	</form>
</body>
<script>
function LoginFormSubmit(form) {
	// 로그인 아이디
	form.loginId.value = form.loginId.value.trim();
	// 로그인 비밀번호
	form.loginPw.value = form.loginPw.value.trim();
	
	// 아이디 공백 확인
	if(form.loginId.value.length == 0) {
		alert("아이디를 입력해주세요!");
		form.loginId.focus();
		return;
	}
	
	// 비밀번호 공백 확인
	if(form.loginPw.value.length == 0) {
		alert("비밀번호를 입력해주세요!");
		form.loginPw.focus();
		return;
	}
	
	form.submit();
}
</script>
</html>