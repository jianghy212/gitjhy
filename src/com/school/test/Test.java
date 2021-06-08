package com.school.test;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.school.pojo.TbSchooladd;
import com.school.service.RegesterServiceImpl;


public class Test {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx=
				new ClassPathXmlApplicationContext("configs/spring-configs.xml");
		RegesterServiceImpl impl = ctx.getBean("regesterServiceImpl",RegesterServiceImpl.class);
		List<TbSchooladd> list=impl.findCityName("%山%");
		for(TbSchooladd  a:list){
			System.out.println(a.getName());
		}
		
	}
	
	
}
