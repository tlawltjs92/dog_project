<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫파인드</title>
<link rel="stylesheet" type="text/css"
	href="../main/css/main_css/main_top_petFind.css">
<link rel="stylesheet" type="text/css" href="../main/css/info_css/total.css">
<link rel="stylesheet" type="text/css" href="../main/css/login_join_css/template.css">
<%
	String contentPage = request.getParameter("contentPage");
	if (contentPage == null) {
		contentPage = "view";
	} else if (contentPage.equals("view")) {
		contentPage = "view";
	} else if (contentPage.equals("update")) {
		contentPage = "update";
	} else if (contentPage.equals("delete")) {
		contentPage = "delete";
	} else if(contentPage.equals("update_form")){
		contentPage = "update_form";
	}
%>
</head>
<body>
	<div id="main_container">
		<jsp:include page="../main/include/main_header.jsp"></jsp:include>
		<div id="side_section">
				<jsp:include page="article.jsp"></jsp:include>
			<div id="section_main">
				<jsp:include page='<%=contentPage + ".jsp"%>'></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>