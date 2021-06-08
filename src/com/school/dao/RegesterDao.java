package com.school.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.school.pojo.TbSchooladd;
import com.school.pojo.TbUser;


public interface RegesterDao {
	List<TbSchooladd> findCityName(@Param("cityname") String name);

	List<TbUser> findUserName(@Param("userName") String userName);

	int checkUser(@Param("account") String user_account, @Param("pwd") String res);

	TbUser findUser(String user_account);

	Integer addUserInfo(@Param("useraccount") String useraccount,
					@Param("username") String username,
					@Param("userpwd") String userpwd,
					@Param("iden") Integer i,
					@Param("sex") String sex,
					@Param("img") String img,
					@Param("academy") String academy,
					@Param("loginin") Integer loginin);

	void checkLogin(@Param("account") String user_account,@Param("num") Integer num);

	int editUserinfo(@Param("useraccount") String account, @Param("username") String username,@Param("sex") String sexs);

	void editImg(@Param("account") String account,@Param("name") String imgname);
}

