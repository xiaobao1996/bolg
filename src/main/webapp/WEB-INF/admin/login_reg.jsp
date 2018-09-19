<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <style>
        .forms{width:40%;margin: 100px auto;}
        #showImg{display: none;}
    </style>
</head>
<body>

<body>
<form class="layui-form forms" action="${pageContext.request.contextPath}/reg.do" enctype="multipart/form-data" method="post">
        <h1 style="text-align: center;margin: 20px auto">用户注册中心 </h1>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-block">
            <input type="password" name="cpassword" required lay-verify="required" placeholder="确认密码" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="1" title="男">
            <input type="radio" name="sex" value="0" title="女" checked>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">生日</label>
        <div class="layui-input-block">
            <input type="text" name="birthday" class="layui-input" id="birthday">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">头像</label>
        <div class="layui-input-block">
            <input type="file" name="image" class="layui-input" id="img_up">
        </div>
    </div>
    <div class="layui-input-block" id="showImg" style="margin: 20px auto;padding: 0 200px;">
        <img src="" alt="" id="img_src" width="160px">
    </div>
        <input type="hidden" name="img" class="layui-input" value="">

    <div class="layui-form-item">
        <div class="layui-input-block" style="text-align: center">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-danger">重置</button>
        </div>
    </div>
</form>



</body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js "></script>
<script src="${pageContext.request.contextPath}/js/jquery.ajaxfileupload.js "></script>
<script src="${pageContext.request.contextPath}/layui/layui.js "></script>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.on('submit(formDemo)', function(data){

            return true;
        });

    });
    layui.use("laydate", function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: "#birthday" //指定元素
        });
    });
    $("#img_up").change(function(){
        var formData = new FormData();
        var file = $("#img_up")[0].files[0];
        console.log(file);
        formData.append("image", file);
        $.ajax({
            url : "${pageContext.request.contextPath}/img/upload.do",
            scriptCharset : "UTF-8",
            contentType : "multipart/form-data; charset=UTF-8",
            type : 'POST',
            cache : false,
            async:false,
            data : formData,
            dataType: "json",
            processData : false,
            contentType : false,
            success: function (data) {
                var imgPath = data.img;
                $("#showImg").show();
                $("input[name='img']").val(imgPath);
                console.log($("input[name='img']").val());
                $("#img_src").attr("src",imgPath);
            },
            error: function (data) {
                alert(data);
            }
            });
        });
</script>
</body>
</html>
