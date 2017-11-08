package org.union.util;

import java.util.List;

import org.union.domain.ExtractVO;

public class ListUtil {

	
	public List<ExtractVO> listAddList(List<ExtractVO> list, List<ExtractVO> addList){
		
		for(int i = 0; i < addList.size(); i++) {
			list.add(addList.get(i));
		}
		
		return list;
	}
}
