package com.utopia.gallery.web;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.utopia.gallery.model.Works;
import com.utopia.gallery.model.WorksJson;
import com.utopia.gallery.service.WorksService;
import com.utopia.gallery.utils.Consts;

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

		JSONObject jsonObj = JSONObject.fromObject(map);
		//System.out.println("json:"+jsonObj);
		return jsonObj;
	}
	
	
	//这里参数用WorksJson，主要是因为：添加时传进来的id参数，值非数字，而是一串字符，无法转型为int，因此用WorksJson接收。
	@RequestMapping(value="/editWorks",method=POST)
	public @ResponseBody Object editWorks(WorksJson worksJson,
			@RequestParam("oper") String oper) {
 
		Works works = new Works();
		works.setTitle(worksJson.getTitle());
		works.setDescription(worksJson.getDescription());
		works.setImageurl(worksJson.getImageurl());
		int id = 0;
		try {
			id = Integer.parseInt(worksJson.getId());
		}catch(Exception e){
			;
		}
		if(Consts.ADD.equals(oper)) {
			worksService.insertSelective(works);
		} else if(Consts.EDIT.equals(oper)) {
			works.setId(id);
			worksService.updateByPrimaryKeySelective(works);
		} else {
			worksService.deleteByPrimaryKey(id);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		JSONObject jsonObj = JSONObject.fromObject(map);
		return jsonObj;
	}
	
	@RequestMapping(value="/upload",method=POST)
	public @ResponseBody Object upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ServletInputStream in = request.getInputStream();
		byte[] buf = new byte[4048];
		
		String id = "";
		String filename = "";
		int len = in.readLine(buf, 0, buf.length);
		while ((len = in.readLine(buf, 0, buf.length)) != -1) {
			String filevalue = new String(buf, 0, len);
			int j = filevalue.lastIndexOf("[id]=");
			int k=filevalue.indexOf("\r\n");
			
			if (j!=-1) {
				id=filevalue.substring(j+5,k);
				System.out.println("id:"+id);
			}
			int findex = filevalue.indexOf("filename");
			//System.out.println("line:"+filevalue);
		    if(findex != -1) {
		    	
		    	filename = filevalue.substring(findex+10);
		    	filename = filename.replaceAll("\"", "");
		    	filename = filename.replaceAll("\r\n", "");
		    	System.out.println(filename);
		    	break;
		    }
			
		}
		
		String filepath=request.getSession().getServletContext().getRealPath("upload/");
		//String filepath = this.getServletContext().getRealPath("")+java.io.File.separator+"picture"+java.io.File.separator+id+java.io.File.separator;

		
		

		//filename = "east.jpg";
		System.out.println(filename);
		byte[] backup = new byte[4048];
		int times = 0;
		try {
			File file=new File(filepath);
			if (!file.exists()) {
				file.mkdirs();
			}
			DataOutputStream fileStream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(filepath+ File.separator+filename)));
			
			boolean i=false;
			boolean end = false;
			boolean isFirst = true;
			int mark = 0;
			while ((len = in.readLine(buf, 0, buf.length)) != -1) {
				String filevalue = new String(buf, 0, len);
				
			    int j = filevalue.lastIndexOf("Content-Type");
			    end = filevalue.endsWith("--\r\n");
			   System.out.println("read:"+filevalue);
			   //System.out.println("backup:"+new String(backup));
			    
			    if (j!=-1) {
					i=true;
					continue;
				}else if("\r\n".equals(filevalue)) {
					//System.out.println("空");
					continue;
					
				}
			    
			    if(end) {
			    	//System.out.println("last:"+filevalue);
			    	if(times > 1) {
			    		//System.out.println("line2:"+new String(backup,0,mark)+"|");
			    		fileStream.write(backup, 0, mark-2);
			    	}
			    	break;
			    }else {
			    	if(times > 1){
			    		//System.out.println("line:"+new String(backup,0,mark));
			    		fileStream.write(backup, 0, mark);
			    	}
			    }
			    //System.arraycopy(buf, 0, backup, 0, len);
			    for(int m=0;m<backup.length;m++){
			    	backup[m] = 0;
			    }
			    for(int k=0;k<len;k++) {
			    	backup[k] = buf[k];
			    }
			    mark = len;
			    times++;
			    isFirst = false;
			}
			fileStream.flush();
			fileStream.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		in.close();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		JSONObject jsonObj = JSONObject.fromObject(map);
		return jsonObj;
	}
}
