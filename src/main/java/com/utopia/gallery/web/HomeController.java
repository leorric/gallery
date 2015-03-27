package com.utopia.gallery.web;

import static org.springframework.web.bind.annotation.RequestMethod.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.utopia.gallery.model.Works;
import com.utopia.gallery.persistence.WorksMapper;
import com.utopia.gallery.service.WorksService;


@Controller
@RequestMapping({"/","/homepage"})
public class HomeController {
	
	@Autowired
	private WorksService worksService;
	//private WorksMapper worksMapper;
	
	
	@RequestMapping(method=GET)
	public String home(Model model) {
		List<Works> list = worksService.selectByExample(null);
		System.out.println(list.size());
		model.addAttribute(list);
		return "fakeSmith";
	}
}
