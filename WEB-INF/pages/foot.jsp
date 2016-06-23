<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<footer>
    <section class="bottom_content">
        Copyright © 2016 <a href="<%=basePath %>" class="one">爱西电</a>
        | <a href="<%=basePath %>message/index.htm" class="one">给我们留言</a>
        | <a href="<%=basePath %>mystatic/aboutUs.html">关于我们</a>
        | 西安电子科技大学
    </section>
</footer>