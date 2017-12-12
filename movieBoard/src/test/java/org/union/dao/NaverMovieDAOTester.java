package org.union.dao;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.NaverMovieVO;
import org.union.persistence.NaverMovieDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class NaverMovieDAOTester {

	
	@Autowired
	NaverMovieDAO dao;
	
	NaverMovieVO vo;
	
	
	@Before
	public void setUp() throws Exception {
		vo = new NaverMovieVO();
	}

	@Test
	public void testCreate() {

		vo.setNM_title("네이버타이틀");
		vo.setNM_media_name("네이버네임");
		vo.setNM_reporter_name("기자이름");
		vo.setKeyword("키워드");
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
		
		vo.setNM_title("업뎃업뎃네이버타이틀");
		vo.setNM_media_name("네이버네임");
		vo.setNM_reporter_name("기자이름");
		vo.setKeyword("키워드");
		vo.setKeyword_type(2);
		vo.setUrl("url");
		vo.setNM_idx(1);
		
		dao.update(vo);
	}
	
	
	@Test
	public void testDelete() {
		
		dao.delete(1);
	}
}
