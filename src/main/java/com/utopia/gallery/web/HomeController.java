package com.utopia.gallery.web;

import static org.springframework.web.bind.annotation.RequestMethod.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.utopia.gallery.common.PageInfo;
import com.utopia.gallery.common.PagingUtil;
import com.utopia.gallery.model.Works;
import com.utopia.gallery.model.WorksExample;
import com.utopia.gallery.persistence.WorksMapper;
import com.utopia.gallery.service.WorksService;


@Controller
@RequestMapping({"/","/homepage"})
public class HomeController {
	
	@Autowired
	private WorksService worksService;
	//private WorksMapper worksMapper;
	
	
	@RequestMapping(method=GET)
	public String home(Model model,PageInfo pageInfo) {
		
		if(pageInfo.getPageNum() == 0){
			pageInfo.setPageNum(1);
		}
		System.out.println("page:"+pageInfo.getPageNum());
		WorksExample example = new WorksExample();
		example.setOrderByClause(" createDatetime desc ");
		List<Works> originalList = worksService.selectByExample(example);
		List<Works> list = PagingUtil.paging(originalList, pageInfo);
		model.addAttribute(list);
		model.addAttribute("pageNum", pageInfo.getPageNum());
		model.addAttribute("total", pageInfo.getTotal());
		return "fakeSmith";
	}
}
