package org.union.dao;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.CommunityVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.CommunityDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class CommunityDAOTester {

	
	@Autowired
	CommunityDAO dao;
	
	CommunityVO vo;
	SearchCriteria svo;
	
	@Before
	public void setUp() throws Exception {
		vo = new CommunityVO();
		svo = new SearchCriteria();
	}


	@Test
	public void testCreate() {
		
		
		
		vo.setCommunity_name("새로운" + "디씨");
		vo.setCommunity_title("강철비 본사람");
		vo.setCommunity_content("강철비 ~~~~~~~~~~~~~~~~");
		vo.setCommunity_writer("익명134");
		vo.setCommunity_writer_IP("102.168.0.1");
		vo.setKeyword("강철비");
		vo.setUrl("url");
		vo.setTextType("호감");
		
		dao.create(vo);
		
	}
	
	
	@Test
	public void testRead() {
		
		dao.read(3);
	}
	
	@Test
	public void testUpdate() {
		
		vo.setCommunity_name("100100100디씨");
		/*vo.setCommunity_title("u강철비 본사람");
		vo.setCommunity_content("u강철비 ~~~~~~~~~~~~~~~~");
		vo.setCommunity_writer("u익명134");
		vo.setCommunity_writer_IP("u102.168.0.1");
		vo.setWriteDate(new Date());
		vo.setKeyword("uu강철비");
		vo.setKeyword_type(2);
		vo.setUrl("uuurl");*/
		vo.setCommunity_idx(100);
		
		dao.update(vo);
	}
	
	
	@Test
	public void testDelete() {
		
		dao.delete(1);
	}
	
	
	@Test
	public void testListExtract() {
		
		svo.setPage(2);
		svo.setPerPageNum(30);
		svo.setSelectKey("강철비");
		svo.setStartDate("2017-11-05 00:00:00");
		
		dao.listExtract(svo);
	}
	
	
	@Test
	public void testGetExtractCount() {
		svo.setPage(2);
		svo.setPerPageNum(30);
		
		dao.getExtractCount(svo);
	}
	
	
	@Test
	public void testListSearch() {
		
		svo.setKeyword("title");
		
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
