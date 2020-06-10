<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div id="login_form">
		<form action="login" method="post">
			<table id="login_form_table">
				<tr>
					<td><input type="text" placeholder="아이디를 입력하세요" name="id"
						id="id"></td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호를 입력하세요"
						name="password" id="password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인" id="login_button"></td>
				</tr>
			</table>
			<input type="hidden" name="commandType" value="select">
		</form>
	</div>
	<script type="text/javascript" src="javaScript/login_join.js"></script>
</body>
</html>