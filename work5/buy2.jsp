<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
request.setCharacterEncoding("GBK");
String check = request.getParameter("checkBall");
session.setAttribute("checkBall",check);
int l = Integer.parseInt(check);
if(l == 1){
	String[] chooseBall = request.getParameterValues("Ball");
	for(int i = 0 ; i < chooseBall.length ; i++){
		String name = "Ball" + String.valueOf(i);
		session.setAttribute(name, chooseBall[i]);
	}
	String s = String.valueOf(chooseBall.length);
	session.setAttribute("Balllength",s);
}

%>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>����</title>
</head>
<body>
<h1>�������˦����һ�ɰ˿飺</h1>
<form action="display.jsp" method="post"> 
<label><input name="Meat" type="checkbox" value="����" />���� </label> <br>
<label><input name="Meat" type="checkbox" value="ţ��" />ţ�� </label> <br>
<label><input name="Meat" type="checkbox" value="����" />���� </label> <br>
<input  id ="checkMeat" type = "hidden" name = "checkMeat" value = "0" /><br>
<input type="submit" name="�ύ"  value = "�ύ" onclick = "fun()"  >
<input type="button" onclick="history.go(-1)" value="��һҳ">
<input type="button" name="Submit" value="��ѡ" onclick ="location.href='buy1.jsp'"/>
</form>
<script type="text/javascript">
function fun(){

	var form0 = document.forms[0];
	var texts = form0.checkMeat;
	var sum = 0;
	var value = document.getElementsByName("Meat");
	for(var i = 0;i < value.length;i++){
		if(value[i].checked){
			sum++;
		}
	    if(sum != 0){
		    texts.value = "1";
	 	}
	}
}
</script>

</body>
</html>