package com.school.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.school.pojo.SchoolSpace;
import com.school.pojo.SchoolSpaceInfo;

public interface SchoolSpaceInfoDao {
	List<SchoolSpaceInfo> getAll();
	List<SchoolSpace> getAllByid(Integer sid);
	Integer selectSchoolIdByName(String name);
	int findSchoolName(String scname);
	int findSid(String scname);
	int addSpace(
				 @Param("username") String username,
				 @Param("userimg") String userimg, 
				 @Param("text") String text,
				 @Param("scimgname") String scimgname,
				 @Param("time") String time, 
				 @Param("san") int san,
				 @Param("sid") int sid, 
				 @Param("status") int status);
	String getScimg(Integer id);
}	
