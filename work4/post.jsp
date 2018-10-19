<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>提交页面</title>
</head>
<body>
<%
request.setCharacterEncoding("GBK");
String strUsername = "";
String strEmail = "";
String strUserpwd = "";
String strPhone = "";
String strIntruction = "";
String strYears = "";
String strMonths = "";
String strCitys = "";
String strHobbys = "";
String strPheight = "";
strUsername = request.getParameter("usersname");
strEmail = request.getParameter("email");
strUserpwd = request.getParameter("psw1");
strPhone = request.getParameter("phone");
strIntruction = request.getParameter("intruction");
strYears = request.getParameter("years");
strMonths = request.getParameter("months");
strCitys = request.getParameter("citys");
strHobbys = request.getParameter("hobbys");
strPheight = request.getParameter("pheight");
%>
用户名：<%=strUsername%><br>
邮箱：<%=strEmail %><br>
密码：<%=strUserpwd%><br>
手机号：<%=strPhone %><br>
个人简介：<%=strIntruction %><br>
出声日期：<%=strYears %> 年<%=strMonths %>月<br>
籍贯：<%=strCitys %><br>
爱好：<%=strHobbys %><br>
身高:<%=strPheight %>cm<br>
</body>
</html>