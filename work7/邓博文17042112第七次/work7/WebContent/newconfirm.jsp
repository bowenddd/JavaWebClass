<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
<h1>�½�ѧ���ɹ�</h1>
<p id = "sp"></p>
<script type="text/javascript">
		onload=function(){
			setInterval(go, 1000);
		};
		var x=5;
		function go(){
		x--;
			if(x>0){
			document.getElementById("sp").innerHTML=x.toString() + "s���Զ���ת";
			}
			else{
			location.href="show.jsp";
			}
		}
</script>
</body>
</html>