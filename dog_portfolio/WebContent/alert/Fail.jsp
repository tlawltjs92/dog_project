<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String key = (String) request.getParameter("key");

if (key.equals("name")) {
	out.println("<script>");
	out.println("alert('닉네임 중복입니다. 다시 입력하세요.')");
	out.println("history.back()");
	out.println("</script>");
} else if (key.equals("phone")) {
	out.println("<script>");
	out.println("alert('전화번호 중복입니다. 다시 입력하세요.')");
	out.println("history.back()");
	out.println("</script>");
} else if (key.equals("email")) {
	out.println("<script>");
	out.println("alert('이메일 중복입니다. 다시 입력하세요.')");
	out.println("history.back()");
	out.println("</script>");
} else if (key.equals("pass")) {
	out.println("<script>");
	out.println("alert('비밀번호가 틀립니다.')");
	out.println("history.back()");
	out.println("</script>");
} else if (key.equals("noid")) {
	out.println("<script>");
	out.println("alert('없는 아이디입니다.')");
	out.println("history.back()");
	out.println("</script>");
} else if (key.equals("delete")) {
	out.println("<script>");
	out.println("alert('삭제를 실패했습니다.')");
	out.println("history.back()");
	out.println("</script>");
} else if (key.equals("check")) {
	out.println("<script>");
	out.println("alert('비밀번호가 틀립니다.')");
	out.println("history.back()");
	out.println("</script>");
} else if(key.equals("id")){
	out.println("<script>");
	out.println("alert('아이디 중복입니다. 다시 입력하세요.')");
	out.println("history.back()");
	out.println("</script>");
}
%>