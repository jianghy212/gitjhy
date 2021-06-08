<%@ page language="java" contentType=" text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="charset=UTF-8; multipart/form-data">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cropper.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cropper.min.js"></script>
<title>个人信息</title>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div style="height: 100px;"></div>
	<section>
		<div class="index-main clearfix">
			<div class="index-main-core col-xs-12 col-md-12 fl">
				<div class="index-content">
					<div class="index-content-text">
						<div class="index-text-ibigs">
							<p class="index-content-selecteds">个人设置</p>
							<div class="set">
								<ul>
									<li>基本设置</li>
									<li>绑定设置</li>
									<li>修改密码</li>
								</ul>
							</div>
							<div class="ibase">
							<form enctype="multipart/form-data" method="post">
								<div class="col-md-6 col-xs-12">
									<div class="index-sl-imgs fl">
										<img id="user-photo" src="${pageContext.request.contextPath}/uHeadImage/${sessionScope.userinfo.userImage}">
									</div>
									<div class="ihoves"><a data-target="#changeModal" data-toggle="modal">点击更换头像</a></div>
						-			<div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog">
								    <div class="modal-content">
									        <div class="modal-header">
								            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								            <h4 class="modal-title text-primary">
								            <i class="fa fa-pencil"></i>
								                        更换头像
								            </h4>
								        </div>
								        <div class="modal-body">
								            <p class="tip-info text-center">
								                选择本地图片上传
								            </p>
								            <div class="img-container hidden">
								                <img src="" alt="" id="photo">
								            </div>
								            <div class="img-preview-box hidden">
								                <hr>
								                <span>150*150:</span>
								                <div class="img-preview img-preview-lg">
								                </div>
								                <span>100*100:</span>
								                <div class="img-preview img-preview-md">
								                </div>
								            </div>
								        </div>
											<div class="modal-footer">
									            <label class="btn btn-danger pull-left" for="photoInput">
									            <input type="file" class="sr-only" id="photoInput" accept="image/*">
									            <span>打开图片</span>
									            </label>
									            <button class="btn btn-primary disabled" disabled="true" onclick="sendPhoto()">提交</button>
									            <button class="btn btn-close" aria-hidden="true" data-dismiss="modal">取消</button>
								        	</div>
								    </div>
								</div>
								</div>
								</div>
								</form>
								<div class="col-md-6 col-xs-12">
							<form action="${pageContext.request.contextPath}/ueinfo/editinfo" method="post">							
										
										<div class="form-group">									
					    					<label class="ilab" style="float: left;">昵称</label>
					    					
					    					<input type="text" name = "user_name" class="form-control controls" value="${sessionScope.userinfo.userName }">
					  					</div>
					  					<div class="form-group">
					    					<label class="ichan" style="float: left;">性别</label>
					    					<input type="radio" name="user_sex" id="optionsRadios1" value="1" <c:if test="${sessionScope.userinfo.userSex == '男'}">checked="checked"</c:if> >男&nbsp;&nbsp;&nbsp;&nbsp;
					    					<input type="radio" name="user_sex" id="optionsRadios2" value="2" <c:if test="${sessionScope.userinfo.userSex == '女'}">checked="checked"</c:if>>女
					  					</div>
					  					
					  					<div class="form-group" style="float:left;">
									    	<input class="u-btn" type="submit" value="保存" />
					  					</div>
					  				</form>							
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
	var initCropperInModal = function(img, input, modal){
        var $image = img;
        var $inputImage = input;
        var $modal = modal;
        var options = {
            aspectRatio: 1, // 纵横比
            viewMode: 2,
            preview: '.img-preview' // 预览图的class名
        };
        // 模态框隐藏后需要保存的数据对象
        var saveData = {};
        var URL = window.URL || window.webkitURL;
        var blobURL;
        $modal.on('show.bs.modal',function () {
            // 如果打开模态框时没有选择文件就点击“打开图片”按钮
           /* if(!$inputImage.val()){
                $inputImage.click();
            }*/
        }).on('shown.bs.modal', function () {
            // 重新创建
            $image.cropper( $.extend(options, {
                ready: function () {
                    // 当剪切界面就绪后，恢复数据
                    if(saveData.canvasData){
                        $image.cropper('setCanvasData', saveData.canvasData);
                        $image.cropper('setCropBoxData', saveData.cropBoxData);
                    }
                }
            }));
        }).on('hidden.bs.modal', function () {
            // 保存相关数据
            saveData.cropBoxData = $image.cropper('getCropBoxData');
            saveData.canvasData = $image.cropper('getCanvasData');
            // 销毁并将图片保存在img标签
            $image.cropper('destroy').attr('src',blobURL);
        });
        if (URL) {
            $inputImage.change(function() {
                var files = this.files;
                var file;
                if (!$image.data('cropper')) {
                    return;
                }
                if (files && files.length) {
                    file = files[0];
                    if (/^image\/\w+$/.test(file.type)) {

                        if(blobURL) {
                            URL.revokeObjectURL(blobURL);
                        }
                        blobURL = URL.createObjectURL(file);

                        // 重置cropper，将图像替换
                        $image.cropper('reset').cropper('replace', blobURL);

                        // 选择文件后，显示和隐藏相关内容
                        $('.img-container').removeClass('hidden');
                        $('.img-preview-box').removeClass('hidden');
                        $('#changeModal .disabled').removeAttr('disabled').removeClass('disabled');
                        $('#changeModal .tip-info').addClass('hidden');

                    } else {
                        window.alert('请选择一个图像文件！');
                    }
                }
            });
        } else {
            $inputImage.prop('disabled', true).addClass('disabled');
        }
   		};
   		function sendPhoto () {
	    // 得到PNG格式的dataURL
			var photo = $('#photo').cropper('getCroppedCanvas', {
				width: 300,
				height: 300
			}).toDataURL('image/png');
			$('#user-photo').attr('src', photo);
			$('#changeModal').modal('hide');
			 $.ajax({
				url: 'editImg', // 要上传的地址
				type: 'post',
				data: {
					'imgdata': photo
				},
				dataType:'text',
				success: function (data) {
					window.location.reload();
				}
			}); 	
				alert("修改成功");
			 window.location.reload();
		}
   		
	$(function(){
        initCropperInModal($('#photo'),$('#photoInput'),$('#changeModal'));
    });
	</script> 
	<%
	
	if(request.getAttribute("messages")!=null){
		%>
		<script>
			alert('${request.messages}');
		</script>
		
		<%
	}
	%>
</body>
</html>