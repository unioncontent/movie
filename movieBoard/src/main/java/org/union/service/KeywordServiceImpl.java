package org.union.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.persistence.KeywordDAO;

@Service
public class KeywordServiceImpl implements KeywordService{

	
	@Autowired
	private KeywordDAO keywordDAO;
	
	@Override
	public List<String> listByUser(Integer user_idx) {

		return keywordDAO.listByUser(user_idx);
	}

}
