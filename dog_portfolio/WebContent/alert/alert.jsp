<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String cu = request.getParameter("cu");
    
    if(cu.equals("no")){
    	out.println("<script>");
    	out.println("alert('준비중입니다.')");
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