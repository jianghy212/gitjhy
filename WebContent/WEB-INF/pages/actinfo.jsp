<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>活动详情</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style1.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
    	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrapValidator.js"></script>
    	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
	</head>
	<body>
			<jsp:include page="/header.jsp"></jsp:include>
		<div style="height: 50px;"></div>
		<article class="single-post">
			<div class="wrap-post"><!--Start Box-->
				<div class="entry-header text-center">
					<h1 class="entry-title">${actinfo.acName}</h1>
					<span class="entry-meta">
						<ul class="list-inline link">
							<li>发布者 <a href="#">${actinfo.acName}</a></li>
							<li>活动地点 <a href="#">${actinfo.acCity}</a></li>
							<li>联系方式 <a href="#">${actinfo.userQq}</a></li>
						</ul>
						<ul class="list-inline link" style="font-size: 20px;color:orangered;">
							<button class="btn btn-danger re-sx">
						<span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;申请加入
						</button>
						</ul>
					</span>
				</div>
				<div class="post-thumbnail-wrap">
					<div class="portfolio-box">
						<img src="${pageContext.request.contextPath}/cover/${actinfo.acImage}" class="img-responsive" alt="">
					</div>
				</div>
				<div class="entry-content">
					<div class="excerpt">
						<h2>活动简介</h2>
						<p>${actinfo.acText}</p>
					</div>	
				</div>
			</div>
		</article>
	</body>
</html>
