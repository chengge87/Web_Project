<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<style type="text/css">
table{
border-collapse:collapse;
font-size:12px;
color:#686868;
font-family:Arial, Helvetica, sans-serif;
}
table td{
border:1px #f1f1f1 solid;
line-height:30px;
height:30px;
text-align: center;
}
input[type="text"],input[type="password"]{
border:1px #CCCCCC solid;
width:220px;
height:17px;

}
input[type="submit"],input[type="reset"]{
border:none;
}
}
</style>
</head>

<body>
<div style="width:400px;margin:0px auto; border:1px #ddd solid; margin-top:200px;">
  <form id="form1" name="form1" method="post" action="<%=basePath%>admin/login.htm">
    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="1">
      <tr>
        <td colspan="2">欢迎登录</td>
      </tr>
      <tr>
        <td width="22%">用户名</td>
        <td><label>
          <input name="username" type="text" id="username" />
        </label></td>
      </tr>
      <tr>
        <td width="22%">密码</td>
        <td><input name="password" type="password" id="pwd" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input type="submit" name="Submit" value="登录" />
        <input type="reset" name="Submit2" value="重置" /></td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
