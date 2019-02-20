<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<%@taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查找结果</title>
</head>
<body>
	<h1 align=center>
		查找的结果如下:
		<br>
		<br>
		<table width=800 border=1>
			<tbody>
				<tr height=50>
					<td>
						产品图片
					</td>
					<td>
						产品名称
					</td>
					<td>
						添加到购物车
					</td>
				</tr>
				<s:iterator value = "findlist" var = "p">
					<tr>
						<td>
							<<%-- img src = "<%=context %>/UploadImages/${p.imageSrc}" style = "height:60px ; width:80px"/> --%>
						</td>
						<td>
							<s:property value = "#p.name"/>
						</td>
						<td>
							<%-- <a href = "<%=context %>/from/addaction!addItem?type=1&productId=<s:property value="#p.id"/>">添加到购物车</a> --%>
						</td>
					</tr>
				</s:iterator>				
			</tbody>
		</table>
		<br>
		<br>
		<s:set var="page" value="#request['page']" />	
		<s:set var="maxpage" value="#request['maxpage']"/>
		<s:if test = "#page == 1">首页</s:if>
		<s:if test = "#page > 1"><a href = "<%= context%>/from/listaction!list?page=1">首页</a></s:if>
		<s:if test = "#page == 1">上一页</s:if>
		<s:if test = "#page > 1"><a href = "<%= context%>/from/listaction!list?page=${page-1}">上一页</a></s:if>
		<s:if test = "#page == #maxpage">下一页</s:if>
		<s:if test = "#page < #maxpage"><a href = "<%= context%>/from/listaction!list?page=${page+1}">下一页</a></s:if>
		<s:if test = "#page == #maxpage">末页</s:if>
		<s:if test = "#page < #maxpage"><a href = "<%= context%>/from/listaction!list?page=${maxpage}">末页</a></s:if>
		<br>
		<%-- <a href = "<%= context %>/from/cart_index!CartIndex">查看购物车</a>&nbsp;&nbsp;
		<a href = "<%= context %>/from/order_index!index">结账</a>&nbsp;&nbsp; --%>
		<a href = "<%= context %>/from/listaction!list?page=1">返回首页</a>&nbsp;&nbsp;
		<%-- <a href = "<%= context %>/userregister.jsp">注册</a>&nbsp;&nbsp; --%>
	</h1>
</body>
</html>