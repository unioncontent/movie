package org.union.service;

import java.util.List;

import org.union.domain.CalendarVO;

public interface CalendarService {

	
	public void insert(CalendarVO vo);
	
	public void remove(String title);
	
	public List<CalendarVO> listDate();
}
