package com.utopia.gallery.web;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.utopia.gallery.model.User;
import com.utopia.gallery.model.UserExample;
import com.utopia.gallery.model.UserExample.Criteria;
import com.utopia.gallery.service.UserService;


@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login",method=GET)
	public String showLoginForm() {
		return "login"; 
	}
	
	@RequestMapping(value="/login",method=POST)
	public String processLoginForm(User user) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andAccountEqualTo(user.getAccount());
		criteria.andPasswordEqualTo(user.getPassword());
		List<User> list = userService.selectByExample(example);
		if(list.size() == 0) {
			return "login";
		}
		return "/backend/worksList";
	}
}
