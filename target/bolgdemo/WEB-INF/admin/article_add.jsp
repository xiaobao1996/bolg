<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="main-container container-fluid">
    <div class="page-container">
        <!-- Page Sidebar -->
        <jsp:include page="left.jsp"/>
        <!-- /Page Sidebar -->
        <!-- Page Content -->
        <div class="page-content">
            <!-- Page Breadcrumb -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <a href="#">系统</a>
                    </li>
                    <li>
                        <a href="#">文章管理</a>
                    </li>
                    <li class="active">添加文章</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->

            <!-- Page Body -->
            <div class="page-body">

                <div class="row">
                    <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="widget">
                            <div class="widget-header bordered-bottom bordered-blue">
                                <span class="widget-caption">发布文章</span>
                            </div>
                            <div class="widget-body">
                                <div id="horizontal-form">
                                    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/article/add.do" method="post">

                                        <div class="form-group">
                                            <label for="title" class="col-sm-2 control-label no-padding-right">文章名称</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="title" placeholder="请输入文章名称" name="title" value="" required="" type="text">
                                            </div>
                                            <p class="help-block col-sm-4 red">* 必填</p>
                                        </div>

                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 control-label no-padding-right">所属栏目</label>
                                            <div class="col-sm-6">
                                                <select name="cateid" id="cateid" style="width: 100%;">
                                                    <c:forEach items="${cates}" var="cate">
                                                        <c:if test="${cate.level==0}">
                                                            <option selected="selected" value="${cate.id}">${cate.catename}</option>
                                                        </c:if>
                                                        <c:if test="${cate.level==1}">
                                                            <option selected="selected" value="${cate.id}">|----${cate.catename}</option>
                                                        </c:if>
                                                        <c:if test="${cate.level==2}">
                                                            <option selected="selected" value="${cate.id}">|--------${cate.catename}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <p class="help-block col-sm-4 red">* 必填</p>
                                        </div>

                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 control-label no-padding-right">作者</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="name" placeholder="请输入文章作者!" name="author" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="keywords" class="col-sm-2 control-label no-padding-right">关键字</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="keywords" placeholder="请输入文章关键字" name="keywords" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="desc" class="col-sm-2 control-label no-padding-right">文章描述</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="desc" placeholder="请输入文章描述" name="des" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pic" class="col-sm-2 control-label no-padding-right">缩略图</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="pic" placeholder="" name="pic" type="hidden">
                                                <img id="pic_src" src="" width="160" >
                                                <input type="file" name="imgup" id="upPic">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="state" class="col-sm-2 control-label no-padding-right">是否推荐</label>
                                            <div class="col-sm-6">
                                                <label style="margin-right:15px;">
                                                    <input checked="checked" name="state" value="1" type="radio">
                                                    <span class="text">是</span>
                                                </label>
                                                <label style="margin-right:15px;">
                                                    <input checked="checked" name="state"  value="0" type="radio">
                                                    <span class="text">否</span>
                                                </label>
                                            </div>
                                            <p class="help-block col-sm-4 red">* 必填</p>
                                        </div>
                                        <textarea name ="content" id="myEditor">输入文章内容……</textarea>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10" >
                                                <button type="submit" class="btn btn-sm btn-azure btn-addon" style="margin:20px auto;">保存信息</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /Page Body -->
        </div>
        <!-- /Page Content -->
    </div>
</div>

<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/style/jquery_002.js"></script>
<script src="${pageContext.request.contextPath}/style/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/style/jquery.js"></script>
<!--Beyond Scripts-->
<script src="${pageContext.request.contextPath}/style/beyond.js"></script>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
</body></html>
<script>
    $(function(){
        $("#pic_src").hide();

        $("#upPic").change(function(){
            var formData = new FormData();
            var file = $("#upPic")[0].files[0];
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
                    $("#pic_src").show();
                    $("input[name='pic']").val(imgPath);
                    console.log($("input[name='img']").val());
                    $("#pic_src").attr("src",imgPath);
                },
                error: function (data) {
                    alert(data);
                }
            });
        });
        UE.getEditor('myEditor',{
            initialFrameHeight:300,
            initialFrameWidth:800,
            elementPathEnabled:false
        });
    });

</script>

