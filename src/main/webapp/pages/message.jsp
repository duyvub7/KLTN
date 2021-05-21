<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Nhắn tin</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<jsp:include page="/pages/layout/navbar.jsp" />
	
	<main>
        <div class="main-wrapper pt-80 pb-3">
            <div class="container">
                <h3 class=" text-center mb-2">Tin nhắn</h3>
                <div class="messaging">
                    <div class="inbox_msg">
                        <div class="inbox_people">
                            <div class="headind_srch">
                                <div class="recent_heading">
                                    <h4>Danh sách</h4>
                                </div>
                                <div class="srch_bar">
                                    <div class="stylish-input-group">
                                        <input type="text" class="search-bar" placeholder="tìm kiếm">
                                        <span class="input-group-addon">
                                            <button type="button"> <i class="fa fa-search" aria-hidden="true"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="inbox_chat">
                                <div class="chat_list active_chat">
                                	<c:choose>  
									    <c:when test="${listChat.get(0).getTo_account().getAccount_id() == current_account.account_id}">  
									       <div class="chat_people">
		                                        <div class="chat_img"> <img src="${listChat.get(0).getFrom_account().getAvatar() }"> </div>
		                                        <div class="chat_ib">
		                                            <h5>
		                                            	${listChat.get(0).getFrom_account().getName() }
		                                            	<span class="chat_date"><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${listChat.get(0).time }"/></span>
		                                            </h5>
		                                            <p>${fn:substring(listChat.get(0).message_content, 0, 40) }</p>
		                                        </div>
		                                    </div>
									    </c:when>
									    <c:otherwise>  
									       <div class="chat_people">
		                                        <div class="chat_img"> <img src="${listChat.get(0).getTo_account().getAvatar() }"> </div>
		                                        <div class="chat_ib">
		                                            <h5>
		                                            	${listChat.get(0).getTo_account().getName() }
		                                            	<span class="chat_date"><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${listChat.get(0).time }"/></span>
		                                            </h5>
		                                            <p><strong>Bạn: </strong>${fn:substring(listChat.get(0).message_content, 0, 40) }</p>
		                                        </div>
		                                    </div>
									    </c:otherwise>  
									</c:choose>
                                </div>
                                <c:forEach var="chat" items="${listChat }" begin="1">
                                	<div class="chat_list chat">
	                            		<c:choose>
											<c:when test="${chat.getTo_account().getAccount_id() == current_account.account_id}">  
											    <div class="chat_people">
			                                        <div class="chat_img"> <img src="${chat.getFrom_account().getAvatar() }"> </div>
			                                        <div class="chat_ib">
			                                            <h5>
			                                            	${chat.getFrom_account().getName() }
			                                            	<span class="chat_date"><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${chat.time }"/></span>
			                                            </h5>
			                                            <p>${fn:substring(chat.message_content, 0, 40) }</p>
			                                        </div>
			                                    </div>
											</c:when>
											<c:otherwise>
												<div class="chat_people">
			                                        <div class="chat_img"> <img src="${chat.getTo_account().getAvatar() }"> </div>
			                                        <div class="chat_ib">
			                                            <h5>
			                                            	${chat.getTo_account().getName() }
			                                            	<span class="chat_date"><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${chat.time }"/></span>
			                                            </h5>
			                                            <p><strong>Bạn: </strong>${fn:substring(chat.message_content, 0, 40) }</p>
			                                        </div>
			                                    </div>
										    </c:otherwise>  
										</c:choose>
									</div>
                            	</c:forEach>
                            </div>
                        </div>
                        <div class="mesgs">
                            <div class="msg_history">
                            	<c:forEach var="message" items="${listMessageView }">
                            		<c:choose>
											<c:when test="${message.getTo_account().getAccount_id() == current_account.account_id}">
												<div class="incoming_msg">
				                                    <div class="incoming_msg_img"> <img
				                                            src="${message.getFrom_account().getAvatar() }"> </div>
				                                    <div class="received_msg">
				                                        <div class="received_withd_msg">
				                                            <p>${message.message_content }</p>
				                                            <span class="time_date"><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${message.time }"/></span>
				                                        </div>
				                                    </div>
				                                </div>
											</c:when>
											<c:otherwise>
												<div class="outgoing_msg">
				                                    <div class="sent_msg">
				                                        <p>${message.message_content }</p>
				                                        <span class="time_date"><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${message.time }"/></span>
				                                    </div>
				                                </div>
											</c:otherwise>
									</c:choose>		
                            	</c:forEach>
                            	<h5>${listMessageView.size() }</h5>
                            	<div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img
                                            src="${listChat.get(0).getFrom_account().getAvatar() }"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <p>Xin chào</p>
                                            <span class="time_date">13-07-2021 09:11</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img
                                            src="${listChat.get(0).getFrom_account().getAvatar() }"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <p>Trọ ở 13 Nguyễn Huệ còn không bạn</p>
                                            <span class="time_date">13-07-2021 09:11</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="outgoing_msg">
                                    <div class="sent_msg">
                                        <p>Còn nhé bạn</p>
                                        <span class="time_date">13-07-2021 09:15</span>
                                    </div>
                                </div>
                                <div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img
                                            src="${listChat.get(0).getFrom_account().getAvatar() }"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <p>OK</p>
                                            <span class="time_date">13-07-2021 09:17</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img
                                            src="${listChat.get(0).getFrom_account().getAvatar() }"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <p>Cảm ơn về thông tin</p>
                                            <span class="time_date">13-07-2021 09:18</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="outgoing_msg">
                                    <div class="sent_msg">
                                        <p>Nếu muốn xem phòng thì liên hệ mình nhé</p>
                                        <span class="time_date">13-07-2021 09:28</span>
                                    </div>
                                </div>
                                <div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img
                                            src="${listChat.get(0).getFrom_account().getAvatar() }"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <p>OK</p>
                                            <span class="time_date">13-07-2021 09:40</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="type_msg">
                                <div class="input_msg_write">
                                    <input type="text" class="write_msg col-10" placeholder="Nhập tin nhắn" />
                                    <i class="fa fa-file-image-o float-right;" style="font-size: 20px; padding-top: 20px;" aria-hidden="true" ></i>
                                    <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </main>
	
	<jsp:include page="/pages/layout/footer.jsp" />
	
</body>
</html>