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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jsencrypt.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/logincheck.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrapValidator.css">
<title>登录</title>
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
	<div class="mains">
		<div class="login-bottom">
			<h2>登录</h2>
			<h3></h3>
<!-- 			<h4>继续使用--</h4>
 -->			<div class="login-bottom-top">
				<form id="isform" action="${pageContext.request.contextPath}/index/loginin" method="post">
				  <div class="form-group">
				    <label style="float: left;">账号</label>
				    <input type="text" class="form-control" id="phone" placeholder="ID"  name="user_account" >
				  </div>
				  <div class="form-group">
				    <label style="float: left;" for="exampleInputPassword1">密码</label>
				    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="user_pwd">
				  </div>
				  <div class="checkbox">
				    <label>
				      <input type="checkbox" name="remeber" id="remebers" value="1"> 记住我的账户
				    </label>
				  </div>
				  <button type="submit" class="btn btn-default" onclick="subrsa()">登录</button>
				</form>
				<div class="login-bottom-bottom">
				    <label><a href="${pageContext.request.contextPath}/index/returnregister" id="tc">前去创建账号</a></label>
				  </div>
			</div>
		</div>
	</div> 
	<c:if test="${messages>0}">
		<script type="text/javascript">
			alert("用户名或密码错误");
		</script>
	</c:if>
	<c:if test="${loginmes>0}">
		<script type="text/javascript">
			alert("用户已登录");
		</script>
	</c:if>
	
	<script type="text/javascript">
	$(document).ready(function () {
	       $("#phone").focus();
	       //记住用户名和密码
	       $('#remebers').click(function () {
	        if ($("#phone").val() == "") {
	         alert("用户名不能为空！");
	        }
	        if($("#exampleInputPassword1").val() == "")
	        {
	         alert("密码不能为空！");
	        } else {
	             if ($('#remebers').attr("checked")) {
	                      setCookie("userid", $("#phone").val(), 60);
	                          setCookie("upwd", $("#exampleInputPassword1").val(), 60);
	             }else {
	                      delCookie("userid");
	                      delCookie("upwd");
	             }
	        }
	       });
	       if (getCookie("userid") != null)
	       {
	        $('#remebers').attr("checked", "checked");
	        $('#input1').val(getCookie("userid"));
	        $('#input2').val(getCookie("upwd"));
	       }
	      })
	      //写cookies
	      function setCookie(name, value) {
	       var Days = 3;
	       var exp = new Date();
	       exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	       document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
	      }
	      //读取cookies 
	      function getCookie(name) {
	       var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	       if (arr = document.cookie.match(reg)) return unescape(arr[2]);
	       else return null;
	      }
	      //删除cookies 
	      function delCookie(name) {
	       var exp = new Date();
	       exp.setTime(exp.getTime() - 1);
	       var cval = getCookie(name);
	       if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
	      }
	</script>
		
</body>
</html>