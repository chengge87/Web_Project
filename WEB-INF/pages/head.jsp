<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<header>
	<div class="top_top">
		<div class="fr">
			<a href="#">加入收藏</a> <a href="#">设为首页</a>
		</div>
	</div>
	<header class="top_content">
		<hgroup class="fl">
			<h1 class="logo fl">
				<a href="/" title="爱西电">爱西电</a>
			</h1>

			<h2 class="myheart fl">爱西电，爱软院，永不言退，相信自己，相信伙伴，我们是最好的团队。。</h2>
		</hgroup>
		<section class="search fr">
			<form action="<%=basePath%>search/index.htm" method="post"
				name="keyform">
				<input type="text" class="search_key" name="key" value="请输入搜索内容。。。"
					onfocus="if(this.value==this.defaultValue)this.value='';"
					onblur="if(this.value=='')this.value=this.defaultValue;" /> <input
					type="submit" class="search_btn" value="搜索" />
			</form>
			<div class="hot_tag">
				<c:forEach items="${hotTag}" var="tag">
					<a href="<%=basePath %>search/index.htm?key=${tag.tagName}"
						title="${tag.tagName}">${tag.tagName}</a>
				</c:forEach>
			</div>
		</section>
	</header>
</header>