<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
request.setCharacterEncoding("GBK");
String check = request.getParameter("checkMeat");
session.setAttribute("checkMeat",check);
int x1 = Integer.parseInt(check);
if(x1 == 1){
	String[] chooseMeat = request.getParameterValues("Meat");
	for(int i = 0 ; i < chooseMeat.length ; i++){
		String name = "Meat" + String.valueOf(i);
		session.setAttribute(name, chooseMeat[i]);
	}
	String s = String.valueOf(chooseMeat.length);
	session.setAttribute("Meatlength",s);
}
%>
您选择的结果：<br><br>
<% 
String c1 = (String)session.getAttribute("checkBall");
String c2 = (String)session.getAttribute("checkMeat");
int fin = 0;
int x2 = Integer.parseInt(c1);
int x3= Integer.parseInt(c2);
if(x2 == 1){
	String s1 = (String)session.getAttribute("Balllength");
	int l1 = Integer.parseInt(s1);
	for(int i = 0 ; i < l1 ; i++){
		String name = "Ball" + String.valueOf(i);
		out.print((String)session.getAttribute(name)+"<br>");
	}
	fin = 1;
}
if(x3== 1){
	String s2 = (String)session.getAttribute("Meatlength");
	int l2 = Integer.parseInt(s2);
	for(int i = 0 ; i < l2 ; i++){
		String name = "Meat" + String.valueOf(i);
		out.print((String)session.getAttribute(name)+"<br>");
	}
	fin = 1;
}
if(fin == 0){
	out.print("空空如也！" + "<br>");
}
%><br>

<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>购物车</title>
</head>

<body>
<input type="button" onclick="history.go(-1)" value="上一页">
<input type="button" name="Submit" value="重选" onclick ="location.href='buy1.jsp'"/>
</body>
</html>