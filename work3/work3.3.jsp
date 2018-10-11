<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import="java.util.GregorianCalendar" %>
<html>
<head>
<meta charset="utf-8">
<title>显示当前日期</title>
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
	String[] chinesetime = new String[61];
	chinesetime[0]="零";
	chinesetime[1]="一";
	chinesetime[2]="二";
	chinesetime[3]="三";
	chinesetime[4]="四";
	chinesetime[5]="五";	
	chinesetime[6]="六";
	chinesetime[7]="七";
	chinesetime[8]="八";
	chinesetime[9]="九";
	chinesetime[10]="十";	
	chinesetime[11]="十一";
	chinesetime[12]="十二";
	chinesetime[13]="十三";
	chinesetime[14]="十四";
	chinesetime[15]="十五";	
	chinesetime[16]="十六";
	chinesetime[17]="十七";
	chinesetime[18]="十八";
	chinesetime[19]="十九";
	chinesetime[20]="二十";	
	chinesetime[21]="二十一";
	chinesetime[22]="二十二";
	chinesetime[23]="二十三";
	chinesetime[24]="二十四";
	chinesetime[25]="二十五";	
	chinesetime[26]="二十六";
	chinesetime[27]="二十七";
	chinesetime[28]="二十八";
	chinesetime[29]="二十九";
	chinesetime[30]="三十";	
	chinesetime[31]="三十一";
	chinesetime[32]="三十二";
	chinesetime[33]="三十三";
	chinesetime[34]="三十四";
	chinesetime[35]="三十五";	
	chinesetime[36]="三十六";
	chinesetime[37]="三十七";
	chinesetime[38]="三十八";
	chinesetime[39]="三十九";
	chinesetime[40]="四十";	
	chinesetime[41]="四十一";
	chinesetime[42]="四十二";
	chinesetime[43]="四十三";
	chinesetime[44]="四十四";
	chinesetime[45]="四十五";	
	chinesetime[46]="四十六";
	chinesetime[47]="四十七";
	chinesetime[48]="四十八";
	chinesetime[49]="四十九";
	chinesetime[50]="五十";	
	chinesetime[51]="五十一";
	chinesetime[52]="五十二";
	chinesetime[53]="五十三";
	chinesetime[54]="五十四";
	chinesetime[55]="五十五";	
	chinesetime[56]="五十六";
	chinesetime[57]="五十七";
	chinesetime[58]="五十八";
	chinesetime[59]="五十九";
	chinesetime[60]="六十";	
	

	%>
</head>
<body>
<%
	out.println("<h1>现在是" + weekday[dnow.getDay()] + moringorafternoon[ca.get(GregorianCalendar.AM_PM)] + chinesetime[dnow.getHours() % 12]  + "点" + chinesetime[dnow.getMinutes()] + "分</h1>");
%>
</body>
</html>