<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户类型</title>
    <link href="static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
    <script src="static/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<table class="table table-striped">
    <caption style="font-size: 40px;align-content: center;">用户列表</caption>
    <thead>
    <tr style="font-size: 28px;">
        <th style="font-size: 20px;">用户</th>
        <th style="font-size: 20px;">操作</th>
    </tr>
    <tbody style="font-size: 28px;"  id="user">
    </tbody>
    </thead>
</table>

<div class="col-sm-9"></div>
<div class="col-sm-3">
    <a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/loginManager">返回</a>


</div>
</div>
</body>
<script type="text/javascript">
    $(function(){
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/findUserList1",
            data:{
                "id":user.id

            },
            success : function(userlist) {
                $.each(userlist, function (i,user) {
                    var name=user.name;
                    var tr=$("<tr></tr>");
                    var td1=$("<td></td>");
                    var td2=$("<td></td>");
                    var a=$("<a href='${pageContext.request.contextPath}/showUser?id="+user.id+"'></a>");
                    var b=$("<a href='${pageContext.request.contextPath}/deleteUser?id="+user.id+"'></a>");
                    a.text(name);
                    td1.append(a);
                    b.append("删除");
                    td2.append(b);
                    tr.append(td1);
                    tr.append(td2);
                    $("#user").append(tr);
                });
            },
            dataType:"json",
        });
    });

</script>
</html>