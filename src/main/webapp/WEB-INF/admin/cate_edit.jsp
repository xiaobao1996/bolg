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
                        <a href="#">栏目管理</a>
                    </li>
                    <li class="active">栏目编辑</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->

            <!-- Page Body -->
            <div class="page-body">

                <div class="row">
                    <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="widget">
                            <div class="widget-header bordered-bottom bordered-blue">
                                <span class="widget-caption">新增栏目</span>
                            </div>
                            <div class="widget-body">
                                <div id="horizontal-form">
                                    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/cate/edit.do" method="post">
                                        <input type="hidden" name="id" value="${CATE.id}">
                                        <div class="form-group">
                                            <label for="pid" class="col-sm-2 control-label no-padding-right">上级栏目</label>
                                            <div class="col-sm-6">
                                                <select name="pid" id="pid" style="width: 100%;">
                                                    <c:forEach items="${cates}" var="cate">
                                                        <c:if test="${cate.level==0}">
                                                            <option  value="${cate.id}">${cate.catename}</option>
                                                        </c:if>
                                                        <c:if test="${cate.level==1}">
                                                            <option  value="${cate.id}">|----${cate.catename}</option>
                                                        </c:if>
                                                        <c:if test="${cate.level==2}">
                                                            <option  value="${cate.id}">|--------${cate.catename}</option>
                                                        </c:if>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="catename" class="col-sm-2 control-label no-padding-right">栏目名称</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="catename" placeholder="" name="catename" value="${CATE.catename}" required="" type="text">
                                            </div>
                                            <p class="help-block col-sm-4 red">* 必填</p>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-default">保存信息</button>
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
</body></html>
<script>
    $(function () {
        $("#pid").val(${CATE.pid});
    })
</script>
