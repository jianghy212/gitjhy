package com.school.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.school.pojo.TbActivity;

public interface ActivityServiceDao {

	int addActivity(@Param("uid") Integer uid, @Param("headline") String headline,@Param("newName") String newName, @Param("intro")String intro,
			@Param("chats")String sex, @Param("contact")String contact,@Param("cityaddress") String cityaddress,@Param("addressinfo") String addressinfo,
			@Param("promulgator")String promulgator);

	TbActivity findAct(@Param("uid")Integer uid, @Param("headline")String headline);

	TbActivity checkHead(@Param("head") String headline);

	List<TbActivity> findAllact();

	TbActivity findActByid(@Param("id")String aid);

	List<TbActivity> searchAct(@Param("text") String headline);

	List<TbActivity> searchActBytype(@Param("type")String type);

	List<TbActivity> findActByUid(Integer uid);

}
