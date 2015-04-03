package com.utopia.gallery.web;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.utopia.gallery.model.Works;
import com.utopia.gallery.service.WorksService;

@Controller
@RequestMapping("/works")
public class WorksController {
	
	@Autowired
	private WorksService worksService;

	@RequestMapping(value="/listWorks",method=POST)
	public @ResponseBody Object listWorks() {
		List<Works> list = worksService.selectByExample(null);
		System.out.println(list.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("page", 1);
		map.put("list", list);
		
//		Works w = list.get(0);
//		WorksJson wj = new WorksJson();
//		wj.setImageurl(w.getImageurl());
//		wj.setTitle(w.getTitle());
//		wj.setDescription(w.getDescription());
//		List<WorksJson> list2 = new ArrayList<WorksJson>();
//		map.put("list", list2);
		//JSONArray jsonArray = JSONArray.fromObject(list);
		JSONObject jsonObj = JSONObject.fromObject(map);
		//System.out.println("json:"+jsonObj);
		return jsonObj;
	}
	
	@RequestMapping(value="/editWorks",method=POST)
	public @ResponseBody Object editWorks(@RequestBody Works works) {
		System.out.println("edit works:");
		return listWorks();
	}
}
