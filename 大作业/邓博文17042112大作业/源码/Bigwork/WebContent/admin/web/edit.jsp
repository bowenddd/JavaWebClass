<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@page import="db.Content" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base target=_self>
<meta http-equiv="gb2312" content="text/html; charset=gb2312">
<title>Edit</title>
</head>
<body>
<%
request.setCharacterEncoding("gb2312");
String uid = request.getParameter("id");
Content content = new Content();
content.user(uid);
String username = content.getusername();
String userpwd = content.getuserpwd();
%>
<form action="http://localhost:8080/BigWork/UpdateServlet" method="post">
<p>编号<%=uid %></p>
<%
out.print("用户名");
out.print("<input type='text' name='username' value = '" +username +"'>");
out.print("<br>");
out.print("密码");
out.print("<input type='text' name='userpwd' value = '" +userpwd +"'>");
out.print("<br>");
out.print("<input type='hidden' name='id' value = '" + uid +"'>");
%>
<input type="submit" name="提交" value="保存更改">
</form>
</body>
</html>