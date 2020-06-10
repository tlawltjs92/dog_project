<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String suc = (String) request.getAttribute("suc");

if (suc.equals("signup")) {
	out.println("<script>");
	out.println("alert('회원가입에 성공하였습니다. 다시 로그인 해주세요.')");
	out.println("location.href='../main/main_petFind.jsp'");
	out.println("</script>");
} else if(suc.equals("login")){
	out.println("<script>");
	out.println("alert('로그인에 성공하였습니다.')");
	out.println("location.href='../main/main_petFind.jsp'");
	out.println("</script>");
} else if(suc.equals("update")){
	out.println("<script>");
	out.println("alert('정보 수정을 성공하였습니다.')");
	out.println("location.href='../main/main_petFind.jsp'");
	out.println("</script>");
} else if(suc.equals("delete")){
	out.println("<script>");
	out.println("alert('회원 탈퇴를 성공하였습니다.')");
	out.println("location.href='../main/main_petFind.jsp'");
	out.println("</script>");
} else if(suc.equals("logout")){
	out.println("<script>");
	out.println("alert('로그아웃했습니다. 다시 로그인해주세요.')");
	out.println("location.href='../main/main_petFind.jsp'");
	out.println("</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>