<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>����</title>
</head>
<body>
<h1>�������˦����һ�ɰ˿飺</h1>
<form action="buy2.jsp" method="post"> 
<label><input  name="Ball" type="checkbox" value="����" />���� </label> <br>
<label><input  name="Ball" type="checkbox" value="����" />���� </label> <br>
<label><input  name="Ball" type="checkbox" value="����" />���� </label> <br>
<input  id ="checkBall" type = "hidden" name = "checkBall" value = "0" /><br>
<input type="submit" name="�ύ"  value = "�ύ" onclick = "fun()" >
</form>
<script language = "JavaScript">
function fun(){

	var form0 = document.forms[0];
	var texts = form0.checkBall;
	var sum = 0;
	var value = document.getElementsByName("Ball");
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