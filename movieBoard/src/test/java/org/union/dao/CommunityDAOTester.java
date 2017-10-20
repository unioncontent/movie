package org.union.dao;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.CommunityVO;
import org.union.domain.SearchVO;
import org.union.persistence.CommunityDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class CommunityDAOTester {

	
	@Autowired
	CommunityDAO dao;
	
	CommunityVO vo;
	SearchVO svo;
	
	@Before
	public void setUp() throws Exception {
		vo = new CommunityVO();
		svo = new SearchVO();
	}


	@Test
	public void testCreate() {
		
		for(int i = 0; i < 100; i++) {
		
		vo.setCommunity_name(i+1 + "디씨");
		vo.setCommunity_title("강철비 본사람");
		vo.setCommunity_content("강철비 ~~~~~~~~~~~~~~~~");
		vo.setCommunity_writer("익명134");
		vo.setCommunity_writer_IP("102.168.0.1");
		vo.setWriteDate(new Date());
		vo.setKeyword("강철비");
		vo.setKeyword_type(2);
		vo.setUrl("url");
		vo.setTextType("호감");
		
		dao.create(vo);
		}
	}
	
	
	@Test
	public void testRead() {
		
		dao.read(3);
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
	
	
	@Test
	public void testListSearch() {
		
		svo.setKeyword("12");
		
		dao.listSearch(svo);
	}
	
	
	@Test
	public void testUpdateTextType() {
		
		vo.setCommunity_idx(3);
		vo.setTextType("호감");
		
		dao.updateTextType(vo);
	}
	
	
	@Test
	public void testUpdateThumbnail() {
		
		vo.setCommunity_idx(3);
		vo.setThumbnail("1234132131231TESTTEST");
		
		dao.updateThumbnail(vo);
	}
}
