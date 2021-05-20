<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="col-lg-3 order-2 order-lg-1">
    <aside class="widget-area sticky-left">
        <!-- widget single item start -->
        <div class="card card-profile widget-item p-0">
            <div class="profile-banner">
                <figure class="profile-banner-small">
                    <a href="${contextPath}/my-profile">
                        <img src="${contextPath}/${current_account.wall_image }" alt="">
                    </a>
                    <a href="${contextPath}/my-profile" class="profile-thumb-2">
                        <img src="${contextPath}/${current_account.avatar }" alt="">
                    </a>
                </figure>
                <div class="profile-desc text-center">
                    <h6 class="author"><a href="${contextPath}/my-profile">${current_account.name }</a></h6>
                    <p>Hồ sơ của bạn sẽ được hiển thị với mọi người</p>
                </div>
            </div>
        </div>
        <!-- widget single item start -->
    	
        <!-- widget single item start -->
        <div class="card widget-item">
            <h4 class="widget-title mb-4">Lời mời kết bạn</h4>
            <div class="widget-body">
                <ul class="like-page-list-wrapper">
                	<c:choose>
                		<c:when test="${listRequest.size() < 5 }">
                			<c:forEach var="request" items="${listRequest }">
		                		<li class="unorder-list mb-3 option-request0">
			                         <div class="profile-thumb">
			                             <a href="${contextPath}/profile/${request.getFrom_account().getAccount_id() }">
			                                 <figure class="profile-thumb-small">
			                                     <img src="${contextPath}/${request.getFrom_account().getAvatar() }" alt="profile picture">
			                                 </figure>
			                             </a>
			                         </div>
			                         <div class="unorder-list-info col-10 option-request1">
			                             <h3 class="list-title"><a href="${contextPath}/profile/${request.getFrom_account().getAccount_id() }">${request.getFrom_account().getName() }</a></h3>
			                             <p class="list-subtitle">${fn:substring(request.time, 0, 16) }</p>
			                             <div class="row option-request2">
			                             	<div class="col-6 px-0 option-request3">
			                             		<button class="btn-sm btn-success accept-request" data-id="${request.friend_id }">Đồng ý</button>
			                             	</div>
			                             	<div class="col-6 px-0 option-request3">
			                             		<button class="btn-sm btn-danger deny-request" data-id="${request.friend_id }">Từ chối</button>
			                             	</div>
			                             </div>
			                         </div>
		                        </li>
		                	</c:forEach>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="request" items="${listRequest }" begin="0" end="4">
		                		<li class="unorder-list mb-3 option-request0">
			                         <div class="profile-thumb">
			                             <a href="${contextPath}/profile/${request.getFrom_account().getAccount_id() }">
			                                 <figure class="profile-thumb-small">
			                                     <img src="${contextPath}/${request.getFrom_account().getAvatar() }" alt="profile picture">
			                                 </figure>
			                             </a>
			                         </div>
			                         <div class="unorder-list-info col-10 option-request1">
			                             <h3 class="list-title"><a href="${contextPath}/profile/${request.getFrom_account().getAccount_id() }">${request.getFrom_account().getName() }</a></h3>
			                             <p class="list-subtitle">${fn:substring(request.time, 0, 16) }</p>
			                             <div class="row option-request2">
			                             	<div class="col-6 px-0 option-request3">
			                             		<button class="btn-sm btn-success accept-request" data-id="${request.friend_id }">Đồng ý</button>
			                             	</div>
			                             	<div class="col-6 px-0 option-request3">
			                             		<button class="btn-sm btn-danger deny-request" data-id="${request.friend_id }">Từ chối</button>
			                             	</div>
			                             </div>
			                         </div>
		                        </li>
		                	</c:forEach>
                		</c:otherwise>
                	</c:choose>
                </ul>
                <a href="${contextPath}/request" class="f-16 text-primary float-right mt-1">>>>Xem tất cả</a>
            </div>
        </div>
        <!-- widget single item end -->
    </aside>
</div>