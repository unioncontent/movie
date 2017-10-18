package org.union.dao;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.BiralVO;
import org.union.persistence.BiralDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BiralDAOTester {


	@Autowired
	BiralDAO dao;
	
	
	BiralVO vo;
	
	@Before
	public void setUp() {
		vo = new BiralVO();
	}
	
	@Test
	public void testCreate() throws Exception{
		
		vo.setUser_idx(3);
		vo.setBiral_title("강철비 흥행2");
		vo.setBiral_rank(2);
		vo.setBiral_isUser(2);
		vo.setKeyword("강철비2");	
		vo.setUrl("url2");
		vo.setWriteDate(new Date());
		
		dao.create(vo);
	
	}
	
	
	@Test
	public void testRead()throws Exception{
		
		dao.read(2);
	}


	@Test
	public void testUpdate() throws Exception{

		vo.setBiral_idx(3);
		vo.setUser_idx(5);
		vo.setBiral_title("u강철비 흥행");
		vo.setBiral_rank(20);
		vo.setKeyword("u강철비");	
		vo.setUrl("uurl");
		vo.setWriteDate(new Date());
		
		dao.update(vo);
	}
	
	
	@Test
	public void testDelete() throws Exception{
		
		dao.delete(2);
	}
}
