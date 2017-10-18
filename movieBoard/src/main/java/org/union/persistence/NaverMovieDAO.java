package org.union.persistence;

import org.union.domain.NaverMovieVO;

public interface NaverMovieDAO {

	
	public void create(NaverMovieVO vo);
	
	public void read(Integer NM_idx);
	
	public void update(NaverMovieVO vo);
	
	public void delete(Integer NM_idx);
}
