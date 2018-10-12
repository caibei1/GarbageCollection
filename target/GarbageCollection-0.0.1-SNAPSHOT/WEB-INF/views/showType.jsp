<%--
  Created by IntelliJ IDEA.
  User: 99680
  Date: 2018/4/13
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>类型信息</title>
</head>
<link href="static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="static/jquery/jquery.min.js" type="text/javascript"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
      href="static/date/css/jcDate.css"
      media="all" />
<script type="text/javascript"
        src="static/date/js/jquery.min.js"></script>
<script type="text/javascript"
        src="static/date/js/jQuery-jcDate.js"></script>
<body>
<div class="col-sm-12">
    <div style="height:900px;-webkit-background-size:100% 100%; ">
        <div style="height: 100px;"></div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-7"
                 style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid aquamarine;">
                <div style="font-size: 40px;">类型信息</div>
                <form action="${pageContext.request.contextPath}/findAllType" id="myform"  class="form-horizontal" style="margin-top: 5px;" method="post">
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="id" name="id" readonly="readonly" value="${type.id}" >
                        </div>
                    </div>
                    <div style="height: 25px;"></div>



                    <div class="form-group">
                        <label  class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name" name="name"  value="${type.name}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">信息</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="url" name="url" value="${type.url}" >
                        </div>
                    </div>
                    <div style="height: 25px;"></div>


                    <div style="height: 45px; clear:both;"></div>
                    <div style="height: 45px; clear:both;"></div>
                    <div class="col-sm-6">

                    </div>
                    <div class="col-sm-6">
                        <div class="col-sm-4"></div>

                        <span id="update"  class="btn btn-lg btn-primary">更新</span>
                        <input type="submit" id="submit" class="btn btn-primary btn-lg"  value="返回">
                    </div>
                    <div style="height: 45px; clear:both;"></div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#update").click(function(){

        var name = $("#name").val();
        var url = $("#url").val();
        var id = $("#id").val();
        $.ajax({
            type:"post",
            data: {"name":name,"id":id,"url":url},
            url:"${pageContext.request.contextPath}/updateTypeById",
            success:function(data){
               alert("success");
            },
            error:function(){
                alert("更新成功");
                window.location.href="${pageContext.request.contextPath}/findAllType";
            },
            dataType:"json"
        });
    });


</script>
</html>
