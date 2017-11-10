package org.union.service;

import org.union.domain.UserVO;

public interface UserService {

	
	public UserVO view(Integer user_idx);
	
	public UserVO login(UserVO vo);
	
	public UserVO viewById(String user_id);
}
