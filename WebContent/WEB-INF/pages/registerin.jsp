<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrapValidator.js"></script>
<title>注册</title>
</head>
<body>
	<div id="ihe2" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
		    <div class="navbar-header">
		    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse">
		        	<span class="sr-only"></span>
		        	<span class="icon-bar"></span>
		        	<span class="icon-bar"></span>
		        	<span class="icon-bar"></span>
		      	</button>
		      	<a id="bannerii" class="navbar-brand" href="${pageContext.request.contextPath}/index/returnindex">校园季</a>
			</div>
		</div>
	</div>
	<div class="main2">
		<div class="login-bottom">
			<h2>注册</h2>
			<div class="login-bottom-top">
				<form id="aform" action="${pageContext.request.contextPath}/index/registeruser" method="post">
					<input type="hidden" name="user_identity" value="0">
				  <div class="form-group">
				    <label style="float: left;">账号</label>
				    <input type="text" class="form-control" name="userName" id="phone" placeholder="ID">
				  </div>
				  <div class="form-group">
				    <label style="float: left;">密码</label>
				    <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Password">
				  </div>
				  <div class="form-group">
				    <label style="float: left;">确认密码</label>
				    <input type="password" name="pwd1" class="form-control" id="pwd1" placeholder="Password">
				  </div>
				  <div style="position: relative;" class="form-group">
				    <label style="float: left;">所在院校</label>
				    <input type="text" id="sc" name="Code" class="form-control" placeholder="Verification Code">
				    
				    <ul id="iform" class="form-control">
					</ul>
				  </div>
				  <button id="iregister doSave"  type="submit" >注册</button>
				</form>
				<div class="register-bottom-bottom">
				    <label for="exampleInputPassword1"><a class="iii" href="${pageContext.request.contextPath}/index/returnlogin">返回登录</a></label>
				  </div>
				  </div>
		</div>
	</div>
	<c:if test="${message>0}">
		<script type="text/javascript">
			alert("注册失败,请检查信息是否错误");
		</script>
	</c:if>
</body>
</html>