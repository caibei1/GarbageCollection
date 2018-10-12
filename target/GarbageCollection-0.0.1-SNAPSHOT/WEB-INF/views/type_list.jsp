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
<body>

<table class="table table-striped">
    <caption style="font-size: 40px;align-content: center;">类型列表</caption>
    <thead>
    <tr style="font-size: 28px;">
        <th style="font-size: 20px;">类型</th>
        <th style="font-size: 20px;">操作</th>
    </tr>
    <tbody style="font-size: 28px;"  id="type">
    </tbody>
    </thead>
</table>

<div class="col-sm-9"></div>
<div class="col-sm-3">
    <a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/returnManager">返回</a>
    <a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/saveload">添加</a>
</div>
</div>
</body>
<script type="text/javascript">
    $(function(){

        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/findAllType1",
            data : {
            },
            success : function(types){
                //alert(types);
                $.each(types,function(i,type){
                    var tr=$("<tr></tr>");
                    var td1=$("<td></td>");
                    var td2=$("<td></td>");
                    var a = $("<a href='${pageContext.request.contextPath}/showType?id="+type.id+"'></a>");
                    var b=  $("<a href='${pageContext.request.contextPath}/deleteType?id="+type.id+"'></a>");
                    a.text(type.name);
                    td1.append(a);
                    b.append("删除");
                    td2.append(b);
                    tr.append(td1);
                    tr.append(td2);

                    $("#type").append(tr);
                });
            },
            dataType : "json",
        });
    });
</script>
</html>
