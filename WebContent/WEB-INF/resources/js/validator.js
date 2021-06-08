$(function(){
  $('form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      userName: {
        message: '用户名验证失败',
        validators: {
          notEmpty: {
            message: '用户名不能为空'
           },
        stringLength: {
          min: 8,
            max: 18,
            message: '用户名长度必须在8到18位之间'
        },
        threshold: 8,
        remote:{
        	url:"loginRegisterServlet",
        	message:'用户名已存在，请重新输入',
			 delay: 1000,
			 type: 'POST',
			 data:function(validator){
			 	return{
			 		userName : $("input[name=userName]").val(),
			 		method : "checkUserName"
			 	}
			 }
        },
        regexp: {
            regexp: /^[a-zA-Z0-9]+$/,
            message: '用户名只能包含大写、小写、数字'
        }
        }
    },
      pwd: {
        validators: {
          notEmpty: {
          message: '密码不能为空'
          },
          stringLength: {
          min: 6,
            max: 18,
            message: '密码长度必须在6到18位之间'
        },
        regexp: {
            regexp: /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/,
            message: '密码至少包含一个字母和一个数字'
          }
        }
      },
      pwd1:{
        validators:{
          notEmpty: {
          message: '密码不能为空'
          },
          identical: {
            field: 'pwd',
            message: '两次输入的密码不相符'
          }
        }
      },
      Code2:{
      	validators:{
          notEmpty: {
          message: '工作地点不能为空'
          }
        }
      }
    }
  });
});