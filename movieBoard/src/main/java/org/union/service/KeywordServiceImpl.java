package org.union.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.ExtractVO;
import org.union.domain.KeywordVO;
import org.union.domain.UserVO;
import org.union.persistence.KeywordDAO;
import org.union.persistence.UserDAO;

@Service
public class KeywordServiceImpl implements KeywordService{

	
	@Autowired
	private KeywordDAO keywordDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List<String> listByUser(Integer user_idx) {

		return keywordDAO.listByUser(user_idx);
	}

	@Override
	public List<ExtractVO> viewByKeyword(List<ExtractVO> list) {
		
		for(int i = 0; i < list.size(); i++) {

			KeywordVO keywordVO = keywordDAO.readByKeyword(list.get(i).getKeyword());
			
			UserVO userVO = userDAO.read(keywordVO.getUser_idx());

			list.get(i).setCompany(userVO.getUser_name());
		}

		return list;
	}

}
