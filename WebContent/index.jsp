<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.school.pojo.TbUser" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
    	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=MAdEDFy6Pnq2LhiKqGhA361E3DKdR1is"></script>
    
<title>主页</title>
</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>
	<div>
		<div style="margin-top:38px;"></div>
		<div id="wd">
		<div id="wrap" class="wrap" style="float: left;">
			<div class="swiper-container" id="swiper" style="float: left;">
				<div class="swiper-wrapper swiper-no-swiping" >
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/resources/imgs/bc1.jpg">
					</div>
					<div class="swiper-slide">
							<img src="${pageContext.request.contextPath}/resources/imgs/bc2.jpg">
					</div>
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/resources/imgs/bc3.jpg">
					</div>
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/resources/imgs/bc4.jpg">
					</div>
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/resources/imgs/bc1.jpg">
					</div>
				</div>
			</div>
			<div class="bc">
				<div class="ban f-pr" style="z-index:10;">
					<div class="bannerBox">
						<div class="swiper-container" id="swiper1" >
							<div class="swiper-wrapper swiper-no-swiping" >
								<div class="swiper-slide">
									<img src="${pageContext.request.contextPath}/resources/imgs/long1.jpg">
								</div>
								<div class="swiper-slide">
									<img src="${pageContext.request.contextPath}/resources/imgs/long2.jpg">
								</div>
								<div class="swiper-slide">
									<img src="${pageContext.request.contextPath}/resources/imgs/long3.jpg">
								</div>
								<div class="swiper-slide">
									<img src="${pageContext.request.contextPath}/resources/imgs/long4.jpg">
								</div>
								<div class="swiper-slide">
									<img src="${pageContext.request.contextPath}/resources/imgs/long5.jpg">
								</div>
							</div>
						</div>
						<div class="left">
							<img src="${pageContext.request.contextPath}/resources/imgs/bannerL.png">
						</div>
						<div class="right">
							<img src="${pageContext.request.contextPath}/resources/imgs/bannerR.png">
						</div>
						<div class="pagination">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div> 
	<!--主题部分-->
	<!-- 城市地理位置 -->
	<div id="allmap"></div>
	   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/orientation.js"></script>
	<%    
       if(session.getAttribute("userinfo") == null) {      
%>    
       <script type="text/javascript" language="javascript">  
          window.top.location.href="${pageContext.request.contextPath}/index/returnlogin";  
       </script>   
 <%    
      }    
 %>
<section class="services wrapper">
	<ul>
		<li>
			<img class="s_icons" src="${pageContext.request.contextPath}/resources/imgs/s1_icon.png" title="" alt=""/>
			<h3>社团活动发布</h3>
			<p>Excepteur sint occaecat cupi datat non it proident, sunt in culpa qui officia dese runtorn mollit anim id est laborum.</p>		
		</li>
		<li>
			<img class="s_icons" src="${pageContext.request.contextPath}/resources/imgs/s2_icon.png" title="" alt=""/>
			<h3>校园动态信息</h3>
			<p>Excepteur sint occaecat cupi datat non it proident, sunt in culpa qui officia dese runtorn mollit anim id est laborum.</p>		
		</li>
		<li>
			<img class="s_icons" src="${pageContext.request.contextPath}/resources/imgs/s3_icon.png" title="" alt=""/>
			<h3>实时通知消息</h3>
			<p>Excepteur sint occaecat cupi datat non it proident, sunt in culpa qui officia dese runtorn mollit anim id est laborum.</p>		
		</li>
	</ul>
	</body>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</html>