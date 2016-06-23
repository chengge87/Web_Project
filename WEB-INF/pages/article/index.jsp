<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	int port = request.getServerPort();
	String basePath = "";
	if (port == 80) {
		basePath = request.getScheme() + "://"
				+ request.getServerName() + path + "/";
	} else {
		basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + port + path + "/";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>鑫的博客</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/cssReset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/article.css" />
</head>
<body>
	<!-- S= 页面的顶部 -->
	<jsp:include page="../head.jsp" />
	<!-- E= 页面的顶部 -->
	<!--S= 页面主体-->
	<section>
		<!-- S= 导航栏-->
		<jsp:include page="../nav.jsp" />
		<!-- E= 导航栏-->
		<!--S= 中部内容-->
		<section class="content">
			<!--S= 内容左边-->
			<section class="content_left">
				<section class="article">
					<aside>
						<div class="article_top_nav">
							当前位置：<a href="<%=basePath%>" class="homepage">首&nbsp;&nbsp;页</a>>><a
								href="<%=basePath %>type/index.htm?id=${article.typeId}"
								title="${article.typeName}">${article.typeName}</a>>>${article.title}
						</div>
						<div class="article_top">
							<h3 class="article_top_title">${article.title}</h3>
							<div class="article_top_other">
								<div class="">
									<span class="read">${article.readCount}</span>&nbsp;阅
								</div>
								<div class="">
									<span class="recommend">${article.commendCount}</span>&nbsp;推荐
								</div>
								<div class="">
									<span class="comment">${article.commentCount}</span>&nbsp;评论
								</div>
							</div>
						</div>
						<div class="article_info">
							分类：${article['typeName']}&nbsp;&nbsp;&nbsp;&nbsp;日期：
							<fmt:formatDate value="${article['date']}"
								pattern="yyyy-MM-dd HH:mm:ss" />
							发布：${article['author']}
						</div>
					</aside>
					<article class="article_content">${article.content}</article>
					<aside class="next">
						<span class="aritcle_up">上一篇：<c:if
								test="${! empty upArticle}">
								<a href="<%=basePath %>article/${upArticle['id']}.html">${upArticle['title']}</a>
							</c:if></span> <span class="aritcle_down">下一篇：<c:if
								test="${! empty downArticle}">
								<a href="<%=basePath %>article/${downArticle['id']}.html">${downArticle['title']}</a>
							</c:if></span>

					</aside>
				</section>
				<section class="comment_list">
					<div class="comment_title">
						已经有 ( <em>${fn:length(articleCommentList)}</em> )
						位网友对此发表了自己的看法，你也评一评吧! 此文不错，我要推荐-->&nbsp;&nbsp;&nbsp;&nbsp;<a
							class="recommend_btn" aid="${article.id}"
							href="javascript:void(0)">推&nbsp;荐</a>
					</div>
					<div class="comment_list_list">
						<ul>
							<c:forEach items="${articleCommentList}" var="comment"
								varStatus="status">
								<li id="comment${comment.id}"><span class="num"> <b>${fn:length(articleCommentList)-status.index}楼</b>
										<a href="javascript:void(0)" rel="nofollow" class="commoner"
										title="${comment['weburl']}">${comment['uname']}</a> 发表于:<fmt:formatDate
											value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
										class="reply" href="#">回复</a>
								</span>
									<div class="comment-text">${comment.content}</div></li>
							</c:forEach>
						</ul>
					</div>
					<div class="commonpost" id="posttop">
						<div class="commontitle">欢迎参与讨论，请在这里发表您的看法、交流您的观点@禁止各种脚本</div>
						<form id="commentform" name="commentform" method="post"
							action="savaComment.htm" onsubmit="return checkComment()">
							<p>
								<input type="hidden" name="articleId" id="articleId"
									value="${article.id}" />
							</p>
							<p>
								<input type="text" name="uname" id="uname" class="text" value=""
									size="28" tabindex="1" /> <label for="uname">名称(必填)</label>
							</p>
							<p>
								<input type="text" name="mail_qq" id="mail_qq" class="text"
									value="" size="28" tabindex="2" /> <label for="mail_qq">邮箱</label>
							</p>
							<p>
								<textarea name="comment" style="WIDTH: 600px; height: 100px"
									id="comment" class="text" cols="40" rows="4" tabindex="5"></textarea>
							</p>
							<p>
								<input name="btnSumbit" type="submit" tabindex="6"
									value="发布我的点评" class="reply_btn" />
							</p>
						</form>
					</div>
				</section>

			</section>
			<!--E= 内容左边-->
			<!--S= 内容右边-->
			<jsp:include page="../right.jsp" />
			<!--E= 内容右边-->
		</section>
		<!--E= 中部内容-->
	</section>
	<!--E= 页面主体-->
	<!-- S= 页面的底部 -->
	<jsp:include page="../foot.jsp" />
	<div class="back">^</div>
	<!-- E= 页面的底部 -->
	<script type="application/javascript" src="<%=basePath%>js/jquery-1.7.1.js"></script>
	<script type="application/javascript" src="<%=basePath%>js/common.js"></script>
	<script type="application/javascript" src="<%=basePath%>js/html5shiv.js"></script>
</body>
</html>