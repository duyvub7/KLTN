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
                <h3 class=" text-center mb-2">Messaging</h3>
                <div class="messaging">
                    <div class="inbox_msg">
                        <div class="inbox_people">
                            <div class="headind_srch">
                                <div class="recent_heading">
                                    <h4>Recent</h4>
                                </div>
                                <div class="srch_bar">
                                    <div class="stylish-input-group">
                                        <input type="text" class="search-bar" placeholder="Search">
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
		                                        <div class="chat_img"> <img src="${listChat.get(0).getFrom_account().getAvatar() }"
		                                                alt="sunil"> </div>
		                                        <div class="chat_ib">
		                                            <h5>
		                                            	${listChat.get(0).getFrom_account().getName() }
		                                            	<span class="chat_date">${fn:substring(listChat.get(0).time, 0, 16) }</span>
		                                            </h5>
		                                            <p><strong>Bạn: </strong>${fn:substring(listChat.get(0).message_content, 0, 40) }</p>
		                                        </div>
		                                    </div>
									    </c:when>
									    <c:otherwise>  
									       <div class="chat_people">
		                                        <div class="chat_img"> <img src="${listChat.get(0).getTo_account().getAvatar() }"
		                                                alt="sunil"> </div>
		                                        <div class="chat_ib">
		                                            <h5>
		                                            	${listChat.get(0).getFrom_account().getName() }
		                                            	<span class="chat_date">${fn:substring(listChat.get(0).time, 0, 16) }</span>
		                                            </h5>
		                                            <p>${fn:substring(listChat.get(0).message_content, 0, 40) }</p>
		                                        </div>
		                                    </div>
									    </c:otherwise>  
									</c:choose>
                                </div>
                                <c:forEach var="chat" items="${listChat }" begin="2">
                                	<div class="chat_list chat">
	                            		<c:choose>
											<c:when test="${chat.getTo_account().getAccount_id() == current_account.account_id}">  
											    <div class="chat_people">
			                                        <div class="chat_img"> <img src="${chat.getFrom_account().getAvatar() }"
			                                                alt="sunil"> </div>
			                                        <div class="chat_ib">
			                                            <h5>
			                                            	${listChat.get(0).getFrom_account().getName() }
			                                            	<span class="chat_date">${fn:substring(listChat.get(0).time, 0, 16) }</span>
			                                            </h5>
			                                            <p><strong>Bạn: </strong>${fn:substring(listChat.get(0).message_content, 0, 40) }</p>
			                                        </div>
			                                    </div>
											</c:when>
											<c:otherwise>
												<div class="chat_people">
			                                        <div class="chat_img"> <img src="${chat.getTo_account().getAvatar() }"
			                                                alt="sunil"> </div>
			                                        <div class="chat_ib">
			                                            <h5>
			                                            	${listChat.get(0).getFrom_account().getName() }
			                                            	<span class="chat_date">${fn:substring(listChat.get(0).time, 0, 16) }</span>
			                                            </h5>
			                                            <p>${fn:substring(listChat.get(0).message_content, 0, 40) }</p>
			                                        </div>
			                                    </div>
										    </c:otherwise>  
										</c:choose>
									</div>
                            	</c:forEach>
                                
                                <div class="chat_list">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img
                                                src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                                        </div>
                                        <div class="chat_ib">
                                            <h5>Sunil Rajput <span class="chat_date">Dec 22</span></h5>
                                            <p>Test, which is a new approach to have all solutions
                                                astrology under one roof.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="chat_list">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img
                                                src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                                        </div>
                                        <div class="chat_ib">
                                            <h5>Sunil Rajput <span class="chat_date">Dec 22</span></h5>
                                            <p>Test, which is a new approach to have all solutions
                                                astrology under one roof.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="chat_list">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img
                                                src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                                        </div>
                                        <div class="chat_ib">
                                            <h5>Sunil Rajput <span class="chat_date">Dec 22</span></h5>
                                            <p>Test, which is a new approach to have all solutions
                                                astrology under one roof.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="chat_list">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img
                                                src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                                        </div>
                                        <div class="chat_ib">
                                            <h5>Sunil Rajput <span class="chat_date">Dec 22</span></h5>
                                            <p>Test, which is a new approach to have all solutions
                                                astrology under one roof.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mesgs">
                            <div class="msg_history">
                                <div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img
                                            src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <p>Test which is a new approach to have all
                                                solutions</p>
                                            <span class="time_date"> 11:01 AM | June 9</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="outgoing_msg">
                                    <div class="sent_msg">
                                        <p>Test which is a new approach to have all
                                            solutions</p>
                                        <span class="time_date"> 11:01 AM | June 9</span>
                                    </div>
                                </div>
                                <div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img
                                            src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <p>Test, which is a new approach to have</p>
                                            <span class="time_date"> 11:01 AM | Yesterday</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="outgoing_msg">
                                    <div class="sent_msg">
                                        <p>Apollo University, Delhi, India Test</p>
                                        <span class="time_date"> 11:01 AM | Today</span>
                                    </div>
                                </div>
                                <div class="incoming_msg">
                                    <div class="incoming_msg_img"> <img
                                            src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <p>We work directly with our designers and suppliers,
                                                and sell direct to you, which means quality, exclusive
                                                products, at a price anyone can afford.</p>
                                            <span class="time_date"> 11:01 AM | Today</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="outgoing_msg">
                                    <div class="sent_msg">
                                        <p>Apollo University, Delhi, India Test</p>
                                        <span class="time_date"> 11:01 AM | Today</span>
                                    </div>
                                </div>
                            </div>
                            <div class="type_msg">
                                <div class="input_msg_write">
                                    <input type="text" class="write_msg" placeholder="Type a message" />
                                    <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o"
                                            aria-hidden="true"></i></button>
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