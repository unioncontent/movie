package org.union.dao;

import java.text.ParseException;
import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.MediaVO;
import org.union.persistence.MediaDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class MediaDAOTester {

	
	@Autowired
	MediaDAO dao;
	
	MediaVO vo;
	
	@Before
	public void setUp() throws Exception {
		vo = new MediaVO();
	}

	
	@Test
	public void testCreate() throws ParseException {
		
		vo.setMedia_name("유니온스포츠");
		vo.setMedia_title("강철비 흥행하나 기사");
		vo.setMedia_content("강철비가 ~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		vo.setReporter_name("김동진");
		vo.setKeyword("강철비");
		vo.setUrl("urlurlurlurlurlurlurlurlurl");
		
		dao.create(vo);
	}
	
	
	@Test
	public void testRead() {
		
		dao.read(1);
	}
	
	
	@Test
	public void testUpdate() {
		
		vo.setMedia_name("유uuuu니온스포츠");
		vo.setMedia_title("강철비 흥행하나 기사");
		vo.setMedia_content("강철비가 ~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		vo.setReporter_name("김동진");
		vo.setKeyword("강철비");
		vo.setUrl("urlurlurlurlurlurlurlurlurl");
		vo.setMedia_idx(1);
		
		dao.update(vo);
	}

	
	@Test
	public void testDelete() {
		
		dao.delete(1);
	}
}
