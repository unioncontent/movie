package org.union.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.UserVO;
import org.union.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVO login(UserVO vo) {

		return userDAO.login(vo);
	}

	@Override
	public UserVO viewById(String user_id) {

		return userDAO.readById(user_id);
	}
}
