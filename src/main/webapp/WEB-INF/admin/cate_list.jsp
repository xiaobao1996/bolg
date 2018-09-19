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
                    <li class="active">栏目管理</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->

            <!-- Page Body -->
            <div class="page-body">

                <button type="button" tooltip="栏目添加" class="btn btn-sm btn-azure btn-addon" onClick="javascript:window.location.href = '${pageContext.request.contextPath}/cate/toAdd.do'"> <i class="fa fa-plus"></i> Add
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
                                            <th class="text-center">栏目名称</th>
                                            <th class="text-center">操作</th>
                                        </tr>
                                        </thead>

                                        <c:forEach items="${cates}" var="cate" varStatus="i">
                                        <tr>
                                            <td align="center">${i.count}</td>
                                            <td align="left">
                                            <c:if test="${cate.level==0}">
                                                <%out.print("");%>
                                            </c:if>
                                            <c:if test="${cate.level==1}">
                                                <%out.print("|--------");%>
                                            </c:if>
                                            <c:if test="${cate.level==2}">
                                                <%out.print("|----------------");%>
                                            </c:if>
                                            ${cate.catename}
                                            </td>
                                            <td align="center">
                                                <a href="${pageContext.request.contextPath}/cate/toEdit.do?id=${cate.id}" class="btn btn-primary btn-sm shiny">
                                                    <i class="fa fa-edit"></i> 编辑
                                                </a>
                                                <a href="javascript:;" onClick="warning('确实要删除吗', '${pageContext.request.contextPath}/cate/del.do?id=${cate.id}')" class="btn btn-danger btn-sm shiny">
                                                    <i class="fa fa-trash-o"></i> 删除
                                                </a>
                                            </td>
                                        </tr>
                                        </c:forEach>

                                    </table>
                                </div>
                                <div>
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
