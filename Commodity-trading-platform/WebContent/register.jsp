<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String context = request.getContextPath(); %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body>
	<div margin:0px auto>
		<h1>用户注册</h1>
		<form action = "<%=context%>/from/user_register" method = "post">		
			<table border = "1">
				<tr>
					<td>
						用户名:<input type = "text" name = "name">
					</td>
				</tr>
				<tr>
					<td>
						密码:<input type = "password" name = "password1">
					</td>
				</tr>
				<tr>
					<td>
						确认密码:<input type = "password" name = "password2">
					</td>
				</tr>
				<tr>
					<td>
						地址:<input type = "text" name = "address">
					</td>
				</tr>
				<tr>
					<td>
						邮编:<input type = "text" name = "postCode">
					</td>
				</tr>
				<tr>
					<td>
						E-mail:<input type = "text" name = "email">
					</td>
				</tr>
				<tr>
					<td>
						家庭电话号码:<input type = "text" name = "homePhone">
					</td>
				</tr>
				<tr>
					<td>
						手机号码:<input type = "text" name = "cellPhone">
					</td>
				</tr>
				<tr>
					<td>
						办公室号码:<input type = "text" name = "officePhone">
					</td>
				</tr>
				<tr>
					<td>
						验证码:<input type = "text" name = "rand" size = "4">
						&nbsp;
						<img src = "<%=context%>/from/user_code" onclick = "this.src=this.src+'?'"/>
					</td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type = "submit" value = "注册">
						<input type = "reset" value = "重置">
					</td>
				</tr>
			</table>	
		</form>
	</div>
	<p>测试:<s:property value = "#request['random']"/><p>
</body>
</html>