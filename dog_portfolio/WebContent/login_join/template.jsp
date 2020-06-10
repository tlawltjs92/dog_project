<%@page import="action.Login_Action"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/main_css/main_top_petFind.css">
<link rel="stylesheet" type="text/css" href="../main/css/login_join_css/template.css">
<link rel="stylesheet" type="text/css" href="../main/css/login_join_css/login.css">
<link rel="stylesheet" type="text/css" href="../main/css/login_join_css/join.css">
<%
	String contentPage = request.getParameter("contentPage");
	if (contentPage == null) {
		contentPage = "login";
	} else if (contentPage.equals("login")) {
		contentPage = "login";
	} else if (contentPage.equals("join")) {
		contentPage = "join";
	} 
%>
</head>
<body>
	<jsp:include page="../main/include/main_header.jsp"></jsp:include>
	<div id="section_container">
		<div id="login_join_button">
			<a id="loginbutton"
				onclick="location.href='template.do?contentPage=login'">로그인</a> <a
				id="joinbutton"
				onclick="location.href='template.do?contentPage=join'">회원가입</a>
		</div>
		<div id="login_join_form">
			<jsp:include page='<%=contentPage + ".jsp"%>'></jsp:include>
		</div>
	</div>
</body>
</html>