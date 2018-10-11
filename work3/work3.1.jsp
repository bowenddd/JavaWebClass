<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>访问量统计</title>
</head>
<body>
<%
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       out.println("欢迎访问本网页!");
       hitsCount = 1;
    }else{
       out.println("欢迎访问本网页!");
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
%>

<p>页面访问量为: <%= hitsCount%></p>


</body>
</html>