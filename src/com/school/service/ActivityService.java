package com.school.service;

import java.util.List;

import com.school.pojo.TbActivity;

public interface ActivityService {

	int addActivity(Integer uid, String headline, String newName, String intro,
			String sex, String contact, String cityaddress, String addressinfo,
			String promulgator);

	TbActivity selectAct(Integer uid, String headline);

	TbActivity checkHeadline(String headline);

	List<TbActivity> findAllact();

	TbActivity findAct(String aid);

	List<TbActivity> searchAct(String headline);

	List<TbActivity> searchActBytype(String type);

	List<TbActivity> findActByUid(Integer uid);

}
