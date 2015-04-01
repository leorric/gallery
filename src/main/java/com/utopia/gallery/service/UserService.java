package com.utopia.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utopia.gallery.model.User;
import com.utopia.gallery.model.UserExample;
import com.utopia.gallery.persistence.UserMapper;


@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public User selectByPrimaryKey(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}
	
	public List<User> selectByExample(UserExample example) {
		return userMapper.selectByExample(example);
	}
}
