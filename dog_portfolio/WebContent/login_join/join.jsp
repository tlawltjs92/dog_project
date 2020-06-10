<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div id="join_form">
		<form action="signup" method="post" id="joinform">
			<table id="join_form_table">
				<tr>
					<td><input type="text" placeholder="아이디(영문 대소문자와 숫자 4~15자리)"
						name="id" id="id" size="30" autocomplete="off"></td>
				</tr>
				<tr>
					<td><input type="password"
						placeholder="비밀번호(영문 대소문자와 숫자 4~20자리)" name="password"
						id="password" size="30"></td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호 확인"
						name="password_ck" id="password_ck" size="30"></td>
				</tr>
				<tr>
					<td><input type="text"
						placeholder="닉네임(한글 영문 대소문자와 숫자 2~15자리)" name="name" id="name"
						size="30"></td>
				</tr>
				<tr>
					<td><input type="date" placeholder="생년월일" name="birth"
						id="birth" size="30"></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="전화번호( - 포함하여 입력해주세요)"
						name="phone" id="phone" size="30"></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="주소" name="address"
						id="address" size="30"></td>
				</tr>
				<tr>
					<td><input type="email" placeholder="이메일(형식에 맞게 입력해주세요)"
						name="email" id="email" size="30"></td>
				</tr>
				<tr>
					<td><input type="button" value="회원가입" id="join_button" onclick="checkAll()"></td>
				</tr>
			</table>
			<input type="hidden" name="commandType" value="insert">
		</form>
	</div>
	<script type="text/javascript" src="../main/javaScript/login_join.js"></script>
</body>
</html>