<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<%@taglib uri = "/struts-tags" prefix = "s" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>
	<h1 align = "center">
		订单列表:
	</h1>
	<br>
	<table width = "600" border = "1" align = "center">
		<tbody>
			<tr height = "25">
				<td>
					订单状态
				</td>
				<td>
					用户名
				</td>	
				<td>
					订单号
				</td>
				<td>
					订单总价
				</td>
				<td>
					操作
				</td>
			</tr>
			<s:iterator value = "orders" var="o">
				<tr>
					<td>
						<s:property value = "#o.status" />
					</td>
					<td>
						<s:property value = "#o.user.name" />
					</td>
					<td>
						<s:property value = "#o.orderNum" />
					</td>
					<td>
						<s:property value = "#o.cost" />
					</td>
					<td>
						<c:if test = "${o.status != 4 }">
							<a href = "<%= context %>/manager/nextaction!next?orderId=<s:property value="#o.id"/>">下一步</a>
						</c:if>						
					</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<br>
	<br>
	<a href = "<%=context %>/from/loginoutaction">退出</a>
	<a href = "<%=context %>/manager/index.jsp">返回主页</a>
</body>
</html>