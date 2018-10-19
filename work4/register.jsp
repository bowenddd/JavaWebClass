<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>用户注册</title>
</head>

<body>
	<h1>用户注册</h1>

	<form action = "post.jsp" method = "post">
		请输入用户名:<input type="test" id="usersname" name="usersname" required="required" onchange="checkname()">
		<nobr id="demo1"></nobr><br>
		请输入邮箱名称:<input type="test" id="email" name="email" required="required" onchange="checkemail()">
		<nobr id="demo2"></nobr><br>
		请输入密码:<input type="password" id="psw1" name="psw1" required="required"><br>
		请确认密码:<input type="password" id="psw2" name="psw2" required="required" onchange="checkpassword()">
		<nobr id = "demo3"></nobr><br>
		请输入手机号:<input type="test" id="phone"  name="phone" required="required" onchange="checkphone()">
		<nobr id="demo4"></nobr><br>
		个人简介:<textarea  id="intruction" name="intruction" rows="10" cols="30" style="overflow: scroll;overflow-x: hidden;">
		</textarea><br>	
			出生年月:<select name="years">
			<option value="1998">1998</option>
			<option value="1999">1999</option>
			<option value="2000">2000</option>
			<option value="2001">2001</option>
			<option value="2002">2002</option>
			</select>年			
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
			<option value="12">12</option>月
			</select><br>
			籍贯:<select name="citys">
			<option value="北京">北京</option>
			<option value="浙江">浙江</option>
			<option value="上海">上海</option>
			<option value="广东">广东</option>
			<option value="山东">山东</option>
			</select><br>
			爱好:<select name="hobbys" >
			<option value="英雄联盟">英雄联盟</option>
			<option value="王者荣耀">王者农药</option>
			<option value="绝地求生">绝地求生</option>
			<option value="炉石传说">炉石传说</option>
			<option value="写代码">写代码</option>
			</select><br>
			身高:<select name="pheight" >
			<option value="170">170</option>
			<option value="173">173</option>
			<option value="175">175</option>
			<option value="178">178</option>
			<option value="180">180</option>
			</select>
		<input type="submit" name="提交"  value = "提交" onclick="return finalcheck()">
		<button>重置</button>
	</form>
	<script language="JavaScript">
		function checkname(){
			var name;
			var test = "";
			var right = 1;
			name = document.getElementById("usersname").value;
  			if(name == ""){
				test = "用户名不能为空";
				right = 0;
			}
  			else if ((name.length < 6) || (name.length > 10)){
    			test = "用户名长度必须为6~10位";
    			right = 0;
			}
			else if((name[0]  < 'A') || (name[0] >'z')){
				test = "用户名必须以字母开头！";
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
				test = "邮箱不能为空";
				right = 0;
			}
  			else if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= emails.length){
    			test = "不是一个有效的 e-mail 地址";
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
				test = "密码不一致,请再次输入密码";
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
				test = "手机号不能为空";
				right = 0;
			}
  			else if (!(phoneid.length == 11)){
    			test = "手机号码必须为11位";
    			right = 0;
			}
			else {
				for (var i = 0; i < 11 ; i++) {
					if (!(/^1\d{10}$/.test(phoneid))) {
						test = "不是一个有效的手机号码";
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
				alert("信息不正确，请重新检查");
				return false;
			}
		}
	</script>
</body>
</html>