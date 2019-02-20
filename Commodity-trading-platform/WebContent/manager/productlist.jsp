<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<%@taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表</title>
</head>
<body>
	<h1 align = "center">
		本系统的所有商品列表如下: 
		<br>
		<br>
		<table width = "900" border = "1">
			<tbody>
				<tr height = "40">
					<td>
						产品图片
					</td>
					<td>
						产品名称
					</td>
					<td>
						产品价格
					</td>
					<td>
						产品描述
					</td>
					<td>
						修改商品
					</td>
					<td>
						删除商品
					</td>
				</tr>
				<s:iterator value = "productlist" var = "p">
					<tr>
						<td>
					   	 <img src = "C:/Users/lenovo/Desktop/软件外包竞赛/Commodity-trading-platform/UploadImagesUploadImages/${p.imageSrc}" style = "height:60px;width:80px"/>  
						</td>
						<td>
							<s:property value = "#p.name"/>
						</td>
						<td>
							<s:property value = "p.price"/>
						</td>
						<td>
							<s:property value = "p.description"/>
						</td>
						<td>
							<a href = "<%=context %>/manager/update?productId=<s:property value="#p.id"/>">修改商品</a>
						</td>
						<td>
							<a href = "<%=context %>/manager/delete?productId=<s:property value="#p.id"/>">删除商品</a>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<br>
		<br>
		<s:set var = "page" value = "#request['page']"/>
		<s:set var = "maxpage" value = "#request['maxpage']" />
		<s:if test = "#page == 1">首页</s:if>
		<s:if test = "#page > 1"><a href = "<%= context%>/manager/listproduct?page=1">首页</a></s:if>
		<s:if test = "#page == 1">上一页</s:if>
		<s:if test = "#page > 1"><a href = "<%= context%>/manager/listproduct?page=${page-1}">上一页</a></s:if>
		<s:if test = "#page == #maxpage ">下一页</s:if>
		
		<s:if test = "#page < #maxpage "><a href = "<%= context%>/manager/listproduct?page=${page+1}">下一页</a></s:if>
		<s:if test = "#page == #maxpage">末页</s:if>
		<s:if test = "#page < #maxpage"><a href = "<%= context%>/manager/listproduct?page=${maxpage}">末页</a></s:if>
		<br>
		<a href = "<%= context%>/manager/index.jsp">返回主页</a>
	</h1>
</body>
</html>