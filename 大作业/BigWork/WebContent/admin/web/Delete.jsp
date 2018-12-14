<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@page import="db.Content" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base target=_self>
<meta http-equiv="gb2312" content="text/html; charset=gb2312">
<title>Delete</title>
</head>
<body>
<%
request.setCharacterEncoding("gb2312");
String uid = request.getParameter("id");
%>
<form action="http://localhost:8080/BigWork/DeleteServlet" method="post">
<p>确定要删除编号为<%=uid %>的用户？</p>
<%
out.print("<input type='hidden' name='id' value = '" + uid +"'>");
%>
<input type="submit" name="确认" value="确认"><nobr>   </nobr>
<input type="button" name="取消" onclick="javascript:history.back(-1);" value="取消">
</form>
</body>
</html>