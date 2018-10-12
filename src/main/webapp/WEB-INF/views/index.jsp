<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="static/jquery/jquery.min.js" type="text/javascript"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>
<body>
<div style="height: 40px; clear: both"></div>
<div style="height: 20px; color: gray; text-align: center;"><h1>请选择废品种类</h1></div>
<div  style=" border: 0px red solid; width: 100%; clear: both;">
	<div style="height: 90px;" ></div>
	<div id="type"></div>
</div>
</body>
<script type="text/javascript">
	window.onload=function(){
		
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/findAllType3",
			data : {},
			success : function(types){
				//alert(types);
				$.each(types,function(i,type){
					var div = $("<div style=' border: 1px gray solid; text-align: center; height: 200px;'></div>");
					div.addClass("col-sm-4");
					var a = $("<a style='color: black; font-size: 55px; line-height: 200px;' href='${pageContext.request.contextPath}/writeOrder?type="+type.name+"'></a>");
					
					a.text(type.name);
					div.append(a);
					$("#type").append(div);
				});
			},
			dataType : "json",
			//contentType: "application/x-www-form-urlencoded; charset=utf-8"
		});
	};
</script>
</html>