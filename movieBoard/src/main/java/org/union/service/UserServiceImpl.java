package org.union.service;

import java.util.List;

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

	@Override
	public UserVO view(Integer user_idx) {

		return userDAO.read(user_idx);
	}

	@Override
	public List<UserVO> listAll() {

		return userDAO.listAll();
	}

	@Override
	public UserVO viewByName(String user_name) {

		return userDAO.readByName(user_name);
	}

	@Override
	public void insert(UserVO vo) {

		try {
			userDAO.create(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
