package org.union.dao;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.Criteria;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.SNSDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class SNSDAOTester {

	
	@Autowired
	SNSDAO dao;
	
	SNSVO vo;
	SearchCriteria cri;
	
	
	@Before
	public void setUp() throws Exception {
		vo = new SNSVO();
		cri = new SearchCriteria();
	}

	
	@Test
	public void testCreate() {
		
		for(int i = 0; i < 50; i++) {
		vo.setSns_name(i + "name");
		vo.setSns_title(i + "범죄도시");
		vo.setSns_content(i + "content");
		vo.setSns_writer(i + "writer");
		vo.setLike_cnt(5);
		vo.setReply_cnt(3);
		vo.setShare_cnt(8);
		vo.setWriteDate(new Date());
		vo.setKeyword(i + "범죄도시");
		vo.setKeyword_type(1);
		vo.setUrl("url");
		vo.setTextType("호감");
		dao.create(vo);
		}
	}

	
	@Test
	public void testRead() {
		
		dao.read(1);
	}
	
	@Test
	public void testUpdate() {
		
		vo.setSns_name("UUUUUUUUUname");
		vo.setSns_title("title");
		vo.setSns_content("content");
		vo.setSns_writer("writer");
		vo.setLike_cnt(5);
		vo.setReply_cnt(3);
		vo.setShare_cnt(8);
		vo.setWriteDate(new Date());
		vo.setKeyword("강철비");
		vo.setKeyword_type(1);
		vo.setUrl("url");
		vo.setSns_idx(1);
		
		dao.update(vo);
	}
	
	
	@Test
	public void testDelete() {
		
		dao.delete(1);
		
	}
	
	
	@Test
	public void listSearch() {
		
		cri.setPage(2);
		cri.setSearchType("t");
		cri.setKeyword("범죄도시");

		System.out.println(dao.listSearch(cri));
		System.out.println(cri);
		System.out.println(cri.getPage());
		System.out.println(cri.getStartPage());
		System.out.println(cri.getPageUnit());
	}
}
