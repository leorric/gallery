package com.utopia.gallery.common;

import java.util.ArrayList;
import java.util.List;

import com.utopia.gallery.model.Works;

public class PagingUtil {
	
	public static List<Works> paging(List<Works> list,PageInfo pageInfo) {
		int pageNum = pageInfo.getPageNum();
		int pageSize = pageInfo.getPageSize();
		int total = list.size() % pageSize == 0 ? list.size()/pageSize:list.size()/pageSize+1;
		pageInfo.setTotal(total);
		int start = pageSize * (pageNum-1);
		int end = pageSize * pageNum - 1;
		List<Works> postProcessList = new ArrayList<Works>();
		if(start >= list.size()) {
			return postProcessList;
		}
		if(end > list.size()-1) {
			end = list.size()-1;
		}
		for(int i=start;i<=end;i++) {
			postProcessList.add(list.get(i));
		}
		return postProcessList;
	}
}
