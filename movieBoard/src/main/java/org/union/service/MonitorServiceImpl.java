package org.union.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.MonitorVO;
import org.union.persistence.MonitorDAO;

@Service
public class MonitorServiceImpl implements MonitorService {

	
	@Autowired
	private MonitorDAO monitorDAO;
	
	
	@Override
	public void insert(MonitorVO vo) {

		monitorDAO.create(vo);
	}

}
