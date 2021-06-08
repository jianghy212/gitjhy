<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cd.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	</head>
	<body>
		<jsp:include page="/header.jsp"></jsp:include>
		<div style="height: 70px;"></div>
		<div class="cd-main">
			<div class="h3">发现更多活动</div>
			<table class="table  table-striped">
				<tr class="success">
					<td class="ac-table-f"><span class="h4">搜索关键字</span></td>
					<td>
						<div class="row">
						  <div class="col-lg-4">
						  <form method="post" action="${pageContext.request.contextPath}/actity/searchact">
						    <div class="input-group">		      
						      <input style="width: 300px;" name="headline" type="text" class="form-control" placeholder="Search for...">
						      <span class="input-group-btn">
						        <button class="btn btn-default" type="submit">搜索活动</button>
						      </span>
						    </div><!-- /input-group -->
						    </form>
						  </div><!-- /.col-lg-6 -->
						</div><!-- /.row -->
					</td>
				</tr>
				<tr class="danger">
					<td>
						<div class="dropdown">
						  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    活动类型
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						    <li><a href="${pageContext.request.contextPath}/actity/searchxs">学术交流</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="${pageContext.request.contextPath}/actity/searchwt">文体娱乐</a></li>
						  </ul>
						</div>

					</td>
					<td>
						
					</td>
				</tr>
			</table>
		</div>
		<div class="fy-main">
			<div class="row">
				<c:forEach items="${actlist }" var="act">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="fh5co-card-item image-popup">
					<a href="${pageContext.request.contextPath}/actity/showacfinfo?id=${act.aid}" class="image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="${pageContext.request.contextPath}/cover/${act.acImage}" alt="Image" class="img-responsive">
						</figure>
					</a>
						<div class="fh5co-text">
							<h2>${act.acName }</h2>
							<p>${act.acText }</p>
							<p><span class="btn btn-primary">
							<a href="${pageContext.request.contextPath}/actity/showacfinfo?id=${act.aid}" >
							查看活动
							</a>
							</span></p>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>		
	</body>
</html>
