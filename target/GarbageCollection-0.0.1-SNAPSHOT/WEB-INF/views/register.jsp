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
<div class="col-sm-12">
    <div style="height:900px;-webkit-background-size:100% 100%; ">
        <div style="height: 100px;"></div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-7"
                 style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
                <font>用户注册</font>
                <form id="myform" class="form-horizontal" style="margin-top: 5px;" action="${pageContext.request.contextPath }/register" method="post">
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name" name="name"
                                   placeholder="请输入名字">
                            <span id="nameMsg" style="color:red; display: none;">名字不能为空</span>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="password" name="password"
                                   placeholder="请输入密码">
                            <span id="passwordMsg" style="color:red; display: none;">密码不能为空</span>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="rePassword" name="rePassword"
                                   placeholder="请确认密码">
                            <span id="rePasswordMsg1" style="color:red; display: none;">确认密码不能为空</span>
                            <span id="rePasswordMsg2" style="color:red; display: none;">两次密码不一致</span>
                        </div>
                    </div>
                    <div style="height: 25px;"></div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="tel" name="tel"
                                   placeholder="请输入手机号">
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

                    <div  id="selectSex">
                        <label  class="col-sm-2 control-label">请选择性别</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="sex" name="sex" style="display: inline-block; width: 350px;">
                                <option  value="1">男
                                <option  value="2">女
                            </select>
                        </div>
                    </div>

                    <div style="height: 45px; clear:both;"></div>

                    <div  id="selectIdentity">
                        <label  class="col-sm-2 control-label">请选择身份</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="identity" name="identity" style="display: inline-block; width: 350px;">
                                <option  value="2">普通用户
                                <option  value="1">废品收购员
                            </select>
                        </div>
                    </div>
                    <div style="height: 45px; clear:both;"></div>
                    <div style="height: 45px; clear:both;"></div>
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div style="width: 600px; display: inline-block;"></div>
                        <input class="btn btn-primary btn-lg" type="submit" width="100" value="注册" id="submit" name="submit">
                    </div>
                    <div style="height: 45px; clear:both;"></div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">


    $(function(){
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
    });




    $("#submit").click(function(){
        if($("#name").val()==""){
            $("#nameMsg").show();
            $("#passwordMsg").hide();
            $("#rePasswordMsg1").hide();
            $("#rePasswordMsg2").hide();
            $("#telMsg").hide();
            return false;
        }
        if($("#password").val()==""){
            $("#nameMsg").hide();
            $("#passwordMsg").hide();
            $("#rePasswordMsg1").hide();
            $("#rePasswordMsg2").hide();
            $("#telMsg").hide();
            $("#passwordMsg").show();
            return false;
        }
        if($("#rePassword").val()==""){
            $("#nameMsg").hide();
            $("#passwordMsg").hide();
            $("#rePasswordMsg1").hide();
            $("#rePasswordMsg2").hide();
            $("#telMsg").hide();
            $("#rePasswordMsg1").show();
            return false;
        }
        if($("#password").val()!=$("#rePassword").val()){
            $("#nameMsg").hide();
            $("#passwordMsg").hide();
            $("#rePasswordMsg1").hide();
            $("#rePasswordMsg2").hide();
            $("#telMsg").hide();
            $("#rePasswordMsg2").show();
            return false;
        }
        if($("#tel").val()==""){
            $("#nameMsg").hide();
            $("#passwordMsg").hide();
            $("#rePasswordMsg1").hide();
            $("#rePasswordMsg2").hide();
            $("#telMsg").hide();
            $("#telMsg").show();
            return false;
        }
    });

</script>



</html>
