<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	int port=request.getServerPort();
	String basePath="";
	if(port==80){
		basePath=request.getScheme() + "://"+ request.getServerName()+path+"/";
	}
	else{
		basePath=request.getScheme() + "://"+ request.getServerName()+":"+port+path + "/";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>鑫的博客</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>static/css/main.css" />
<script type="text/javascript"
	src="<%=basePath%>static/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/main.js"></script>
</head>
<body>
	<div>
		<div class='art_header'>
			<font>文章列表</font>
			<a a href="<%=basePath%>admin/article/toAddArticle.htm" class="addArticle">添加</a>
		</div>
		<div class="list_table">
			<table width="100%" cellspacing="0" cellpadding="1" class="tab">
				
				<tr align="center" bgcolor="#eaeaea">
					<td>编号</td>
					<td>标题</td>
					<td>标签</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${pm.list}" var="act">
					<tr>
						<td>${act.id}</td>
						<td><a href="<%=basePath%>article/${act.id}.html">${act.title}</a></td>
						<td>${act.tagsList}</td>
						<td>${act.date}</td>
						<td><a
							href="<%=basePath%>admin/article/toUpdateArticle.htm?id=${act.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="<%=basePath%>admin/article/deleteArticle.htm?id=${act.id}">删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!--分页-->
		<div class="cut_page">
			<cp:CutPage url="articleList.htm" pm="${pm}"></cp:CutPage>
		</div>
		<!--分页 结束-->
	</div>
</body>
</html>