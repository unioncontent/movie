package org.union.service;

import java.util.List;

import org.union.domain.UserVO;

public interface UserService {

	
	public void insert(UserVO vo);
	
	public UserVO view(Integer user_idx);
	
	public UserVO login(UserVO vo);
	
	public UserVO viewById(String user_id);
	
	public UserVO viewByName(String user_name);
	
	public List<UserVO> listAll();
}
