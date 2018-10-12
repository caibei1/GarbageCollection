<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<div class="container-fluid">
<div class="navbar navbar-default" role="navigation"> 
    <div class="col-sm-12" style="height:180px; text-align: center; line-height: 80px; background: #2fa4e7;">
	   <font style="font-style: italic; font-size: 50px; text-align: center; line-height: 180px;">废品回收</font>
	</div>
	
	<c:if test="${user==null }">
		<div class="col-sm-6" style="border: 30px 0px;">
		</div>
		<div class="col-sm-6" style="height: 60px; padding: 25px;">

			<div class="col-sm-4">
				<a href="${pageContext.request.contextPath }/buyerIndex" style="font-size: 25px;"><span class="glyphicon glyphicon-user"  style="font-size: 25px;"></span> 首页</a>
			</div>
	    	<div class="col-sm-4">
	    		<a href="${pageContext.request.contextPath }/toRegisterPage" style="font-size: 25px;"><span class="glyphicon glyphicon-user"  style="font-size: 25px;"></span> 注册</a>
	    	</div>
	    	<div class="col-sm-4">
	            <a href="${pageContext.request.contextPath }/login" style="font-size: 25px;"><span style="font-size: 25px;" class="glyphicon glyphicon-log-in" ></span> 登录</a> 
	    	</div>
    	</div> 
	</c:if>
        	
	<c:if test="${user!=null }">
		<div class="col-sm-5" style="border: 30px 0px;">
		</div>
		<div class="col-sm-7" style="height: 60px; padding: 25px;">

			<div class="col-sm-5">
				<a style="font-size: 29px; color: black;" href="${pageContext.request.contextPath }/buyerIndex"> 待收购订单</a>
			</div>

	    	<div class="col-sm-4">
	    		<a style="font-size: 29px; color: black;" href="${pageContext.request.contextPath }/historyOrder"> 历史订单</a>
	    	</div>
	    	<div class="col-sm-3">
	            <a style="font-size: 29px; color: black;" href="${pageContext.request.contextPath }/exit"> 退出</a>
	    	</div>
		</div>
	</c:if>
    
</div>
</div>
