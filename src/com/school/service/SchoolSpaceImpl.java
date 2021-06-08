package com.school.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.dao.SchoolSpaceInfoDao;
import com.school.pojo.SchoolSpace;
@Service
public class SchoolSpaceImpl implements SchoolSpaceService{
	@Autowired
	private SchoolSpaceInfoDao dao;
	
	@Override
	public List<SchoolSpace> getAllByid(Integer id) {
		return dao.getAllByid(id);
	}

	@Override
	public int findSchoolName(String scname) {
		int num = dao.findSchoolName(scname);
		return num;
	}

	@Override
	public int findSid(String scname) {
		
		return dao.findSid(scname);
	}

	@Override
	public int addSpace(String username, String userimg, String text,
			String scimgname, String time, int san, int sid, int status) {
		
		return dao.addSpace( username,  userimg,  text,
				 scimgname,  time,  san,  sid,  status);
	}

	@Override
	public String getScimg(Integer id) {
		
		return dao.getScimg(id);
	}
}
