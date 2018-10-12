<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加类型</title>
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
</head>
<body>
<div class="col-sm-12">
    <div style="height:900px;-webkit-background-size:100% 100%; ">
        <div style="height: 100px;"></div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-7"
                 style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid aquamarine;">
                <div style="font-size: 40px;">类型</div>
                <form action="${pageContext.request.contextPath}/saveType" id="myform"  class="form-horizontal" style="margin-top: 5px;" method="post">
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="id" name="id" readonly="readonly" >
                        </div>
                    </div>
                    <div style="height: 25px;"></div>



                    <div class="form-group">
                        <label  class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-6">
                            <input type="type" class="form-control" id="name" name="name" >
                            <span id="namemessage" style="color: red;display: none;">类型名称不能为空</span>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">信息</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="url" name=url >
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div style="height: 45px; clear:both;"></div>
                    <div style="height: 45px; clear:both;"></div>
                    <div class="col-sm-6">

                    </div>
                    <div class="col-sm-6">
                        <div class="col-sm-4"></div>
                        <button class="btn btn-primary btn-lg" type="button" width="100"  id="back" style="margin-right: 50px;" onClick="javascript:window.location='${pageContext.request.contextPath }/findAllType'"/>返回</button>

                        <input type="submit" id="submit" class="btn btn-primary btn-lg"  value="添加">
                    </div>
                    <div style="height: 45px; clear:both;"></div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">


    $("#submit").click(function(){
     if($("#name").val()==""){
         $("#namemessage").show();
         return false;
        }
    });

</script>
</html>
