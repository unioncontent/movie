package org.union.persistence;

import org.union.domain.SNSVO;

public interface SNSDAO {

	
	public void create(SNSVO vo);
	
	public void read(Integer SNS_idx);
	
	public void update(SNSVO vo);
	
	public void delete(Integer SNS_idx);
	
}
