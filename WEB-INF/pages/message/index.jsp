<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cp"%>
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
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/message.css" />
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
					<div class="comment_list">
						<div class="comment_title">
							雁过留声|人过留言|已经有 ( <em>${pm.sumCount}</em> ) 位网友发表了留言，你也来留个言吧!
						</div>
						<div class="commonpost" id="posttop">
							<div class="commontitle">欢迎参与留言，请在这里发表您的看法、交流您的观点@禁止各种脚本</div>
							<form id="commentform" name="commentform" method="post"
								action="savaMsg.htm" onsubmit="return checkMsg()">
								<p>
									<input type="text" name="username" id="username" class="text"
										value="" size="28" tabindex="1" /> <label for="username">名称(必填)</label>
								</p>
								<p>
									<input type="text" name="mail_qq" id="mail_qq" class="text"
										value="" size="28" tabindex="2" /> <label for="mail_qq">邮箱</label>
								</p>
								<p>
									<textarea name="comment" style="width: 600px; height: 100px"
										id="comment" class="text" cols="40" rows="4" tabindex="5"></textarea>
								</p>
								<p>
									<input name="btnSumbit" type="submit" tabindex="6"
										value="发布我的留言" class="reply_btn" />
								</p>
							</form>
						</div>
						<div class="comment_list_list">
							<ul>
								<c:forEach items="${pm.list}" var="msg" varStatus="status">
									<li id="msg${msg.id}"><span class="num"> <b>${pm.sumCount-(pm.pageCount*(pm.currentPage-1))-status.index}楼</b>
											<a href="javascript:void(0)" rel="nofollow" class="commoner"
											title="${msg['weburl']}">${msg['username']}</a> 发表于:<fmt:formatDate
												value="${msg.date}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
											class="reply" href="#">回复</a>
									</span>
										<div class="comment-text">${msg.content}</div></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<!--S=分页-->
				<div class="cut_page">
					<cp:CutPage url="index.htm" pm="${pm}"></cp:CutPage>
				</div>
				<!--E=分页-->

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
	<!-- E= 页面的底部 -->
	<script type="application/javascript" src="<%=basePath%>js/jquery-1.7.1.js"></script>
	<script type="application/javascript" src="<%=basePath%>js/common.js"></script>
	<script type="application/javascript" src="<%=basePath%>js/html5shiv.js"></script>
</body>
</html>