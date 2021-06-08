package com.school.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import sun.misc.BASE64Decoder;

import com.school.pojo.TbUser;
import com.school.service.RegesterService;

@Controller
@RequestMapping("/ueinfo")
public class UserInfoController {
	
	@Autowired
	private	RegesterService service;
@RequestMapping("/returnedit")
public String returnedit(){
	//返回编辑用户信息页面
	return "edit";
}
@RequestMapping("/editinfo")
public String editinfo(@RequestParam("user_name") String username,
						@RequestParam("user_sex") Integer sex,
						HttpServletRequest request
						){
	HttpSession session = request.getSession();
	TbUser user =(TbUser) session.getAttribute("userinfo");
	String account = user.getUserAccount();
	//修改属性 1 男  2 女
	String sexs =null;
	if(sex==1){
		sexs="男";
	}else if(sex==2){
		sexs="女";
	}
	Integer num = service.editUserinfo(account,username,sexs);
	if(num>0){
		TbUser user2 = service.findUser(account);
		session.setAttribute("userinfo", user2);
		return "core";
	}
	else{
		int mes = 1;
		request.setAttribute("messages", mes);
		return "edit";
	}
}
@RequestMapping("/editImg")
@ResponseBody
public String editimg(@RequestParam("imgdata") String imgStr,HttpServletRequest request){
	//上传文件,保存文件到头像文件夹,图片名称保存在数据库
	HttpSession session = request.getSession();
	TbUser user =(TbUser) session.getAttribute("userinfo");
	String account = user.getUserAccount();
	String images = user.getUserImage();
	String info ="";
	if(imgStr==null){
		return "n";
	}
	
	 BASE64Decoder decoder = new BASE64Decoder();
     String path = request.getServletContext().getRealPath("/uHeadImage");
			
		
		try{
			info= imgStr;
		String imgs = imgStr.substring(imgStr.indexOf(",")+1);
		byte[] b = decoder.decodeBuffer(imgs);
		for(int i=0;i<b.length;++i){ 
       		if(b[i]<0){b[i]+=256;}
       		}
		String imgname = System.currentTimeMillis()+"";
		File newFile=new File(path);
		if(!newFile.getParentFile().exists()){
				newFile.getParentFile().mkdirs();
		}
		String imgFilePath = path+"\\"+imgname+".png";
		OutputStream out = new FileOutputStream(imgFilePath);
		out.write(b);
		out.flush();
		out.close();
		String acname = imgname+".png";
		service.editImg(account,acname);
		TbUser user2 = service.findUser(account);
		session.setAttribute("userinfo", user2);
	}catch (Exception e){
		info="n";
	}
	return info;
}
}
