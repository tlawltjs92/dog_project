<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userID = (String) session.getAttribute("userID");
	String userPassword = (String) session.getAttribute("userPassword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="main_header_container_bar">
		<div id="header_top">
			<h2 id="header_h2">
				<a href="main.do">펫파인드</a>
			</h2>
			<span> <%
 	if (userID == null && userPassword == null) {
 %> <a class="header_login_a" href="login.do?contentPage=login">로그인</a>
 	<a class="header_signup_a" href="login.do?contentPage=join">회원가입</a> 
 	<%
 	} else if (userID != null && userPassword != null) {
 	%> 	<a class="header_login_a" href="myinfo.do?contentPage=view">내정보</a>
 		<a class="header_signup_a" href="logout.do">로그아웃</a>
				<%
					}
				%>
			</span>
		</div>
		<div id="div_header_nav">
			<ul id="header_nav">
				<li><a href="list.do" id="header_nav_li_a">유기동물</a></li>
				<li><a href="../alert/alert.jsp?cu=no" id="header_nav_li_a">커뮤니티</a></li>
				<%
					if (userID != null && userPassword != null) {
						if (userID.equals("admin")) {
				%>
				<li><a href="#" id="header_nav_li_a">회원 목록 조회</a></li>
				<%
					}
					}
				%>
			</ul>
			<div id="bar_div">
				<ul id="bar_div_ul">
					<li><a href="list.do">유기동물 조회</a></li>
					<li><a href="../alert/alert.jsp?cu=no">유기동물 센터 조회</a></li>
				</ul>
				<ul id="bar_div_ul" class="bar_div_ul">
					<li><a href="../alert/alert.jsp?cu=no">자유게시판</a></li>
					<li><a href="../alert/alert.jsp?cu=no">유기견 등록</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>