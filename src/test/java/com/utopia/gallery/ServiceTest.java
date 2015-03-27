package com.utopia.gallery;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.utopia.gallery.persistence.MapperConfig;
import com.utopia.gallery.service.DemoService;
import com.utopia.gallery.service.ServiceConfig;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(classes={ServiceConfig.class,MapperConfig.class})
@ContextConfiguration(locations = { "../../../applicationContext-dao.xml"})  
public class ServiceTest {
	
	@Autowired
	private DemoService ds;
	
	@Test
	public void demoServiceShouldNotBeNull() {
		System.out.println("ds:"+ds);
		assertNotNull(ds);
	}
}
