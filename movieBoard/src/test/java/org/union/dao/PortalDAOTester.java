package org.union.dao;


import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.PortalVO;
import org.union.persistence.PortalDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class PortalDAOTester {

	
	@Autowired
	PortalDAO dao;
	
	PortalVO vo;
	
	@Before
	public void setUp() throws Exception {
		vo = new PortalVO();
	}

	
	@Test
	public void testCreate() {
		
		vo.setPortal_type("카페");
		vo.setPortal_name("네이버");
		vo.setPortal_title("title");
		vo.setDeviceType(1);
		vo.setWriteDate(new Date());
		vo.setKeyword("keyword");
		vo.setKeyword_type(1);
		vo.setUrl("url");
	
		dao.create(vo);
	}

	
	@Test
	public void testRead() {
		
		dao.read(1);
	}
	
	
	@Test
	public void testUpdate() {
		
		vo.setPortal_type("카페");
		vo.setPortal_name("네이버");
		vo.setPortal_title("uuuuuuutitle");
		vo.setDeviceType(1);
		vo.setWriteDate(new Date());
		vo.setKeyword("keyword");
		vo.setKeyword_type(1);
		vo.setUrl("url");
		vo.setPortal_idx(1);
		
		dao.update(vo);
	}
	
	
	@Test
	public void testDelete() {
		
		dao.delete(1);
	}
}
