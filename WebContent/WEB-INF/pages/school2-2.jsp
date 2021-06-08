<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"> 
<head>
    <title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
    	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrapValidator.js"></script>
    	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/school2.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style2.css" />
</head> 

<body>
			<jsp:include page="/header.jsp"></jsp:include>
	
	<div style="height: 100px;"></div>
	<div class="main-di">
		<img src="${pageContext.request.contextPath}/resources/imgs/${scimg}" />
		<span><strong>${scName }</strong></span>
	</div>
	<hr />
	<div class="main-wrapper">
		<c:forEach items="${pageInfo.list }" var="info">
			<c:if test="${info.status == 0 }">
				<div class="row" >
					<div class="col-xs-6 col-md-3 col-lg-3">
					<img style="width: 70px;border-radius: 50%;float: right;" src="${pageContext.request.contextPath}/uHeadImage/${info.userImg}" />
					</div>
					<div class="col-xs-6 col-md-9 col-lg-9">
						<h5>${info.name }</h5>
						<h6 style="opacity: 0.7;">${info.time }</h6>
					</div>
					<div class="col-xs-3 col-md-3 col-lg-3"></div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p>${info.content }</p>
					</div>
					<div class="col-xs-3 col-md-3 col-lg-3"></div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<img style="width: 333px;" src="${pageContext.request.contextPath}/schimg/${info.tSrc}" />
					</div>
					<div class="col-xs-3 col-md-3 col-lg-3"></div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p style="padding: 20px 0px 10px 0px;font-size:14px ;">浏览<span>999+</span>次</p>
					</div>
					<div class="col-xs-3 col-md-3 col-lg-3"></div>
					<div class="col-xs-12 col-md-9 col-lg-9">
						<p style="padding: 0px 0px 20px 0px;font-size:14px ;">赞<span>${info.tSan }</span>次</p>
					</div>
				</div>
			</c:if>
			<c:if test="${info.status == 1 }">
				<div class="row">
				<div class="col-xs-6 col-md-3 col-lg-3">
					<img style="width: 70px;border-radius: 50%;float: right;" src="${pageContext.request.contextPath}/uHeadImage/${info.userImg}" />
				</div>
				<div class="col-xs-6 col-md-9 col-lg-9">
					<h5>${info.name }</h5>
					<h6 style="opacity: 0.7;">${info.time }</h6>
				</div>
				<div class="col-xs-3 col-md-3 col-lg-3"></div>
				<div class="col-xs-9 col-md-9 col-lg-9">
					<p>${info.content }</p>
				</div>
				<div class="col-xs-2 col-md-3 col-lg-3"></div>
				<div class="col-xs-10 col-md-9 col-lg-9">
					<video src="${pageContext.request.contextPath}/schimg/${info.tSrc}" autoplay="" style="width:333px;"></video>
				</div>
				<div class="col-xs-3 col-md-3 col-lg-3"></div>
				<div class="col-xs-9 col-md-9 col-lg-9">
					<p style="padding: 20px 0px 10px 0px;font-size:14px ;">浏览<span>999+</span>次</p>
				</div>
				<div class="col-xs-3 col-md-3 col-lg-3"></div>
				<div class="col-xs-12 col-md-9 col-lg-9">
					<p style="padding: 0px 0px 20px 0px;font-size:14px ;">赞<span>${info.tSan}</span>次</p>
				</div>
				</div>
			</c:if>
		</c:forEach>

		<div class="col-xs-3 col-md-5 col-lg-5"></div><div style="margin-top:100px;" class="col-xs-12 col-md-6 col-lg-6"><nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="${pageContext.request.contextPath}/Schoolspace/getSchoolSpace?pn=${pageInfo.pageNum - 1}&scId=${scId}&scName=${scName}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
     <c:forEach items="${pageInfo.navigatepageNums }" var="num">
    	  <li><a href="${pageContext.request.contextPath}/Schoolspace/getSchoolSpace?pn=${num}&scId=${scId}&scName=${scName}">${num }</a></li>
   	 </c:forEach>
 
    <li>
      <a href="${pageContext.request.contextPath}/Schoolspace/getSchoolSpace?pn=${pageInfo.pageNum + 1}&scId=${scId}&scName=${scName}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav></div>
		</div>
    <div class="leaf-left">
    	<img src="${pageContext.request.contextPath}/resources/imgs/leaf-left.png" alt="leaf-right">
    </div>
    <div class="leaf-right">
    	<img src="${pageContext.request.contextPath}/resources/imgs/leaf-right.png" alt="leaf-right">
    </div>
</body>
</html>