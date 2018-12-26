<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查询结果</title>
</head>
<body>
<%request.setCharacterEncoding("gb2312"); %>
<jsp:useBean id="user" class = "Users.User"  scope = "page">
	<jsp:setProperty name="user" property = "*"/>
</jsp:useBean>
<p>
姓名：<jsp:getProperty property = "username" name = "user"/>
</p>
<p>
学号：<jsp:getProperty property = "userid" name = "user"/>
</p>
</body>
</html>