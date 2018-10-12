<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="static/jquery/jquery.min.js" type="text/javascript"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<button id="test" type="button" class="btn btn-default">查询</button>
	<table class="table table-striped">
  <caption>xxxx</caption>
  <thead>
    <tr>
      <th>year</th>
      <th>m1</th>
      <th>m2</th>
      <th>m3</th>
      <th>m4</th>
    </tr>
  </thead>
  <tbody id="form">
    
  </tbody>
</table>
	</div>
</div>


</body>

<script type="text/javascript">
	$("#test").click(function(){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/search",
			success : function(types){
				$.each(types,function(i,type){
					var tr = $("<tr></tr>");
					var td1 = $("<td></td>");
					var td2 = $("<td></td>");
					var td3 = $("<td></td>");
					var td4 = $("<td></td>");
					var td5 = $("<td></td>");
					td1.append(type.year);
					td2.append(type.m1);
					td3.append(type.m2);
					td4.append(type.m3);
					td5.append(type.m4);
					tr.append(td1);
					tr.append(td2);
					tr.append(td3);
					tr.append(td4);
					tr.append(td5);
					$("#form").append(tr);
				});
			},
			dataType : "json",
		});
	});

</script>
</html>