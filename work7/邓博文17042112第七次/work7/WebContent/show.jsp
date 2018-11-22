<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="gbk" content="text/html; charset=gbk">
<title>显示学生信息</title>
</head>
<body>
<form action="List"> 
<p>点击按钮查询</p>
<input type="hidden" value = "0" id = "check" name = "check"><br>
<input type="submit" name="查询"  value = "查询"><br>
</form>
<table border="1" width="100%">
<% 
request.setCharacterEncoding("GBK");
String check = (String)request.getAttribute("check");
if(check!=null){
String s  = (String)request.getAttribute("sum");
int sum = Integer.parseInt(s);
out.println("<tr>");
out.print("<th>");
out.print("序号");
out.println("</th>");
out.print("<th>");
out.print("类型");
out.println("</th>");
out.print("<th>");
out.print("密码");
out.println("</th>");
out.print("<th>");
out.print("角色");
out.println("</th>");
out.print("<th>");
out.print("学号");
out.println("</th>");
out.print("<th>");
out.print("姓名");
out.println("</th>");
out.print("</tr>");

for(int i = 0 ; i < sum ; i++){
	String sid = (String)request.getAttribute("id"+Integer.toString(i));
	out.println("<tr>");
	out.print("<th>");
	out.print(sid);
	out.println("</th>");
	out.print("<th>");
	out.print((String)request.getAttribute("link"+Integer.toString(i)));
	out.println("</th>");
	out.print("<th>");
	out.print((String)request.getAttribute("pwd"+Integer.toString(i)));
	out.println("</th>");
	out.print("<th>");
	out.print((String)request.getAttribute("roles"+Integer.toString(i)));
	out.println("</th>");
	out.print("<th>");
	out.print((String)request.getAttribute("uid"+Integer.toString(i)));
	out.println("</th>");
	out.print("<th>");
	out.print((String)request.getAttribute("username"+Integer.toString(i)));
	out.println("</th>");
}
}
%>
</table>
<form>
<a href = "new.jsp">新增学生</a>
</body>
</html>