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
<p>ȷ��Ҫɾ�����Ϊ<%=uid %>���û���</p>
<%
out.print("<input type='hidden' name='id' value = '" + uid +"'>");
%>
<input type="submit" name="ȷ��" value="ȷ��"><nobr>   </nobr>
<input type="button" name="ȡ��" onclick="javascript:history.back(-1);" value="ȡ��">
</form>
</body>
</html>