<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style1.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/re.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cropper.css">
    	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cropper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/citySelect.js"></script>
	</head>
	<body>
		<jsp:include page="/header.jsp"></jsp:include>
	<div style="height: 100px;"></div>
		<div class="re-main re-main1">
			<span class="h4 re-sty">发布活动</span>
		</div>
		<div class="re-main2 re-main1">
			<form action="${pageContext.request.contextPath}/actity/newacti" method="post" enctype="multipart/form-data" name="form0" id="form0">
				<div class="h4">基本信息</div>
				<div class="re-line"></div>
				<div class="re-title">
					<div class="re-name">
						<span style="color: red;
							width: 8px;display: inline-block;
							text-align: center;
							font-size: 14px;">*</span>
							标题
							<span>应为5～30个字，需清晰、准确概括视频内容，突出活动主题</span>
					</div>
					<div class="re-wrap-new">
							<div class="form-group">
							    <input type="text" class="form-control" id="text" name="headline" placeholder="标题(5-30个字符)">
							  </div>
					</div>
				</div>
				<div class="re-title">
					<div class="re-name">
						<span style="color: red;
							width: 8px;display: inline-block;
							text-align: center;
							font-size: 14px;">*</span>
							封面
							<span>建议展现人物/事物主体；需画面清晰，（宽度需640像素以上）；格式支持JPEG、PNG</span>
					</div>
					<div class="re-wrap-new">
						<div class="re-upload">
											<img class="re-bg" src="${pageContext.request.contextPath}/resources/imgs/img_1.jpg" id="img0" >
										<div class="tips">
												<input style="opacity: 0;" class="re-bg re-inp" type="file" name="file0" id="file0" accept="image/jpeg,image/jpg,image/png" multiple="multiple"/>
												<span style="position:absolute; left:7px;">上传封面</span>
										</div>
										<div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-hidden="true">
							
						</div>
					</div>
				</div>
				<div class="re-title">
					<div class="re-name">
							简介
					</div>
					<div class="re-wrap-new">
							<div class="form-group">
							    <input type="text" class="form-control" name="intro" id="text" placeholder="请填写活动简介">
							  </div>
					</div>
				</div>
				<div class="re-title">
					<div class="re-name">
						类别	
					</div>
					<div class="re-wrap-new">
						<input type="radio" name="chat" value="1" checked="" />
						<span class="tui2-radio-text">学术交流</span>
						<input type="radio" name="chat" value="2"/>
						<span class="tui2-radio-text">文体娱乐</span>
					</div>
				</div>
				<div class="re-line"></div>
				<div class="re-title">
					<div class="re-name">
							联系方式
					</div>
					<div class="re-wrap-new">
						  <div class="form-group">
						    <input type="text" class="form-control" name="contact" id="text" placeholder="">
						  </div>
						  
					</div>
				</div>
				<div class="re-title">
					<div class="re-name">
							活动地点
				<input type="hidden" id="cityadd" name="cityaddress" value="北京"/>
					</div>
					<div class="search">
					    <div class="citySelect">
					        <span id="cityaddress" class="cityName">北京</span>
					        <i class="iconDown"></i>
					        <i class="line"></i>
					    </div>
					
					    <div class="dropDown">
					        <div class="dropProv" id="cityIn">
					            <ul class="dropProvUl dropUl"></ul>
					        </div>
					        <div class="dropCity" id="cityNameinfo">
					            <ul class="dropCityUl dropUl"></ul>
					        </div>
					    </div>
					</div>
					<div class="re-wrap-new">
						  <div class="form-group">
						    <input type="text" class="form-control" name="addressinfo" id="text" placeholder="请填写此活动详细地址">
						  </div>
					</div>
				</div>
				<div class="re-title">
					<div class="re-name">
							发布者
					</div>
					<div class="re-wrap-new">
						  <div class="form-group">
						    <input type="text" class="form-control" name="promulgator" id="text" placeholder="xx学校xx社">
						  </div>
					</div>
				</div>
			</div>
				<div class="re-main re-main1 re-main4">
					<input class="btn btn-danger" type="submit" value="发表">
				</div>
			</form>
		</div>
		<%
		if(request.getAttribute("mess")!=null){
			%>
			<script type="text/javascript">
			alert("创建活动失败");
			</script>
			<%
		}
		%>
		<%
		if(request.getAttribute("checkmes")!=null){
			%>
			<script type="text/javascript">
			alert("该活动已经存在");
			</script>
			<%
		}
		%>
		<script>    
		    $("#file0").change(function(){  
		      // getObjectURL是自定义的函数，见下面  
		      // this.files[0]代表的是选择的文件资源的第一个，因为上面写了 multiple="multiple" 就表示上传文件可能不止一个  
		      // ，但是这里只读取第一个   
		      var objUrl = getObjectURL(this.files[0]) ;  
		      
		      // console.log("objUrl = "+objUrl) ;  
		      if (objUrl) {  
		        // 在这里修改图片的地址属性  
		        $("#img0").attr("src", objUrl) ;  
		      }  
		    }) ;  
		   
		    $("#cityNameinfo").click(function(){
		    	var info = $("#cityaddress").text();
		    	$("#cityadd").val(info);
		    });
		    $("#cityIn").click(function(){
		    	var info = $("#cityaddress").text();
		    	$("#cityadd").val(info);		    	
		    });
		    //建立一個可存取到該file的url  
		    function getObjectURL(file) {  
		      var url = null ;   
		      // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已  
		      if (window.createObjectURL!=undefined) { // basic  
		        url = window.createObjectURL(file) ;  
		      } else if (window.URL!=undefined) { // mozilla(firefox)  
		        url = window.URL.createObjectURL(file) ;  
		      } else if (window.webkitURL!=undefined) { // webkit or chrome  
		        url = window.webkitURL.createObjectURL(file) ;  
		      }  
		      return url ;  
		    }  
		</script>
	</body>
</html>
