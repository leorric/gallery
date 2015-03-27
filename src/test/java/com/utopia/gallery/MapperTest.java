package com.utopia.gallery;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import static org.junit.Assert.assertNotNull;

import com.utopia.gallery.model.Works;
import com.utopia.gallery.persistence.WorksMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../../../applicationContext-dao.xml"})  
public class MapperTest {
	
	@Autowired  
    public WorksMapper worksMapper;  
      
    @Test  
    public void testGetUser(){ 
    	Works works = worksMapper.selectByPrimaryKey(1);
    	System.out.println("works:"+works.getTitle());
        assertNotNull(new Works());  
    }  
}
