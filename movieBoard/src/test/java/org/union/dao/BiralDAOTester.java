package org.union.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.union.domain.BiralVO;
import org.union.domain.GraphVO;
import org.union.domain.SearchCriteria;
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
		
		dao.read(3);
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
	
	@Test
	public void testTest() throws ParseException {
		String startDate = "2017-11-18" + " 00:00:00";
		String endDate = "2017-11-18" + " 23:59:59";
		
		SearchCriteria cri = new SearchCriteria();
		List<GraphVO> list = new ArrayList<GraphVO>();
		
		SimpleDateFormat standFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date transStart = standFormat.parse(startDate);
		Date transEnd = standFormat.parse(endDate);
		
		Calendar cal = Calendar.getInstance();

		cal.setTime(transStart);
		cal.add(Calendar.DATE, +1);
		
		System.out.println(standFormat.format(cal.getTime()));
		
		long gapDays = (transEnd.getTime() - transStart.getTime()) / (24 * 60 * 60 * 1000);
		System.out.println(gapDays);
	}
}
