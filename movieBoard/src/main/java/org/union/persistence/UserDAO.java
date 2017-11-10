package org.union.persistence;

import org.union.domain.UserVO;

public interface UserDAO {

	
	public void create(UserVO vo);
	
	public UserVO read(Integer user_idx);
	
	public void update(UserVO vo);
	
	public void delete(Integer user_idx);
	
	public UserVO readById(String user_id);
	
	public UserVO login(UserVO vo);
	
	
	
}
