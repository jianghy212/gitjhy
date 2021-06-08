<%@ page language="java" contentType=" text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/center.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	</head>
	<body>
			<jsp:include page="/header.jsp"></jsp:include>
		
		<div style="height: 100px;"></div>
		<div class="center-b">
			<ul id="myTab" class="nav nav-tabs">
			    <li class="active"><a href="#home" data-toggle="tab">
			            发布过的活动</a>
			    </li>
			    <li><a href="#ios" data-toggle="tab">发布过的比赛</a></li>
			    <li><a href="#kj" data-toggle="tab">发布动态</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
			    <div class="tab-pane fade in active" id="home">
			        <div class="row">
			        	<div class="col-sm-6 col-md-4 col-lg-3 center-ff">
			        		<a href="${pageContext.request.contextPath}/actity/createac">
			        			<span class="glyphicon glyphicon-open"></span>
			        			<p style="font-size: 30px;">发布活动</p>
			        		</a>
			        	</div>
			        	<c:forEach items="${myactlist }" var="myact">
					  <div class="col-sm-6 col-md-4 col-lg-3">
					    <div class="thumbnail">
					      <img src="${pageContext.request.contextPath }/cover/${myact.acImage }" alt="...">
					      <div class="caption">
					        <h3>${myact.acName }</h3>
					        <p>${myact.acText }</p>
					        <p>
					        <a href="${pageContext.request.contextPath }/actity/showacfinfo?id=${myact.aid}" class="btn btn-primary" role="button">查看活动</a> 
					        <a href="${pageContext.request.contextPath }" class="btn btn-default" role="button">管理活动</a>
					        </p>
					      </div>
					    </div>
					  </div>
					</c:forEach>
					</div>
			    </div>
	    <div class="tab-pane fade" id="kj">
	    <div style="float:left;height:80px;line-height:20px;color:black;width:500px;background:#708090;margin-top:40px;position:relative;">
	    <textarea id="tex" style="position:absolute;top:0px;left:0px;width:500px;border:0;overflow:hidden;resize : none;outline:none;height:80px;background:rgba(112,128,144,0);"></textarea>
	    </div>
		<hr style="height:80px;width:1px;float:left;">
		<div style="width:60px;height:80px;background:#708090;float:left;margin-top:40px;position:relative;">
		<span class="glyphicon glyphicon-camera" style="font-size:40px;padding:20px 10px;cursor:pointer;" aria-hidden="true"></span>
		<input style="opacity: 0;position:absolute;top:0px; width:60px;height:80px;cursor:pointer;" type="file" name="file0" id="file0" accept="image/jpeg,image/jpg,image/png" multiple="multiple"/></div>
		<hr style="height:80px;width:1px;float:left;">
		<div style="width:60px;height:80px;background:#708090;float:left;margin-top:40px;position:relative;"><span class="glyphicon glyphicon-film" style="font-size:40px;padding:20px 10px;cursor:pointer;" aria-hidden="true">
		</span>
		<input style="opacity: 0;position:absolute;top:0px; width:60px;height:80px;cursor:pointer;" type="file" name="file0" id="file1" accept="video/*" multiple="multiple"/></div>
		<div style="width:561px;height:40px;background:#708090;position:absolute;top:265px;">
		<button type="button" style="float:right;margin:5px 10px;" class="btn btn-primary btn-sm">发表</button>
		</div><div style="width:560px;heigth:300px;margin-top:2px;">
		<div id="loi"></div>0
		</div>
		</div>
			</div>
		</div>
		
		<script type="text/javascript">
		  $("button").click(function(){
			  var formData = new FormData();
			  formData.append("file0",$('#file0')[0].files[0]);
			  formData.append("file1",$('#file1')[0].files[0]);
			  formData.append("text",$("#tex").val());
			  $.ajax({
					url:"checkschool",
					type:"POST",
					cache: false,
					data: formData,
					dataType:'text',
					processData: false,
					contentType: false,
					success:function (result){
						if(result == "1"){
							alert("您的学校没有开通动态空间");
							location.reload();
						}else if(result=="0"){
							alert("发布成功");
						}else{
							alert("请重新上传");
						}
						
					},
			  error:function(e){
				  alert("上传文件错误");
			  }
				});
			  
			});
		  
		  
		  
		  
		  
		  
		</script>
	</body>
</html>
