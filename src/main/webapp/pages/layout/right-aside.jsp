<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="col-lg-3 order-3">
    <aside class="widget-area sticky-right">
        <!-- widget single item start -->
        <div class="card widget-item pb-2">
            <h4 class="widget-title mb-4">Bài nổi bật</h4>
            <div class="widget-body">
                <ul class="like-page-list-wrapper">
                	<c:forEach var="post" items="${listPost }">
                     <li class="unorder-list mb-3">
                         <div class="profile-thumb">
                             <a href="${contextPath}/profile/${post.getAccount_id() }">
                                 <figure class="profile-thumb-small">
                                     <img src="${contextPath}/${post.getAccount().getAvatar() }" alt="profile picture">
                                 </figure>
                             </a>
                         </div>
                         <div class="unorder-list-info">
                             <h3 class="list-title"><a href="${contextPath}/profile/${post.getAccount_id() }">${post.getAccount().getName() }</a></h3>
                             <p class="list-subtitle">${fn:substring(post.post_date, 0, 16) }</p>
                             <a href="photos.html" class="text-dark">${fn:substring(post.post_content, 0, 40) }...</a>
                         </div>
                     </li>
                 </c:forEach>
                </ul>
            </div>
        </div>
        <!-- widget single item end -->
    </aside>
</div>