package com.school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.school.pojo.SchoolSpaceInfo;
import com.school.dao.SchoolSpaceInfoDao;

@Controller
public class SchoolSpaceInfoController {
	@Autowired
	SchoolSpaceInfoDao schoolSpaceInfoMapper;
	@RequestMapping("/schoolsInfo")
	public String getScools(Model model) {
		List<SchoolSpaceInfo> schoos = schoolSpaceInfoMapper.getAll();
		model.addAttribute("schools",schoos);
		return "school4";
	}
	@RequestMapping("/selectSchool")
	@ResponseBody 
	public  Integer selectSchool(@RequestParam("scName")String name) { 
		Integer n = schoolSpaceInfoMapper.selectSchoolIdByName(name);
		if(n == null) {
			return 0;
		}
		return n;
	}
}
