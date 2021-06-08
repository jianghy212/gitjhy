package com.school.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.dao.RegesterDao;
import com.school.pojo.TbSchooladd;
import com.school.pojo.TbUser;
@Service
public class RegesterServiceImpl implements RegesterService{
	@Autowired
	private RegesterDao dao;

	@Override
	public List<TbSchooladd> findCityName(String name) {
		return dao.findCityName(name);
	}

	@Override
	public List<TbUser> findUserName(String userName) {
		return dao.findUserName(userName);
	}

	@Override
	public int checkUser(String user_account, String res) {
		//检查用户登录
		int num = dao.checkUser(user_account,res);
		if(num>0){return 1;}
		else{return 0;}
	}

	@Override
	public TbUser findUser(String user_account) {
		//查找用户信息
		TbUser list = dao.findUser(user_account);
		return list;
	}

	@Override
	public Integer addUserInfo(String useraccount, String userpwd, String academy, Integer i, String string, String string2, String academy2,Integer loginin) {
		//注册用户
		Integer num = dao.addUserInfo(useraccount,userpwd,academy, i,string, string2, academy2,loginin);
		return num;
	}

	@Override
	public void checkLogin(String user_account,Integer num) {
		//改为登录状态
		dao.checkLogin(user_account,num);
	}

	@Override
	public Integer editUserinfo(String account, String username, String sexs) {
		
		 int num = dao.editUserinfo(account,username,sexs);
		return num;
	}

	@Override
	public void editImg(String account, String imgname) {
		//修改用户头像
		dao.editImg(account,imgname);
	}

}
