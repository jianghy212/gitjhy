package com.school.service;

import java.util.List;

import com.school.pojo.SchoolSpace;

public interface SchoolSpaceService {
	List<SchoolSpace> getAllByid(Integer id);

	int findSchoolName(String scname);

	int findSid(String scname);

	int addSpace(String username, String userimg, String text,
			String scimgname, String time, int san, int sid, int status);

	String getScimg(Integer id);
}
