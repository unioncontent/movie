package org.union.persistence;

import org.union.domain.MediaVO;

public interface MediaDAO {

	
	public void create(MediaVO vo);
	
	public void read(Integer media_idx);
	
	public void update(MediaVO vo);
	
	public void delete(Integer media_idx);
}
