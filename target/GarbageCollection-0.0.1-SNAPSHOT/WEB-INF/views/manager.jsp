<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="static/jquery/jquery.min.js" type="text/javascript"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/rAF.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/demo-1.js"></script>
<link rel="stylesheet" type="text/css"
      href="static/date/css/jcDate.css"
      media="all" />
<script type="text/javascript"
        src="static/date/js/jquery.min.js"></script>
<script type="text/javascript"
        src="static/date/js/jQuery-jcDate.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
</head>

<style>
 .h{
   font-size: 50px;
   font-weight: bolder;
   text-align: left;

}
</style>
<body>

<div class="container-fluid">
  <div class="navbar navbar-default" role="navigation">
    <div class="col-sm-12" style="height:180px; text-align: center; line-height: 80px; background: #2fa4e7;">
      <font style="font-style: italic; font-size: 50px; text-align: center; line-height: 180px;">废品回收</font>
    </div>
    </div>
  </div>

<p class="h">管理者模块</p>
<ul class="nav nav-pills nav-stacked">
  <li  style="font-size: 50px"><a href="${pageContext.request.contextPath}/findUserList">用户管理</a></li>
  <li  style="font-size: 50px"><a href="${pageContext.request.contextPath}/findAllType">类型管理</a></li>
  
</ul>

</body>
</html>