<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
<body>
<form action="confirm" method="post"> 
<h3>��ӭ�½�ѧ��</h3>
<label>���<input  id="id" name="id" type="text"/></label> 
<label>����<input  id="link" name="link" type="text"/></label> 
<label>����<input  id="pwd" name="pwd" type="text"/></label> 
<label>��ɫ<input  id="role" name="role" type="text"/></label> 
<label>ѧ��<input  id="uid" name="uid" type="text"/></label> 
<label>�û���<input  id="username" name="username" type="text"/></label> 


<br><br>
<input type="submit" name="�ύ"  value = "�ύ" onclick = "return finalcheck()">   <button type="reset">reset</button>
</form>
<script language="JavaScript">
		function check(){		
			var pwd;
			var username;
			var uid;
			var link;
			var id;
			var role;
			var right = 1;
			pwd = document.getElementById("pwd").value;
			username = document.getElementById("username").value;
			id = document.getElementById("id").value;
			role = document.getElementById("role").value;
			link = document.getElementById("link").value;
			uid = document.getElementById("uid").value;
  			if(pwd == "" ||username =="" || id == ""|| uid == "" || role == "" || link ==""){
				right = 0;
			}
			if (right == 0) {
				return false;
			}
			else return true;
		}
		function finalcheck(){
			if (!check()) {
				alert("��Ϣ�������������¼��");
				return false;
			}
			else {
				return true;
			}
		}
	</script>
</body>
</html>