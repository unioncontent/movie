package org.union.dao;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.CommunityVO;
import org.union.persistence.CommunityDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class CommunityDAOTester {

	
	@Autowired
	CommunityDAO dao;
	
	CommunityVO vo;
	
	@Before
	public void setUp() throws Exception {
		vo = new CommunityVO();
	}


	@Test
	public void testCreate() {
		
		vo.setCommunity_name("디씨");
		vo.setCommunity_title("강철비 본사람");
		vo.setCommunity_content("강철비 ~~~~~~~~~~~~~~~~");
		vo.setCommunity_writer("익명134");
		vo.setCommunity_writer_IP("102.168.0.1");
		vo.setWriteDate(new Date());
		vo.setKeyword("강철비");
		vo.setKeyword_type(2);
		vo.setUrl("url");
		
		dao.create(vo);
	}
	
	
	@Test
	public void testRead() {
		
		dao.read(1);
	}
	
	@Test
	public void testUpdate() {
		
		vo.setCommunity_name("u디씨");
		vo.setCommunity_title("u강철비 본사람");
		vo.setCommunity_content("u강철비 ~~~~~~~~~~~~~~~~");
		vo.setCommunity_writer("u익명134");
		vo.setCommunity_writer_IP("u102.168.0.1");
		vo.setWriteDate(new Date());
		vo.setKeyword("uu강철비");
		vo.setKeyword_type(2);
		vo.setUrl("uuurl");
		vo.setCommunity_idx(1);
		
		dao.update(vo);
	}
	
	
	@Test
	public void testDelete() {
		
		dao.delete(1);
	}
}
