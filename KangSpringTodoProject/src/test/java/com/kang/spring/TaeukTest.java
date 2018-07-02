package com.kang.spring;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kang.persistence.TodoDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TaeukTest {
	@Autowired
	private TodoDAO dao;
	
	@Test
	public void selectCompletion() {
				System.out.println(dao.todoDetail(5));
		Assert.assertNotNull(dao.todoDetail(5));
	}
	
	@Test
	public void todoCount() {
		Assert.assertFalse(dao.selectCompletion(5));
	}
}