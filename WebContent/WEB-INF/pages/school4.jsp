<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link href="${pageContext.request.contextPath}/resources/css/horizontal.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrapValidator.js"></script>
	<style>
		.sliderTV__item .pi{
			width: 260px;
			height: 80px;
			position: absolute;
			background: rgba(47,50,56,0.8);
			top: 170px;
			text-align: center;
			line-height: 80px;
			font-size: 24px;
			color: white;
			left:10px;
			overflow: hidden;
			display: -webkit-box;
			-webkit-line-clamp: 1;
			-webkit-box-orient: vertical;
		}
		.sliderTV__item h1{
			overflow: hidden;
			display: -webkit-box;
			-webkit-line-clamp: 1;
			-webkit-box-orient: vertical;
		}
		.inp{
			width: 40%;
			margin: 0 auto;
			padding: 20px 0px 20px 0px;
		}
	</style>
</head>
<body>
			<jsp:include page="/header.jsp"></jsp:include>

	<div style="height: 70px;"></div>
	<div class="htmleaf-container">
		<div class="inp">
			<div class="col-lg-12">
				<div class="input-group">
				  <input type="text" class="form-control" placeholder="Search for..." id="find_school_value">
				  <span class="input-group-btn">
					<button class="btn btn-default" type="button" id="find_school_btn">搜索</button>
				  </span>
				</div>
			</div>
		</div>
		<div id="app">
	        <div id="wrapper-sliderTv">
	           
	            <div id="sliderTV" class="sliderTV">
	                
	                <c:forEach items="${schools }" var="school">
	                	<div class="sliderTV__item">
						<a href="${pageContext.request.contextPath}/Schoolspace/getSchoolSpace?scId=${school.sId}&scName=${school.scName}">
	                    <img src="${pageContext.request.contextPath}/resources/imgs/${school.scImage}">
	                	<div class="pi">${school.scName }</div></a>
	               	 </div>
	                </c:forEach>
	                
	                <div id="sliderTV__mask-left"></div>
	                <div id="sliderTV__mask-right"></div>

	                <div class="sliderTV__prev">&#10096;</div>
	                <div class="sliderTV__next">&#10097;</div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sliderTV.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/horizontal.js"></script>
</body>
</html>