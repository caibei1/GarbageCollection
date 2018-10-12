<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/assets/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/assets/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/assets/css/component.css" />
<div class="demo-1">
	<div class="content">
		<div id="large-header" class="large-header">
			<canvas id="demo-canvas"></canvas>
			<div class="logo_box">
				<h3>欢迎你</h3>
				<form action="${pageContext.request.contextPath}/toLogin"  method="post">
					<div class="input_outer">
						<input name="name" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
					</div>
					<div class="input_outer">
						<input name="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
					</div>
					<p>${msg }</p>
					<div class="mb2"><button class="act-but submit" style="color: #FFFFFF;width: 500px;height: 76px;"><span style="font-size: 35px;">登录</span></button></div>
					<div class="mb2" style="text-align: center;"><a style="color: white" href="${pageContext.request.contextPath }/toRegisterPage"><span style="font-size: 25px;">注册</span></a></div>
				</form>
			</div>
		</div>
	</div>
</div><!-- /container -->
<script src="${pageContext.request.contextPath}/static/assets/js/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/rAF.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/demo-1.js"></script>

<script type="text/javascript">
	
</script>

