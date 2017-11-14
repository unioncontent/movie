package org.union.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.union.domain.GraphVO;
import org.union.domain.PageMaker;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.service.KeywordService;
import org.union.service.SNSService;
import org.union.service.UserService;

@Controller
@RequestMapping("/sns/*")
public class SNSController {

	
	@Autowired
	private SNSService service;
	
	@Autowired
	private KeywordService keywordService;
	
	@Autowired
	private UserService userService;
	
	private static Logger logger = LoggerFactory.getLogger(SNSController.class);
	
	
	@GetMapping("/facebook")
	public void facebookGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("facebookGET called....");
		
		logger.info("before Cri: " + cri);
		
		if(cri.getKeyword() != null) {
			if(cri.getKeyword().isEmpty()) {
				cri.setKeyword(null);
			}
		}
		if(cri.getSelectKey() != null) {
			if(cri.getSelectKey().isEmpty() || cri.getSelectKey().equals("키워드")) {
				cri.setSelectKey(null);
			}
		}
		if(cri.getCompany() != null) {
			if(cri.getCompany().isEmpty()) {
				cri.setCompany(null);
			}
		}
		if(cri.getCompany() == null || cri.getCompany().equals("회사")) {
			logger.info(SecurityContextHolder.getContext().getAuthentication().getName().toString());
			UserVO vo = userService.viewById(SecurityContextHolder.getContext().getAuthentication().getName());
			
			if(!vo.getUser_name().equals("union")) {
			cri.setCompany(vo.getUser_name());
			
			}else {
				cri.setCompany(null);
			}
		}
		if(cri.getTextType() != null) {
			cri.setTextType(null);
		}
		if(cri.getStartDate() != null || cri.getEndDate() != null) {
			cri.setStartDate(null);
			cri.setEndDate(null);
		}
		
		logger.info("cri : " + cri);
		
		// 회사 선택에 따른 키워드 재추출
		if(cri.getCompany() != null) {
			if(cri.getCompany().isEmpty() == false) {
					
				UserVO userVO  = userService.viewByName(cri.getCompany());
				logger.info("userVO: " + userVO);
					logger.info("keywordList: " + keywordService.listByUser(userVO.getUser_idx()));
					model.addAttribute("modelKeywordList", keywordService.listByUser(
					userService.viewByName(cri.getCompany()).getUser_idx()));
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.facebookTotalCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		logger.info("pageMaker: " + pageMaker);
		
		List<SNSVO> list = new ArrayList<SNSVO>();
		list = service.facebookList(cri);
		model.addAttribute("facebookList", list);
		
		
	}
	
	@GetMapping("/instagram")
	public void instagramGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("instagramGET called....");
		
		if(cri.getSelectKey() != null) {
			if(cri.getSelectKey().equals("키워드")) {
				cri.setSelectKey(null);
			}
		}
		
		logger.info("cri : " + cri);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.instaTotalCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		logger.info("pageMaker: " + pageMaker);
		
		List<SNSVO> list = new ArrayList<SNSVO>();
		list = service.instaList(cri);
		model.addAttribute("instagramList", list);
		
	}
	
	
	@GetMapping("/twitter")
	public void twitterGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("twitterGET called....");
		
		if(cri.getSelectKey() != null) {
			if(cri.getSelectKey().equals("키워드")) {
				cri.setSelectKey(null);
			}
		}
		
		logger.info("cri : " + cri);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.twitterTotalCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		logger.info("pageMaker: " + pageMaker);
		
		List<SNSVO> list = new ArrayList<SNSVO>();
		list = service.twitterList(cri);
		model.addAttribute("twitterList", list);
		
	}
	
	
	@PostMapping("/graph")
	@ResponseBody
	public List<GraphVO> graphPOST(String startDate, String endDate) throws Exception{
		//logger.info("grpahPOST called....");
		
		/*Date transStart = new SimpleDateFormat("yyyy-mm-dd").parse(startDate);
		Date transEnd = new SimpleDateFormat("yyyy-mm-dd").parse(endDate);
		
		
		long gapDays = (transEnd.getTime() - transStart.getTime()) / (24 * 60 * 60 * 1000);
		logger.info("gap: " + gapDays);*/
		
		GraphVO vo = new GraphVO();
		vo.setStartDate(startDate + " 00:00:00");
		vo.setEndDate(endDate + " 23:59:59");
		vo.setSns_name("facebook");
		//logger.info("GRAPHVO: " +vo);
		
		
		List<SNSVO> list= service.getDateCount(vo);
		//logger.info("list: " + list);

		List<GraphVO> graphList = new ArrayList<GraphVO>();
		
		int like =0;
		int share =0;
		int reply =0;
		
		GraphVO graphData = new GraphVO();
		for(int i = 0; i < list.size(); i++) {
			
			// equlas
			if((startDate.equals(list.get(i).getWriteDate()))) {
				graphData.setWriteDate(startDate);
				like = like + list.get(i).getLike_cnt();
				share =share + list.get(i).getShare_cnt();
				reply =reply + list.get(i).getReply_cnt();
				
			}else {
				graphData.setLikeCount(like);
				graphData.setShareCount(share);
				graphData.setReplyCount(reply);
				
				// 데이터 부족할 때
				if(graphData.getWriteDate() != null) {
					graphList.add(graphData);
				}
				
				graphData = new GraphVO();
				
				like = 0;
				share = 0;
				reply = 0;
				
				startDate = list.get(i).getWriteDate();
			}
			
			// 마지막 날짜
			if(i == list.size()-1) {
				
				graphData.setLikeCount(like);
				graphData.setShareCount(share);
				graphData.setReplyCount(reply);
				
				graphList.add(graphData);
			}
			
		}// end for
		
		//logger.info("graphList: " + graphList);
		
		return graphList;
		
	}
	
}
