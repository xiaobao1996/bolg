<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <li class="active">文章管理</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->

            <!-- Page Body -->
            <div class="page-body">

                <button type="button" tooltip="文章添加" class="btn btn-sm btn-azure btn-addon" onClick="javascript:window.location.href = '${pageContext.request.contextPath}/article/toAdd.do'"> <i class="fa fa-plus"></i> Add
                </button>
                <div class="row">
                    <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="widget">
                            <div class="widget-body">
                                <div class="flip-scroll">
                                    <table class="table table-bordered table-hover">
                                        <thead class="">
                                        <tr>
                                            <th class="text-center">序号</th>
                                            <th class="text-center">文章名称</th>
                                            <th class="text-center">所属栏目</th>
                                            <th class="text-center">缩略图</th>
                                            <th class="text-center">发布时间</th>
                                            <th class="text-center">操作</th>
                                        </tr>
                                        </thead>
                                    <c:forEach items="${Articles}" var="article" varStatus="i">
                                        <tr>
                                            <td class="text-center" style="line-height: 80px;">${i.count}</td>
                                            <td class="text-center" style="line-height: 80px;" >${article.title}</td>
                                            <td class="text-center" style="line-height: 80px;">${article.cate.catename}</td>
                                            <td class="text-center" style="line-height: 80px;"><img src="${article.pic}" height="80" alt=""></td>
                                            <td class="text-center" style="line-height: 80px;">
                                                <fmt:formatDate value="${article.time}" pattern="yyyy-MM-dd "/>
                                            </td>
                                            <td class="text-center" style="line-height: 80px;">
                                                <a href="${pageContext.request.contextPath}/article/toEdit.do?id=${article.id}" class="btn btn-primary btn-sm shiny">
                                                    <i class="fa fa-edit"></i> 编辑
                                                </a>
                                                <a href="javascript:;" onClick="warning('确实要删除吗', '${pageContext.request.contextPath}/article/del.do?id=${article.id}')" class="btn btn-danger btn-sm shiny">
                                                    <i class="fa fa-trash-o"></i> 删除
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </table>

                                    <a href="${pageContext.request.contextPath}/article/list.do?num=1">首页</a>

                                    <a href="${pageContext.request.contextPath}/article/list.do?num=${pager.prePageNum}">上一页</a>
                                    <c:forEach  begin="${pager.startPageNum}" end="${pager.endPageNum}" var="num">
                                        <a href="${pageContext.request.contextPath}/article/list.do?&num=${num}">${num}</a>

                                    </c:forEach>

                                    <a href="${pageContext.request.contextPath}/article/list.do?&num=${requestScope.pager.nextPageNum}">下一页</a>
                                    <a href="${pageContext.request.contextPath}/article/list.do?&num=${requestScope.pager.totalPageNum}">末页</a>
                                    &nbsp;&nbsp;共${pager.totalSize}条/共${pager.totalPageNum}页

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
