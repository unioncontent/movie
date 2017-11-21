package org.union.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.persistence.RelationDAO;

@Service
public class RelationServiceImpl implements RelationService {

	
	@Autowired
	private RelationDAO relationDAO;
	
	@Override
	public Integer todayCount() {

		return relationDAO.todayCount();
	}

}
