<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<%@taglib uri = "/struts-tags" prefix="s" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
<script language = javascript>
	function clearCart(){
		cartForm.action = "cart_clear?method=clear";
		cartForm.submit();
	}
	function deleteCartItem(){
		cartForm.action = "cart_delete?method=deleteItem";
		cartForm.submit();
	}
	function modifyNumber(){
		cartForm.action = "cart_modify?method=modifyItemNumber";
		cartForm.submit();
	}
</script>
</head>
<body>
	<h1 align = "center">
		购物车
	</h1>
	<form name = "cartForm" action = "<%=context %>/from/listaction!list" method = "post">
		<input type = "hidden" name = "method" value = "index"/>
		<table cellSpacing = "0" cellPadding = "0" width = "75%" align = "center" border = "1">
			<tbody>
				<tr align = "middle">
					<td width = "7%">
						选择
					</td>
					<td width = "21%" height = "30">
						商品名称
					</td>
					<td width = "14%" height = "30">
						单价
					</td>
					<td width = "25" height = "30">
						数量
					</td>
					<td width = "33" height = "30">
						合计
					</td>	
				</tr>
				<c:forEach var = "item" items = "${sessionScope.cart.items }">
					<tr align = "middle">
						<td height = "30">
							<input type = "checkbox" value = "${item.key }" name = "itemCheck">
						</td>
						<td height = "30">
							${item.value.product.name }
						</td>
						<td height = "30">
							${item.value.product.price }
						</td>
						<td height = "30">
							<input maxLength = "10" size = "10" value = "${item.value.number}" name = "number${item.key}">
						</td>
						<td height = "30">
							${item.value.cost }
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colSpan = "5" height = "30">
						您的购物车中所有商品总金额 : ${sessionScope.cart.price }
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<br>
		<table cellSpacing = "0" cellPadding = "0" width = "450" align = "center" border = "0">
			<tbody>
				<tr align = "middle">
					<td width = "22%">
						<input onclick = "modifyNumber()" type = "button" value = "修改所选的数量" name = "Button">
					</td>
					<td width = "20%">
						<input onclick = "deleteCartItem()" type = "button" value = "删除所选项" name = "Submit2">
					</td>
					<td	width = "26%">
						<input onclick = "clearCart()" type = "button" value = "清空购物车" name = "Submit3">
					</td> 
					<td width = "12%">
						<input onclick = "javascript:location.href='order_index?method=index'" type = "button" value = "结账" name = "Submit4">
					</td>
					<td width = "20%">
						<input onclick = "javascript:location.href='listaction?method=list'" type = "button" value = "继续购物" name - "Submit5">
					</td>
				</tr>	
			</tbody>
		</table>
	</form>
	<p align = "center">
		&nbsp;
	</p>	
</body>
</html>