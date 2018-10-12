<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link href="static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="static/jquery/jquery.min.js" type="text/javascript"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
<!-- -->
$(document).ready(function(){
	window.setTimeout("window.location.href='${pageContext.request.contextPath }/index'",3000)
});
</script>
<div>
   订单提交成功，页面将在<font color="red">3秒</font>后跳转，如果没跳转，请点击<a href="${pageContext.request.contextPath }/index">这里</a>
</div>