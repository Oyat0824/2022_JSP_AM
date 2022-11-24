<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="doJoin" method="post" onsubmit="JoinFormSubmit(this); return false">
		<label>아이디 : <input type="text" name="loginId" placeholder="아이디" /></label><br /><br />
		<label>비밀번호 : <input type="password" name="loginPw" placeholder="비밀번호" /></label><br /><br />
		<label>비밀번호 확인: <input type="password" name="loginPwChk" placeholder="비밀번호 확인" /></label><br /><br />
		<label>이름: <input type="text" name="name" placeholder="이름" /></label><br /><br />
		
		<button type="submit">가입</button>
		<button type="reset">초기화</button>
		<button type="button" onclick="location.href='../home/main'">취소</button>
	</form>
</body>
<script>
function JoinFormSubmit(form) {
	// 로그인 아이디
	form.loginId.value = form.loginId.value.trim();
	// 로그인 비밀번호
	form.loginPw.value = form.loginPw.value.trim();
	form.loginPwChk.value = form.loginPwChk.value.trim();
	// 이름
	form.name.value = form.name.value.trim();
	
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
	
	if(form.loginPwChk.value.length == 0) {
		alert("비밀번호 확인을 입력해주세요!");
		form.loginPwChk.focus();
		return;
	}
	
	// 이름 입력 확인
	if(form.name.value.length == 0) {
		alert("이름을 입력해주세요!");
		form.name.focus();
		return;
	}
	
	// 비밀번호 일치 체크
	if(form.loginPw.value != form.loginPwChk.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.loginPwChk.focus();
		return;
	}
	
	form.submit();
}
</script>
</html>