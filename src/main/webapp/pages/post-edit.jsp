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
	<title>Sửa bài viết</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<jsp:include page="/pages/layout/navbar.jsp" />
    
    <main>
        <div class="main-wrapper pt-80">
            <div class="container my-4">
            	<form action="${contextPath}/edit-post/${post.post_id }" method="POST" enctype="multipart/form-data" class="text-center">
                    <div class="col-lg-8 mx-auto">
						<div class="card">
							<div class="row">
								<div class="col-11">
									<h5 class="my-3">Chỉnh sửa thông tin bài viết</h5>
								</div>
								<div class="col-1">
									<div class="post-settings-bar pt-4">
	                                    <span></span>
	                                    <span></span>
	                                    <span></span>
	                                    <div class="post-settings arrow-shape">
	                                        <ul>
		                                        <li><button onclick="document.getElementById('submit-btn').click()">Lưu thay đổi</button></li>
	                                        </ul>
	                                    </div>
	                                </div>
								</div>
							</div>
							<input id="submit-btn" style="visibility:hidden;" type="submit">
                            <div class="col-12 my-4">
                                <textarea name="content" class="share-field-big custom-scroll" placeholder="Nhập nội dung bài đăng">${post.post_content }</textarea>
                            </div>
                            <!-- post title start -->
                            <div class="post-content col-11 mx-auto">
                            	<c:if test="${post.getImage().size() > 0 }">
	                                <div class="post-thumb-gallery">
	                                    <figure class="post-thumb img-popup">
	                                        <a href="${contextPath}/${post.getImage().get(0).getUrl() }">
	                                            <img src="${contextPath}/${post.getImage().get(0).getUrl() }" alt="post image">
	                                        </a>
	                                    </figure>
	                                </div>
	                                <p class="edit-btn remove-img-btn">Xóa ảnh</p>
	                            </c:if>
	                            <div class="col-12 mt-4">
                                      <div class="container">
                                          <div class="panel my-2">
                                              <div class="button_outer">
                                                  <div class="btn_upload">
                                                      <input type="file" id="upload_file" name="file">
                                                      Thêm ảnh
                                                  </div>
                                                  <div class="processing_bar"></div>
                                                  <div class="success_box"></div>
                                              </div>
                                          </div>
                                          <div class="error_msg"></div>
                                          <div class="uploaded_file_view my-2" id="uploaded_view">
                                              <span class="file_remove">X</span>
                                          </div>
                                      </div>
                                      <div class="col-12 mt-4" id="option-area">
				                        <div class="row ml-1">
				                            <div class="col-12 row form-group">
				                                <p class="col-md-4 col-lg-4 col-12 pt-2">Tỉnh/ Thành phố :</p>
				                                <div class="select-small">
				                                    <select class="js-example-basic-single col-md-8 col-lg-8 col-12 with-300" name="province">
				                                    	<c:forEach var="province" items="${listProvince }">
				                                    		<c:choose>
				                                    			<c:when test="${province.province_id == post.province_id}">
				                                    				<option value="${province.province_id }" selected>${province.province_name }</option>
				                                    			</c:when>
				                                    			<c:otherwise>
				                                    				<option value="${province.province_id }">${province.province_name }</option>
				                                    			</c:otherwise>
				                                    		</c:choose>
				                                    	</c:forEach>
				                                    </select>
				                                </div>
				                            </div>
				                            <div class="col-12 form-group row">
				                                <div class="col-md-4">
				                                    <p id="modal-price" class="pt-1">Giá (/tháng) :</p>
				                                </div>
				                                <div class="col-md-8 pl-0">
				                                    <input type="number" name="price" class="form-control with-300" value="${post.price }"> 
				                                </div>
				                            </div>
				                            
				                            <c:if test="${post.post_type != 1 }">
		                                    	<c:choose>
		                                    		<c:when test="${post.post_status == true }">
		                                    			<div class="col-12 form-group row">
							                            	<div class="col-md-4">
							                                    <p id="modal-price" class="pt-1">Tình trạng :</p>
							                                </div>
							                                <select class="form-control form-control-sm col-md-4" name="status">
														      	<option value="1" selected>Đang sẵng sàng</option>
														      	<option value="0">Đã hết hạn</option>
														    </select>
				                            			</div>
		                                    		</c:when>
		                                    		<c:otherwise>
		                                    			<div class="col-12 form-group row">
							                            	<div class="col-md-4">
							                                    <p id="modal-price" class="pt-1">Tình trạng :</p>
							                                </div>
							                                <select class="form-control col-md-7">
														      <option value="1">Đang sẵng sàng</option>
														      <option value="0" selected>Đã hết hạn</option>
														    </select>
				                            			</div>
		                                    		</c:otherwise>
		                                    	</c:choose>
		                                    </c:if>
				                        </div>
				                    </div>
                                </div>
                            </div>
                            <div class="mt-3">
                            	Ngày đăng: 
                           		<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${post.post_date }"/>
                            </div>
                        </div>
                    </div>
				</form>
            </div>
        </div>
    </main>
    
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
	
	<jsp:include page="/pages/layout/footer.jsp" />
    <script>
    $(document).ready(function () {
    	$('.remove-img-btn').click(function () {
    		$(this).parent('.post-content').children('.post-thumb-gallery').hide()
    		$(this).hide()
    	});
    });
    </script>
</body>
</html>