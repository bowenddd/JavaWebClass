<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
	<h1 align = "center">
			你所购买的商品如下：
	</h1>
	<table cellSpacing ="0" cellPadding= "0" width = "75%" align = "center" border = "1">
		<tbody>
			<tr align = "middle">
				<td width="21%" height = "30">
					商品名称
				</td>
				<td width="14%" height = "30">
					单价
				</td>
				<td width="25%" height = "30">
					数量
				</td>
				<td width="33%" height=30>
					合计
				</td>
			</tr>
			<c:forEach var="item" items="${sessionScope.cart.items}">
				<tr align = "middle">
					<td height = "30">
						${item.value.product.name }
					</td>
					<td height = "30">
						${item.value.product.price }
					</td>
					<td height = "30">
						${item.value.number }
					</td>
					<td height = "30">
						${item.value.cost }
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colSpan = "5" height = "30">
						您的购物车中所有商品总金额：${sessionScope.cart.price }
					</td>
				</tr>
			</tbody>
		</table>
		<P><h1 align = "center">用户联系方式如下：</h1><P></P>
		<form action="<%=context %>/from/cart_post!postOrder" method="post">
			<table cellSpacing = "0" cellPadding = "0" width = "500" align = "center" border = "0">
				<tbody>
					<tr>
						<td width = "117" height = "23">
							姓名：
						</td>
						<td width = "383">
							<input value="${sessionScope.user.name }" name="name">
						</td>
					</tr>
					<tr>
						<td height = "24">
							地址：
						</td>
						<td>
							<input value="${sessionScope.user.address }" name="address">
						</td>
					</tr>
					<tr>
						<td height = "24">
							邮政编码：
						</td>
						<td>
							<input value="${sessionScope.user.postCode }" name="postCode">
						</td>
					</tr>
					<tr>
						<td height = "23">
							E-mail：
						</td>
						<td>
							<input value="${sessionScope.user.email }" name="email">
						</td>
					</tr>
					<tr>
						<td height = "23">
							联系电话：
						</td>
						<td>
							<input value="${sessionScope.user.cellPhone }" name="phone">
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<table cellSpacing = "0" cellPadding = "0" width = "500" align = "center" border = "0">
				<tbody>
					<tr>
						<td align = "middle">
							<input type="submit" value="结帐">
						</td>
						<td align = "middle">
							<input onclick = "javascript:location.href='listaction?method=list'" type = button value = "继续购物" name = submit2>
						</td>
						<td align = "middle">
							<input onclick="javascript:location.href='cart_index?method=CartIndex'" type = button value = "回到购物车" name=submit3>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
</body>
</html>