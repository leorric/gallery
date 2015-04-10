package com.utopia.gallery.service;




import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utopia.gallery.model.Works;
import com.utopia.gallery.model.WorksExample;
import com.utopia.gallery.persistence.WorksMapper;

@Service
public class WorksService {
	@Autowired
	private WorksMapper worksMapper;
	
	public Works selectByPrimaryKey(Integer id) {
		return worksMapper.selectByPrimaryKey(id);
	}
	
	public List<Works> selectByExample(WorksExample example) {
		return worksMapper.selectByExample(example);
	}
	
	public int updateByPrimaryKeySelective(Works record) {
		return worksMapper.updateByPrimaryKeySelective(record);
	}
	
	public int insertSelective(Works record) {
		record.setCreatedatetime(new Date());
		record.setUpdatedatetime(new Date());
		return worksMapper.insert(record);
	}
	
	public int deleteByPrimaryKey(Integer id){
		return worksMapper.deleteByPrimaryKey(id);
	}
}
