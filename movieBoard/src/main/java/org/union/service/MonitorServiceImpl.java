package org.union.service;

import java.util.List;

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


	@Override
	public List<MonitorVO> pageAll() {

		List<MonitorVO> list = monitorDAO.pageAll();
		
		for (MonitorVO monitorVO : list) {
			
			MonitorVO vo = monitorDAO.checkLast(monitorVO.getMonitor_domain());
		
			if(vo != null) {
				monitorVO.setCheckCondition(true);
				monitorVO.setTitle(vo.getTitle());
				monitorVO.setUrl(vo.getUrl());
				monitorVO.setCreateDate(vo.getCreateDate());
				
			}else {
				monitorVO.setCheckCondition(false);
			}
		}
		
		return list;
	}

}