<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
		<div id="ihe2" class="ihe navbar navbar-default navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header ir">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse">
		        <span class="sr-only"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a id="irf" class="navbar-brand" href="#"><img style="width:200px;height: 50px;" src="${pageContext.request.contextPath}/resources/imgs/ilogo.png"></a>
		    </div>
		    <div class="collapse navbar-collapse" id="icor">
		      <ul class="nav navbar-nav">
		        <li><a href="${pageContext.request.contextPath}/index/returnindex">首页</a></li>
		       <li>
		       <a href="${pageContext.request.contextPath}/schoolsInfo">学校圈子</a>
		       </li>
		        <li>		        
		          <a href="${pageContext.request.contextPath}/actity/addact" class="dropdown-toggle">社团活动</a>
		        </li>
		       
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      	<li style="height: 70px;margin-top: -10px;margin-right: 30px;line-height: 70px;">
		      		<span class="glyphicon glyphicon-map-marker" style="color: white;margin-right: -10px;"></span>
		      		<button type="button" class="btn btn-link" style="color: white; text-decoration: none;" id="addr">位置</button>
		      	</li>
		       
		      	<c:if test="${empty sessionScope.userinfo }">
		         <li style="position: relative;">
		          <a class="ihov" href="#">登录<span class="caret"></span></a>
		          <ul id="inu" style="display: none;">
		            <li><a href="${pageContext.request.contextPath}/index/returnlogin">账号登陆</a></li>
		            <li><a href="#">微信登录</a></li>
		            <li><a href="#">QQ登录</a></li>
		          </ul>
		        </li> 
		  		</c:if>
		        <c:if test="${sessionScope.userinfo != null}">
		        <li class="ilef" style="position: relative;">
					<a style="margin-top:-10px;" class="hihov" href="#">
						<div style="width: 40px;height: 40px;border-radius:25px;">
							<img src="${pageContext.request.contextPath}/uHeadImage/${sessionScope.userinfo.userImage }" />
						</div>
					</a>
		          	<ul id="hinu" style="display: none;">
		            	<li><a href="${pageContext.request.contextPath}/index/returninfo">个人中心</a></li>
		            	<li><a href="${pageContext.request.contextPath}/actity/myact">个人空间</a></li>
		            	<li><a href="${pageContext.request.contextPath}/index/loginOut">退出</a></li>
		          	</ul>
		        </li>
		       	</c:if>
		      </ul>
		    </div>
		  </div>
		</div>
	</header>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#tc").click(function(){
			$(".imain").fadeIn();
			$(".imainbox").delay(500).slideDown();
		});
		$(".left,.right").hover(function(){
			$(this).css("background-color","rgba(64,64,64,0.6)");
		},function(){
			$(this).css("background-color","rgba(64,64,64,0.0)");
		});
		$(".ihov,#inu").hover(function(){
			$("#inu").show();
		},function(){
			$("#inu").hide();
		});
		$(".hihov,#hinu").hover(function(){
			$("#hinu").show();
		},function(){
			$("#hinu").hide();
		});
		$(".inos,#ins").hover(function(){
			$("#ins").show();
		},function(){
			$("#ins").hide();
		});
		$("#ihove,.ihove").hover(function(){
			$(".ihove").show();
		},function(){
			$(".ihove").hide();
		});});
	</script>