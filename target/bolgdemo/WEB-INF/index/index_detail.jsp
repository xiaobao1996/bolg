<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="index_top.jsp"/>
    <div class="container">
        <div class="con_content">
            <div class="about_box">
                <h2 class="nh1"><span>您现在的位置是：<a href="/" target="_blank">网站首页</a>>><a href="#" target="_blank">文章浏览</a></span><b>>>文章详情</b></h2>
                <div class="f_box">
                    <p class="a_title"></p>
                    <p class="p_title"></p>

                </div>
                <ul class="about_content">
                    <p class="box_p"><span>发布时间：<fmt:formatDate value="${Article.time}" pattern="yyyy-MM-dd"/> </span><span>作者：${Article.author}</span><span></span>&nbsp;&nbsp;<span>点击：${Article.click}</span></p>
                    <div style="text-indent:2em;font-size: 14px;color: #000;">
                        ${Article.content}
                    </div >
                    <div style="margin:20px auto;width: 260px;opacity: 0.8;"><img src="${Article.pic}" width="260"></div>
                    <p>“冥冥中该来则来，无处可逃”。 </p>
                </ul>

            </div>
        </div>
        <div class="blank"></div>
    </div>
    <!-- container代码 结束 -->

<jsp:include page="index_footer.jsp"/>