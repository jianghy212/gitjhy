package com.school.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.school.pojo.TbActivity;
import com.school.pojo.TbUser;
import com.school.service.ActivityService;
import com.school.service.SchoolSpaceService;

@Controller
@RequestMapping("/actity")
public class ActityController {
	@Autowired
	private ActivityService actservice;
	@Autowired
	private SchoolSpaceService service;
@RequestMapping("/createac")
public String createac(){
	//跳转到创建活动页面
	return "release";
}
@RequestMapping("/addact")
public ModelAndView addact(){
	//显示所有活动
	List<TbActivity> list = actservice.findAllact();
	ModelAndView mv = new ModelAndView();
	mv.addObject("actlist",list); 
	mv.setViewName("actlist");
	return mv;
}
@RequestMapping("/myact")
public ModelAndView myact(HttpSession session){
	ModelAndView mv = new ModelAndView();
	TbUser user = (TbUser) session.getAttribute("userinfo");
	Integer uid = user.getUid();
	List<TbActivity> list = actservice.findActByUid(uid);
	mv.addObject("myactlist",list); 
	mv.setViewName("Personalcenter");
	return mv;
}
@RequestMapping("/newacti")
public ModelAndView newacti(@RequestParam("headline") String headline,
		@RequestParam("file0") MultipartFile file,
		@RequestParam("intro") String intro,
		@RequestParam("chat") Integer chat,
		@RequestParam("contact") String contact,
		@RequestParam("cityaddress") String cityaddress,
		@RequestParam("addressinfo") String addressinfo,
		@RequestParam("promulgator") String promulgator,
		HttpSession session,
		HttpServletRequest request){
//新建活动   新建完成后跳转到活动详情页面
ModelAndView mv = new ModelAndView();
TbUser user = (TbUser) session.getAttribute("userinfo");
Integer uid = user.getUid();
String chats=null;
if(chat==1)chats="学术交流";else chats="文体娱乐";
String newName=null;
try{
//获取上传图片名
String fileName = file.getOriginalFilename();
//获取后缀名
String sufName = fileName.substring(fileName.lastIndexOf("."));
//随机生成字符串
String preName = UUID.randomUUID().toString();
//拼接前缀和后缀
 newName = preName+sufName;
//指定路径
 String path= request.getServletContext().getRealPath("/cover")+"\\"+newName;
File f = new File(path);
//上传图片
file.transferTo(f);
}catch(Exception e){
	e.printStackTrace();
}
TbActivity s = actservice.checkHeadline(headline);
if(s!=null){
	//检查该标题是否存在
			mv.addObject("checkmes",1); 
			mv.setViewName("release");
			return mv;
}else{
int num = actservice.addActivity(uid,headline,newName,intro,chats,contact,cityaddress,addressinfo,promulgator);
if(num>0){
		//创建成功 显示活动
		TbActivity actinfo = actservice.selectAct(uid,headline);
		mv.addObject("actinfo",actinfo);
		mv.setViewName("actinfo");
		return mv;
	}
else{
	//创建失败
	mv.addObject("mess",1); 
	mv.setViewName("release");
	return mv;
	}
}
}
@RequestMapping("/showacfinfo")
public ModelAndView showacfinfo(@RequestParam("id") String aid){
	ModelAndView mv = new ModelAndView();
	TbActivity actinfo = actservice.findAct(aid);
	mv.addObject("actinfo",actinfo); 
	mv.setViewName("actinfo");
	return mv;
}
@RequestMapping("/searchact")
public ModelAndView searchact(@RequestParam("headline") String headline){
	//根据简介搜索活动
	List<TbActivity> list = actservice.searchAct(headline);
	ModelAndView mv = new ModelAndView();
	mv.addObject("actlist",list); 
	mv.setViewName("actlist");
	return mv;
}

@RequestMapping("/searchxs")
public ModelAndView searchxs(){
	String type = "学术交流";
	List<TbActivity> list = actservice.searchActBytype(type);
	ModelAndView mv = new ModelAndView();
	mv.addObject("actlist",list); 
	mv.setViewName("actlist");
	return mv;
}
@RequestMapping("/searchwt")
public ModelAndView searchwt(){
	String type = "文体娱乐";
	List<TbActivity> list = actservice.searchActBytype(type);
	ModelAndView mv = new ModelAndView();
	mv.addObject("actlist",list); 
	mv.setViewName("actlist");
	return mv;
}

@RequestMapping("/checkschool")
@ResponseBody
public String checkschool(
		HttpServletResponse response,
		HttpServletRequest request,
		Model model){
	HttpSession session = request.getSession();
	TbUser user = (TbUser)session.getAttribute("userinfo");
	String scname = user.getUserAcademy();
	String userimg = user.getUserImage();
	String username = user.getUserName();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    String time = df.format(new Date());// new Date()为获取当前系统时间
    int sid = service.findSid(scname);//学校代码
    int san = 0; //默认点赞数
	int num = service.findSchoolName(scname);
	String num1 = "1";
	if(num > 0){
		//插入信息
				MultipartHttpServletRequest multipartRequest=(MultipartHttpServletRequest) request;  
		        MultipartFile mfile0 = multipartRequest.getFile("file0");
		        MultipartFile mfile1 = multipartRequest.getFile("file1");
		        String text = request.getParameter("text");
		        //file0是图片文件    file1是视频文件  
		        //获取文件格式和文件名，改变名称存在数据库
		        int status = 2;
		        String scimgname = "";
		        if(mfile1!=null){
		        	 //上传视频到 schimg文件夹
		        	status=1;
		        	String scimgname1  = UUID.randomUUID().toString().replaceAll("-", "");
		            // 获取视频的扩展名
		             String path = request.getServletContext().getRealPath("/schimg");
		            String vext = FilenameUtils.getExtension(mfile1.getOriginalFilename());
		            scimgname= scimgname1+ "." + vext;
		            // 设置视频上传路径
		            // 以绝对路径保存重名命后的图片
		            try {
						mfile1.transferTo(new File(path+"\\" + scimgname ));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
		        	
		        }else if(mfile0!=null){
		        	//上传图片到 schimg文件夹
		        	status=0;
		        	String scimgname1 = UUID.randomUUID().toString().replaceAll("-", "");
		             // 获取文件的扩展名
		             String ext = FilenameUtils.getExtension(mfile0.getOriginalFilename());
		             scimgname= scimgname1+ "." + ext;
		             // 以绝对路径保存重名命后的图片
		             String path = request.getServletContext().getRealPath("/schimg");
		             try {
		            	 mfile0.transferTo(new File(path+ "\\"+scimgname ));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}		        	
		        }
		       int info = service.addSpace(username,userimg,text,scimgname,time,san,sid,status);
				if(info > 0 ){
					num1="0";
					
				}else{
					num1="2";
				}
				return num1;
	}else{
		num1 = "1";
		return num1;
	}
	
	
}
}
