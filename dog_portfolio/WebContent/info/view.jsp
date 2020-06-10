<%@page import="dao.InfoDAO"%>
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
<body>
<h3 id="info_h3">내정보</h3>
	<div id="join_form">
		<table id="join_form_table">
			<tr>
				<td><input type="text" name="id" id="id" size="30"
					value="<%=infoDTO.getId()%>"></td>
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
		</table>
	</div>
</body>
</html>