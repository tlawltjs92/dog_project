<%@page import="vo.InfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	InfoDTO infoDTO = (InfoDTO) session.getAttribute("infoDTO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="join_form">
		<form action="update" method="post">
			<table id="join_form_table">
				<tr>
					<td><input type="text" id="id" size="30"
						value="<%=infoDTO.getId()%>" disabled="disabled">
						<input type="hidden" name="id" value="<%=infoDTO.getId()%>">
						</td>
				</tr>
				<tr>
					<td><input type="password" name="password" id="password"
						size="30" value="<%=infoDTO.getPassword()%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="name" id="name" size="30"
						value="<%=infoDTO.getName()%>"></td>
				</tr>
				<tr>
					<td><input type="date" name="birth" id="birth" size="30"
						value="<%=infoDTO.getBirth()%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="phone" id="phone" size="30"
						value="<%=infoDTO.getPhone()%>"></td>
				</tr>
				<tr>
					<td><input type="text" name="address" id="address" size="30"
						value="<%=infoDTO.getAddress()%>"></td>
				</tr>
				<tr>
					<td><input type="email" name="email" id="email" size="30"
						value="<%=infoDTO.getEmail()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>