package com.school.service;
import java.util.List;

import com.school.dao.ActivityServiceDao;
import com.school.pojo.TbActivity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ActivityServiceImpl implements ActivityService{

	@Autowired
	private ActivityServiceDao dao;
	@Override
	public int addActivity(Integer uid, String headline, String newName,
			String intro, String sex, String contact, String cityaddress,
			String addressinfo, String promulgator) {
		int num = dao.addActivity(uid,headline,newName,intro,sex,contact,cityaddress,addressinfo,promulgator);
		return num;
	}
	@Override
	public TbActivity selectAct(Integer uid, String headline) {
		TbActivity act = dao.findAct(uid,headline);
		return act;
	}
	@Override
	public TbActivity checkHeadline(String headline) {
		TbActivity s = dao.checkHead(headline);
		return s;
	}
	@Override
	public List<TbActivity> findAllact() {
		List<TbActivity> list = dao.findAllact();
		return list;
	}
	@Override
	public TbActivity findAct(String aid) {
		TbActivity s = dao.findActByid(aid);
		return s;
	}
	@Override
	public List<TbActivity> searchAct(String headline) {
		String text = "%"+headline+"%";
		List<TbActivity> list = dao.searchAct(text);
		return list;
	}
	@Override
	public List<TbActivity> searchActBytype(String type) {
		List<TbActivity> list = dao.searchActBytype(type);
		return list;
	}
	@Override
	public List<TbActivity> findActByUid(Integer uid) {
		List<TbActivity> list = dao.findActByUid(uid);
		return list;
	}

}
