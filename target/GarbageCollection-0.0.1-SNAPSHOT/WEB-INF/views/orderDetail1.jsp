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
    <link rel="stylesheet" type="text/css"
          href="static/date/css/jcDate.css"
          media="all" />
    <script type="text/javascript"
            src="static/date/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="static/date/js/jQuery-jcDate.js"></script>
</head>
<!-- 引入header.jsp -->
<jsp:include page="buyerHeader.jsp"></jsp:include>
<body>

<div class="col-sm-12">
    <div style="height:900px;-webkit-background-size:100% 100%; ">
        <div style="height: 100px;"></div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-7"
                 style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid aquamarine;">
                <font >填写订单</font>
                <form id="myform" class="form-horizontal" style="margin-top: 5px;">
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">废品种类</label>
                        <div class="col-sm-6">
                            <input type="type" class="form-control"  readonly="readonly"
                                   value="${order.type}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>



                    <div class="form-group">
                        <label  class="col-sm-2 control-label">推荐价格</label>
                        <div class="col-sm-6">
                            <input type="type" class="form-control"  readonly="readonly"
                            value="${order.price}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  readonly="readonly"
                                   value="${order.sellerName}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>




                    <div class="form-group">
                        <label  class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  readonly="readonly"
                                   value="${order.tel}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">地区</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  readonly="readonly"
                                   value="${order.areaName}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">详细地址</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  readonly="readonly"
                                   value="${order.moreArea}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">时间</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  readonly="readonly"
                                   value="${order.time}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>




                    <div style="height: 45px; clear:both;"></div>
                    <div style="height: 45px; clear:both;"></div>
                    <div class="col-sm-4">

                    </div>
                    <div class="col-sm-4">

                        <button class="btn btn-primary btn-lg" type="button" width="100"  id="back">返回</button>


                    </div>
                    <div style="height: 45px; clear:both;"></div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">

    $("#back").click(function () {
        window.history.go(-1);
    });



</script>



</html>
