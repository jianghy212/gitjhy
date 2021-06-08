<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
    	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrapValidator.js"></script>
    	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
	<title>个人信息</title>
</head>
<body>
		<jsp:include page="/header.jsp"></jsp:include>

	<div style="height: 100px;"></div>
	<section>
		<div class="index-main clearfix">
			<div class="index-main-core col-xs-12 col-md-12 fl">
				<div class="index-content">
					<div class="index-content-text">
						<div class="index-text-big">
							<div id="ihove" class="index-big-imgs fl">
								<img src="${pageContext.request.contextPath}/uHeadImage/${sessionScope.userinfo.userImage }">
							</div>
							<div class="index-big-texts fr">
								<h2>昵称&nbsp;&nbsp;${sessionScope.userinfo.userName }</h2>
								<a href="${pageContext.request.contextPath}/ueinfo/returnedit"><button class="fr btn btn-default">编辑个人资料</button></a>
								<hr>
								性别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style="font-size:20px;">&nbsp;&nbsp;${sessionScope.userinfo.userSex }</p>
								所在院校/组织:<p style="font-size:20px;">&nbsp;&nbsp;${sessionScope.userinfo.userAcademy }</p>							
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>