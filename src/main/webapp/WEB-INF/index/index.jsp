<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="index_top.jsp"/>
    <div class="container">
        <div class="bloglist f_l">

        <c:forEach items="${Articles}" var="article">
            <h3><a href="${article.pic}">【${article.keywords}】${article.title}</a></h3>
            <figure><img src="${article.pic}" alt="【${article.keywords}】请不要在设计这条路上徘徊啦"></figure>
            <ul>
                <p style="text-indent:2em;"> ${article.des}</p>
                <a title="【${article.keywords}】${article.title}" href="${pageContext.request.contextPath}/index/detail.do?id=${article.id}" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
            </ul>
            <p class="dateview"><span><fmt:formatDate value="${article.time}" pattern="yyyy-MM-dd" /></span><span>作者：</span>${article.author}<span>个人博客：[<a href="/jstt/bj/">${article.keywords}</a>]</span></p>
        </c:forEach>
            <div class="pagelist" style="padding-left: 140px;margin: 20px auto">页次：${pager.currentPageNum}/${pager.totalPageNum} &nbsp;&nbsp; 总数&nbsp;&nbsp;${pager.totalSize}
                <a href="${pageContext.request.contextPath}/index/list.do?num=1&&cateid=${cateid}">首页
                </a><a href="${pageContext.request.contextPath}/index/list.do?num=${pager.prePageNum}&&cateid=${cateid}">上一页</a>
                <a href="${pageContext.request.contextPath}/index/list.do?num=${pager.nextPageNum}&&cateid=${cateid}">下一页</a>
                <a href="${pageContext.request.contextPath}/index/list.do?num=${pager.totalPageNum}&&cateid=${cateid}">尾页</a></div>
        </div>
        <div class="r_box f_r">
            <div class="tit01">
                <h3 class="tit">关注我</h3>
                <div class="gzwm">
                    <ul>
                        <li><a class="email" href="#" target="_blank">我的电话</a></li>
                        <li><a class="qq" href="#mailto:admin@admin.com" target="_blank">我的邮箱</a></li>
                        <li><a class="tel" href="#" target="_blank">我的QQ</a></li>
                        <li><a class="prize" href="#">个人奖项</a></li>
                    </ul>
                </div>
            </div>
            <!--tit01 end-->

            <div class="tuwen">
                <h3 class="tit">图文推荐</h3>
                <ul>
                <c:forEach items="${clikdesc}" var="clikdesc">
                    <li><a href="${pageContext.request.contextPath}/index/detail.do?id=${clikdesc.id}"><img src="${clikdesc.pic}"><b>${clikdesc.title}</b></a>
                        <p><span class="tulanmu"><a href="#">${clikdesc.keywords}</a></span><span class="tutime"><fmt:formatDate value="${clikdesc.time}" pattern="yyyy-MM-dd"/></span></p>
                    </li>
                </c:forEach>

                </ul>
            </div>
            <div class="ph">
                <h3 class="tit">点击排行</h3>
                <ul class="rank">
                    <c:forEach items="${clikdesc}" var="clikdesc">
                    <li><a href="${pageContext.request.contextPath}/index/detail.do?id=${clikdesc.id}" title="【${clikdesc.keywords}】${clikdesc.title}" target="_blank">【${clikdesc.keywords}】${clikdesc.title}</a></li>

                    </c:forEach>
                </ul>
            </div>
            <div class="ad"> <img src="${pageContext.request.contextPath}/images/03.jpg"> </div>
        </div>
    </div>
    <!-- container代码 结束 -->
<jsp:include page="index_footer.jsp"/>
