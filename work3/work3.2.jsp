<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import = "java.util.*"%>
<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
	Date dnow = new Date();
	int dhours = dnow.getHours();
	int dminutes = dnow.getMinutes();
	int dseconds = dnow.getSeconds();
	%>
	<p><% out.print("服务器时间:" + dhours + ":" + dminutes + ":" + dseconds);
	%></p>
</body>
</html>
<script language = "JavaScript">
	var dnow = new Date();
	dhours = dnow.getHours();
	dminutes = dnow.getMinutes();
	dseconds = dnow.getSeconds();
	document.write("<br>浏览器时间:" + dhours + ":" + dminutes + ":" + dseconds);
</script>