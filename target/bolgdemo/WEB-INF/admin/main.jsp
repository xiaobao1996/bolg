<%--
  Created by IntelliJ IDEA.
  User: Hu
  Date: 2018/9/13
  Time: 22:36
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
                    <li class="active">系统后台</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->

            <!-- Page Body -->
            <div class="page-body">

                <div style="text-align:center; line-height:1000%; font-size:24px;">

            </div>
           <h3>hello world</h3>


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
