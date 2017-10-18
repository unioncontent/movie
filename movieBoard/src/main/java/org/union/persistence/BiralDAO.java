package org.union.persistence;

import org.union.domain.BiralVO;

public interface BiralDAO {

	
	public void create(BiralVO vo);
	
	public void read(Integer biral_idx);
	
	public void update(BiralVO vo);
	
	public void delete(Integer biral_idx);
	
}
