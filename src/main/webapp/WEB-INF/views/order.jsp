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
<jsp:include page="header.jsp"></jsp:include>
<body>

<div class="col-sm-12">
    <div style="height:900px;-webkit-background-size:100% 100%; ">
        <div style="height: 100px;"></div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-7"
                 style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid aquamarine;">
                <font >填写订单</font>
                <form id="myform" class="form-horizontal" style="margin-top: 5px;" action="${pageContext.request.contextPath }/saveOrder" method="post">
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">废品种类</label>
                        <div class="col-sm-6">
                            <input type="type" class="form-control" id="type" name="type" readonly="readonly"
                                   value="${type}">
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">买入价格</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buy">
                            <span id="buyMsg" style="color:red; display: none;">买入价格不能为空</span>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">几成新</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="new1" name="new1" style="display: inline-block; width: 350px;">
                                <option  value="1">9成新
                                <option  value="2">8成新
                                <option  value="3">7成新
                                <option  value="4">6成新
                                <option  value="5">5成新
                                <option  value="6">4成新
                                <option  value="7">3成新
                                <option  value="8">2成新
                                <option  value="9">1成新
                            </select>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">推荐价格</label>
                        <div class="col-sm-6">
                            <input type="type" class="form-control" id="price" name="price" readonly="readonly">

                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name" name="name"
                                   value="${user.name}">
                            <span id="nameMsg" style="color:red; display: none;">名字不能为空</span>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>




                    <div class="form-group">
                        <label  class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="tel" name="tel"
                                   value="${user.tel}">
                            <span id="telMsg" style="color:red; display: none;">手机号不能为空</span>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>


                    <div  id="selectArea">
                        <label  class="col-sm-2 control-label">请选择地区</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="area" name="area" style="display: inline-block; width: 350px;">

                            </select>
                        </div>
                    </div>

                    <div style="height: 45px; clear:both;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">详细地址</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="moreArea" name="moreArea">
                            <span id="moreAreaMsg" style="color:red; display: none;">地址不能为空</span>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <!-- 日期 -->
                    <div>
                        <label  class="col-sm-2 control-label">请选择日期</label>
                        <div class="col-sm-6">
                            <input id="time" name="time" class="jcDate form-control" style="display: inline-block; width: 350px;" />

                            </select>
                            <span id="timeMsg" style="color:red; display: none;">日期不能为空</span>
                        </div>
                    </div>

                    <div style="height: 45px; clear:both;"></div>




                    <div style="height: 45px; clear:both;"></div>
                    <div style="height: 45px; clear:both;"></div>
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div style="width: 600px; display: inline-block;"></div>
                        <input class="btn btn-primary btn-lg" type="submit" width="100" value="提交" id="submit" name="submit">
                    </div>
                    <div style="height: 45px; clear:both;"></div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">


    $(function() {


        <!-- 加载地区 -->
        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/findArea",
            data : {},
            success : function (areas) {
                $.each(areas,function (i,area) {
                    var option = $("<option>"+area.area+"</option>");
                    option.attr("value",area.id);
                    $("#area").append(option);
                });
            },
            dataType : "json"
        });

        $("input.jcDate").jcDate({
            IcoClass : "jcDateIco",
            Event : "click",
            Speed : 100,
            Left : 0,
            Top : 28,
            format : "-",
            Timeout : 100
        });
    });


    $("#submit").click(function(){
        if($("#name").val()==""){
            $("#nameMsg").show();
            $("#timeMsg").hide();
            $("#telMsg").hide();
            $("#buyMsg").hide();
            $("#moreAreaMsg").hide();
            return false;
        }

        if($("#buy").val()==""){
            $("#nameMsg").hide();
            $("#timeMsg").hide();
            $("#telMsg").hide();
            $("#buyMsg").show()
            $("#moreAreaMsg").hide();
            return false;
        }

        if($("#tel").val()==""){
            $("#nameMsg").hide();
            $("#timeMsg").hide();
            $("#telMsg").hide();
            $("#telMsg").show();
            $("#buyMsg").hide();
            $("#moreAreaMsg").hide();
            return false;
        }

        if($("#time").val()==""){
            $("#nameMsg").hide();
            $("#telMsg").hide();
            $("#timeMsg").show();
            $("#buyMsg").hide();
            $("#moreAreaMsg").hide();
            return false;
        }

        if($("#moreArea").val()==""){
            $("#nameMsg").hide();
            $("#telMsg").hide();
            $("#timeMsg").hide();
            $("#buyMsg").hide();
            $("#moreAreaMsg").show();
            return false;
        }


    });

    $("#buy").change(function () {
        var buy =  parseFloat($("#buy").val());
        var new1 = parseFloat($("#new1").val());
        var price;
        if(new1<5){
            price=buy*(10-new1-1)/10;
        }else {
            price=buy*(5-new1*0.3)/10;
        }
        $("#price").attr("value",price);
    });

    $("#new1").change(function () {
        var buy =  parseFloat($("#buy").val());
        var new1 = parseFloat($("#new1").val());
        var price;
        if(buy!=""){
            if(new1<5){
                price=buy*(10-new1-1)/10;
            }else {
                price=buy*(5-new1*0.3)/10;
            }
            $("#price").attr("value",price);
        }
    });

</script>



</html>
