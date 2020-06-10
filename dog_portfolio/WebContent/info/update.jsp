<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userID = (String) session.getAttribute("userID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/total.css">
</head>
<body>
	<div id="info_form">
		<form action="update_check" method="post">
		<h3 style="text-align: center;">회원 정보 수정을 원하시면 비밀번호를 입력하세요.</h3>
			<table id="info_form_table">
				<tr>
					<td><input type="text" name="id" id="id" value="<%=userID%>"
						disabled="disabled"></td>
				</tr>
				<tr>
					<td><input type="password" placeholder="비밀번호를 입력하세요"
						name="password" id="password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인" id="info_button"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>