<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- Required Jquery -->
<script type="text/javascript" src="${contextPath}/resources/assets/bower_components\js\jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/assets/bower_components\js\jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/assets/bower_components\js\popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/assets/bower_components\js\bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="${contextPath}/resources/assets/bower_components\js\jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="${contextPath}/resources/assets/bower_components\js\modernizr.js"></script>
<script type="text/javascript" src="${contextPath}/resources/assets/bower_components\js\css-scrollbars.js"></script>
<!-- data-table js -->
<script src="${contextPath}/resources/assets/bower_components\js\jquery.dataTables.min.js"></script> <!--tablejs-->
<script src="${contextPath}/resources/assets/bower_components\pages\data-table\extensions\select\js\dataTables.select.min.js"></script> <!--rowselect-->
<script src="${contextPath}/resources/assets/bower_components\js\dataTables.bootstrap4.min.js"></script> <!--style-->
<script src="${contextPath}/resources/assets/bower_components\js\dataTables.responsive.min.js"></script> <!--response-->
<!-- Custom js -->
<script src="${contextPath}/resources/assets/bower_components\pages\data-table\extensions\select\js\select-custom.js"></script>
<script src="${contextPath}/resources/assets/bower_components\js\pcoded.min.js"></script>
<script src="${contextPath}/resources/assets/bower_components\js\vartical-layout.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/assets/bower_components\js\script.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-23581568-13');
</script>