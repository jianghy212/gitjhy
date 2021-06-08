package com.school.controller;

import java.security.Security;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.school.pojo.TbSchooladd;
import com.school.pojo.TbUser;
import com.school.service.RegesterService;
import com.school.utils.HashUtils;
import com.school.utils.RsaUtils;
@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private	RegesterService service;
	
	@RequestMapping("/returnindex")
	public String returnindex(){
		//跳转到主页
		return "redirect:/";
	}
	
	@RequestMapping("/returnregister")
	public String register() {
		//跳转到注册页面
		return "registerin";
	}
	@RequestMapping("/returnlogin")
	public String returnlogin(){
		//跳转到登录页面,生成私钥和公钥
		return "login";
	}
	@RequestMapping("/returninfo")
	public String returninfo(){
		//跳转到个人信息页面
		return "core";
	}
	@RequestMapping("/rsarequest")
	@ResponseBody
	public String rsarequest(HttpServletRequest request){
		Map<String, Object> keyMap;
		//秘钥初始化时加入制定默认的jce算法
		 Security.addProvider(new com.sun.crypto.provider.SunJCE());
		String publicKey = null;
		String privateKey= null;
		try {
		keyMap = RsaUtils.initKey();
		 
		publicKey =  RsaUtils.getPublicKey(keyMap);
		 
		privateKey =  RsaUtils.getPrivateKey(keyMap);
		} catch (Exception e) { 
		e.printStackTrace();
		} 
		//返回公钥给页面
		HttpSession session = request.getSession();
		session.setAttribute("privateKey", privateKey);
		return publicKey;
	}
	@RequestMapping("/findCityName")
	@ResponseBody
	public List<TbSchooladd> findCityName(String cityname){
		//查找学校
		String name = "%"+cityname+"%";
		if(cityname == null | cityname == ""){
			name=null;
		}
		return service.findCityName(name);
	}
	
	@RequestMapping("/userCheck")
	@ResponseBody
	public String  userCheck(String userName){
		//检查用户是否存在返回JSON格式 valid=false时表示验证不通过,不提示信息
		List<TbUser> listuser = service.findUserName(userName);
		boolean valid  = true;
		for(TbUser s  : listuser){
			if(s.getUserAccount().equals(userName)){
				valid = false;
				break;
			}
		}
		HashMap<String,Boolean> hashMap = new HashMap<>();
		hashMap.put("valid",valid);
        ObjectMapper mapper = new ObjectMapper();
		String str=null;
		try {
			//通过此方法讲map转换位JSON格式的字符串
			str = mapper.writeValueAsString(hashMap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping("/loginin")
	public ModelAndView loginin(String user_account, String user_pwd,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		//登录方法,如果成功跳转到主页,失败提示信息返回登录页面
		//解密密码
		HttpSession session = request.getSession();
		String privateKey2 = (String) session.getAttribute("privateKey");
		session.removeAttribute("privateKey");
		String rese=null;
		try {
			//解密
			rese=RsaUtils.testDecrypt(privateKey2, user_pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//检查密码和用户名是否正确
		//密码需要加密后再验证
		HashUtils hs = new HashUtils();
		String res = HashUtils.encrypt(rese);//加密

		int check = service.checkUser(user_account,res);
		int info;
		if(check==1){
			//存在用户  把用户信息传到主页
			info=0;
			TbUser user = service.findUser(user_account);
			if(user.getLoginin()==1){
				//该用户在线
				info = 1;
				mv.addObject("loginmes",info);
				mv.setViewName("login");
				return mv;
			}else{
				//该用户不在线
			//登录状态改为1,退出改为0
			int num =1;
			service.checkLogin(user_account,num);
			session.setAttribute("userinfo", user);
			mv.setViewName("redirect:/");//返回页面
			return mv;
			}
		}else{
			//不存在用户
			info = 1;
			mv.addObject("messages",info);
			mv.setViewName("login");
			return mv;
		}
	}
	
	@RequestMapping("/registeruser")
	public ModelAndView registerUser(@RequestParam("userName") String useraccount,
								@RequestParam("pwd1") String pwd1,
								@RequestParam("Code") String academy)
	{		
		ModelAndView mv = new ModelAndView();
		//注册用户,密码加密后存入数据库
		HashUtils hs = new HashUtils();
		String pwd=HashUtils.encrypt(pwd1).toString();//加密	
		Integer s  = 2;
		Integer num =service.addUserInfo(useraccount,"匿名用户",pwd,1,"男","img",academy,s);
		//注册成功返回登录 失败提示信息
		if(num>0){
			mv.setViewName("login");//返回页面
			return mv;
		}else{
			int mes = 1;
			mv.addObject("message",mes);//设置返回到页面上的数据  相当于setAttribute
			mv.setViewName("registerin");
			return mv;
		}
	}
	@RequestMapping("/loginOut")
	public ModelAndView loginOut(HttpServletRequest request){
		//退出登录后返回主页
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("userinfo");
		if(user!=null){
			service.checkLogin(user.getUserAccount(), 0);
			session.removeAttribute("userinfo");
		}
		mv.setViewName("redirect:/");
		return mv;
	}
}
