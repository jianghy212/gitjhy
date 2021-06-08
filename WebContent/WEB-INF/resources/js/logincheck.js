var pub="";
$(document).ready(function(){
	$.ajax({
        url:'rsarequest',
        data:{'time': new Date()},
        type:'POST',
        dataType:'text',
        success:function(data){
           pub=data;
        }
    });
});
function subrsa(){
	//获取到的表单中的密码值
	var str1=document.getElementById("isform").user_pwd.value;
	//加密　
	var encrypt=new JSEncrypt();
	encrypt.setPublicKey(pub);
	var str2 = encrypt.encrypt(str1);
	//修改为加密后的值
	var str=document.getElementById("isform").user_pwd.value=str2;
}