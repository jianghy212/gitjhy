package com.school.filter;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.dbutils.QueryRunner;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;





import com.school.dao.RegesterDao;
import com.school.pojo.TbUser;
import com.school.service.RegesterService;
import com.school.service.RegesterServiceImpl;
import com.school.utils.c3p0utils;
public class SessionFilter implements HttpSessionListener {
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
			HttpSession session = se.getSession();
			TbUser user = (TbUser) session.getAttribute("userinfo");
			int num =0;
			if(user!=null){
				QueryRunner runner = new QueryRunner(c3p0utils.getDataSource());
				String sql = "UPDATE userinfo SET loginin =? WHERE user_account =?";
				try {
					runner.update(sql,num,user.getUserAccount());
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.removeAttribute("userinfo");
			}
			
	}
}
