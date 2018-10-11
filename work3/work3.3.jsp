<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import="java.util.GregorianCalendar" %>
<html>
<head>
<meta charset="utf-8">
<title>显示当前日期</title>
</head>
<body>

<h1>当前日期为:</h1>
<%
	Date dnow = new Date();
	GregorianCalendar ca = new GregorianCalendar();
	String[] weekday=new String[7];
	weekday[0]="星期日";
	weekday[1]="星期一";
	weekday[2]="星期二";
	weekday[3]="星期三";
	weekday[4]="星期四";
	weekday[5]="星期五";
	weekday[6]="星期六";
	String[]moringorafternoon = new String[2];
	moringorafternoon[0] = "上午";
	moringorafternoon[1] = "下午";
	out.println("<h2>今天是" + weekday[dnow.getDay()] + moringorafternoon[ca.get(GregorianCalendar.AM_PM)] + dnow.getHours() + "点" + dnow.getMinutes() + "分</h2>");
	%>
</body>
</html>