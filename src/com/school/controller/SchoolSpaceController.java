package com.school.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.school.pojo.SchoolSpace;
import com.school.pojo.TbUser;
import com.school.service.SchoolSpaceService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
@RequestMapping("/Schoolspace")
public class SchoolSpaceController {
	@Autowired
	private SchoolSpaceService service;
	@RequestMapping("/getSchoolSpace")
	public String getSchoolsSpaceById(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
									  @RequestParam("scId") Integer id,
									  @RequestParam("scName") String name,
									  Model model) {
		PageHelper.startPage(pn, 3);
		List<SchoolSpace> list = service.getAllByid(id);
		String scimg = service.getScimg(id);
		PageInfo page = new PageInfo(list,5);
		model.addAttribute("pageInfo", page);
		model.addAttribute("scName", name);
		model.addAttribute("scId",id);
		model.addAttribute("scimg",scimg);
		return "school2-2";
	}
	
	@RequestMapping("/returns")
	String returnindex(){
		//跳转到主页
		return "school4";
	}
	
	
}
