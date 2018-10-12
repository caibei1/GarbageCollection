<%--
  Created by IntelliJ IDEA.
  User: 北
  Date: 2018/4/4
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
    <script src="static/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>
<body>
<div class="table-responsive">
    <div style="height: 200px;"></div>
    <table  class="table">
        <caption style="font-size: 35px;"><strong>我的订单</strong></caption>
        <thead>
        <tr  style="font-size: 28px;">
            <th>废品种类</th>
            <th>收购日期</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody id="table" style="font-size: 28px;">


        </tbody>
    </table>
</div>
</body>

<script type="text/javascript">


    $(function(){
        <!-- 加载订单 -->
        var userId = ${user.id};
        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/findOrderByUserId",
            data : {"id":userId},
            success : function (orders) {
                $.each(orders,function (i,order) {
                    var tr = $("<tr></tr>")
                    var td1 = $("<td>"+order.type+"</td>");
                    var td2 = $("<td>"+order.time+"</td>");
                    if(order.state==0){
                        var td3 = $("<td>"+"待收购"+"</td>");
                    }else
                        var td3 = $("<td>"+"已收购"+"</td>");
                    tr.append(td1);
                    tr.append(td2);
                    tr.append(td3);
                    $("#table").append(tr);
                });
            },
            dataType : "json"
        });
    });






</script>



</html>
