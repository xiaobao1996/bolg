<%--
  Created by IntelliJ IDEA.
  User: Hu
  Date: 2018/9/13
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
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
                        <a href="#">权限列表</a>
                    </li>
                    <li class="active">编辑权限</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->

            <!-- Page Body -->
            <div class="page-body">

                <div class="row">
                    <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="widget">
                            <div class="widget-header bordered-bottom bordered-blue">
                                <span class="widget-caption">新增规则</span>
                            </div>
                            <div class="widget-body">
                                <div id="horizontal-form">
                                    <form class="form-horizontal" role="form" action="" method="post">
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 control-label no-padding-right">规则类型</label>
                                            <div class="col-sm-6">
                                                <select name="type" style="width: 100%;">
                                                    <option value="1" selected="selected">按节点</option>
                                                    <option value="2">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-2 control-label no-padding-right">名称</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="title" placeholder="" name="title" value="文档" required="" type="text">
                                            </div>
                                            <p class="help-block col-sm-4 red">* 必填</p>
                                        </div>

                                        <div class="form-group">
                                            <label for="pid" class="col-sm-2 control-label no-padding-right">上级菜单</label>
                                            <div class="col-sm-6">
                                                <select name="pid" style="width: 100%;">
                                                    <option selected="selected" value="0">一级菜单</option>
                                                    <option value="1">控制面板</option>
                                                    <option value="19">文档</option>
                                                    <option value="20">——文章列表</option>
                                                    <option value="2">系统</option>
                                                    <option value="13">——用户管理</option>
                                                    <option value="3">——角色管理</option>
                                                    <option value="4">——权限列表</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 control-label no-padding-right">节点/规则标识</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="name" placeholder="" name="name" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="condition" class="col-sm-2 control-label no-padding-right">附加条件</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="condition" placeholder="" name="condition" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sort" class="col-sm-2 control-label no-padding-right">排序</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="sort" placeholder="" name="sort" value="2" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="is_show" class="col-sm-2 control-label no-padding-right">是否显示</label>

                                            <div class="col-xs-4">
                                                <label>
                                                    <input class="checkbox-slider slider-icon yesno" name="is_show" checked="checked" type="checkbox">
                                                    <span class="text"></span>
                                                </label>
                                            </div>
                                        </div>
                                        <input name="id" value="19" type="hidden">
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
