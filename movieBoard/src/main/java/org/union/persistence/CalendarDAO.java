package org.union.persistence;

import java.util.List;

import org.union.domain.CalendarVO;

public interface CalendarDAO {

	
	public void create(CalendarVO vo);
	
	public void delete(String title);
	
	public List<CalendarVO> listDate();
}
