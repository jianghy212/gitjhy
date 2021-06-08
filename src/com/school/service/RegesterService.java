package com.school.service;

import java.util.List;

import com.school.pojo.TbSchooladd;
import com.school.pojo.TbUser;

public interface RegesterService {

	List<TbSchooladd> findCityName(String name);

	List<TbUser> findUserName(String userName);

	int checkUser(String user_account, String res);

	TbUser findUser(String user_account);

	Integer addUserInfo(String useraccount, String userpwd, String academy, Integer i, String string, String string2, String academy2,Integer loginin);

	void checkLogin(String user_account,Integer num);

	Integer editUserinfo(String account, String username, String sexs);

	void editImg(String account, String imgname);

}
