<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�û�ע��</title>
</head>

<body>
	<h1>�û�ע��</h1>

	<form action = "post.jsp" method = "post">
		�������û���:<input type="test" id="usersname" name="usersname" required="required" onchange="checkname()">
		<nobr id="demo1"></nobr><br>
		��������������:<input type="test" id="email" name="email" required="required" onchange="checkemail()">
		<nobr id="demo2"></nobr><br>
		����������:<input type="password" id="psw1" name="psw1" required="required"><br>
		��ȷ������:<input type="password" id="psw2" name="psw2" required="required" onchange="checkpassword()">
		<nobr id = "demo3"></nobr><br>
		�������ֻ���:<input type="test" id="phone"  name="phone" required="required" onchange="checkphone()">
		<nobr id="demo4"></nobr><br>
		���˼��:<textarea  id="intruction" name="intruction" rows="10" cols="30" style="overflow: scroll;overflow-x: hidden;">
		</textarea><br>	
			��������:<select name="years">
			<option value="1998">1998</option>
			<option value="1999">1999</option>
			<option value="2000">2000</option>
			<option value="2001">2001</option>
			<option value="2002">2002</option>
			</select>��			
			<select name="months">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>��
			</select><br>
			����:<select name="citys">
			<option value="����">����</option>
			<option value="�㽭">�㽭</option>
			<option value="�Ϻ�">�Ϻ�</option>
			<option value="�㶫">�㶫</option>
			<option value="ɽ��">ɽ��</option>
			</select><br>
			����:<select name="hobbys" >
			<option value="Ӣ������">Ӣ������</option>
			<option value="������ҫ">����ũҩ</option>
			<option value="��������">��������</option>
			<option value="¯ʯ��˵">¯ʯ��˵</option>
			<option value="д����">д����</option>
			</select><br>
			���:<select name="pheight" >
			<option value="170">170</option>
			<option value="173">173</option>
			<option value="175">175</option>
			<option value="178">178</option>
			<option value="180">180</option>
			</select>
		<input type="submit" name="�ύ"  value = "�ύ" onclick="return finalcheck()">
		<button>����</button>
	</form>
	<script language="JavaScript">
		function checkname(){
			var name;
			var test = "";
			var right = 1;
			name = document.getElementById("usersname").value;
  			if(name == ""){
				test = "�û�������Ϊ��";
				right = 0;
			}
  			else if ((name.length < 6) || (name.length > 10)){
    			test = "�û������ȱ���Ϊ6~10λ";
    			right = 0;
			}
			else if((name[0]  < 'A') || (name[0] >'z')){
				test = "�û�����������ĸ��ͷ��";
				right = 0;
			}
			document.getElementById("demo1").innerHTML = test;
			if (right == 0) {
				return false;
			}
			else return true;
		}
		function checkemail(){
			var emails;
			var test = "";
			var right = 1;
			emails = document.getElementById("email").value;
			var atpos=emails.indexOf("@");
 			var dotpos=emails.lastIndexOf(".");
  			if(emails == ""){
				test = "���䲻��Ϊ��";
				right = 0;
			}
  			else if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= emails.length){
    			test = "����һ����Ч�� e-mail ��ַ";
    			right = 0;
			}
			document.getElementById("demo2").innerHTML = test;
			if (right == 0) {
				return false;
			}
			else return true;
		}
		function checkpassword(){
			var x,y;
			var test = "";
			var right = 1;
			x = document.getElementById("psw1").value;
			y = document.getElementById("psw2").value;
			if(x != y){
				test = "���벻һ��,���ٴ���������";
				right = 0;				
			}
			document.getElementById("demo3").innerHTML = test;
			if (right == 0) {
				return false;
			}
			else return true;
		}
		function checkphone(){
			var phoneid;
			var test = "";
			var right = 1;
			phoneid = document.getElementById("phone").value;
  			if(phoneid == ""){
				test = "�ֻ��Ų���Ϊ��";
				right = 0;
			}
  			else if (!(phoneid.length == 11)){
    			test = "�ֻ��������Ϊ11λ";
    			right = 0;
			}
			else {
				for (var i = 0; i < 11 ; i++) {
					if (!(/^1\d{10}$/.test(phoneid))) {
						test = "����һ����Ч���ֻ�����";
						right = 0;
						break;
					}
				 }
			}
			document.getElementById("demo4").innerHTML = test;
			if (right == 0) {
				return false;
			}
			else return true;
		}
		function finalcheck(){
			if (!(checkname()&&checkphone()&&checkpassword()&&checkemail())) {
				alert("��Ϣ����ȷ�������¼��");
				return false;
			}
		}
	</script>
</body>
</html>