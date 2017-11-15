package org.union.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.service.KeywordService;
import org.union.service.SNSService;
import org.union.service.UserService;

@Controller
@RequestMapping("/period/*")
public class PeriodController {

	private static Logger logger = LoggerFactory.getLogger(PeriodController.class);

	/*@Autowired
	private MediaService mediaService;*/

	@Autowired
	private SNSService snsService;

	@Autowired
	private KeywordService keywordService;

	@Autowired
	private UserService userService;

	@GetMapping("/main")
	public void mainGET() {
		logger.info("mainGET called....");
	}

	@GetMapping("/community")
	public void communityGET() {
		logger.info("communityGET called....");
	}

	@GetMapping("/portal")
	public void portalGET() {
		logger.info("portalGET called....");

	}

	@GetMapping("/media")
	public void mediaGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		/*
		 * logger.info("mediaGET called...."); List<PeriodMediaVO> mediaList =
		 * mediaService.periodMedia(cri); List<PeriodMediaVO> reporterList =
		 * mediaService.periodReporter(cri); logger.info("1"); // 정렬 PeriodComparator
		 * comparator = new PeriodComparator(); Collections.sort(mediaList, comparator);
		 * Collections.sort(reporterList, comparator); logger.info("2");
		 * model.addAttribute("mediaCount", mediaList.size());
		 * model.addAttribute("pressCount", reporterList.size());
		 * model.addAttribute("totalCount", mediaService.getTotalCount());
		 * logger.info("3"); mediaList = mediaList.subList(0, 20); reporterList =
		 * reporterList.subList(0, 20); logger.info("4");
		 * model.addAttribute("pressList", reporterList);
		 * model.addAttribute("mediaList", mediaList); logger.info("5");
		 */
	}

	@GetMapping("/sns")
	public void snsGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("snsGET called....");
		
		cri.setKeyword(null);
		cri.setTextType(null);
		
		if(cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey()) ) {
			logger.info("selectKey is null");
			cri.setSelectKey(null);
		}
		if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
				|| cri.getStartDate() == "" || cri.getEndDate() == ""){
			cri.setStartDate(null);
			cri.setEndDate(null);
		
		} 
		if(cri.getStartDate() != null && cri.getEndDate() != null) {
			if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
				cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
				cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
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

		// 회사 선택에 따른 키워드 재추출
		if (cri.getCompany() != null) {
			if (cri.getCompany().isEmpty() == false) {

				UserVO userVO = userService.viewByName(cri.getCompany());
				logger.info("userVO: " + userVO);
				logger.info("keywordList: " + keywordService.listByUser(userVO.getUser_idx()));
				model.addAttribute("modelKeywordList",
						keywordService.listByUser(userService.viewByName(cri.getCompany()).getUser_idx()));
			}
		}
		
		logger.info("cri: " + cri);
		
		
		model.addAttribute("facebookCount",snsService.facebookTotalCount(cri));
		model.addAttribute("instagramCount", snsService.instaTotalCount(cri));
		model.addAttribute("twitterCount", snsService.twitterTotalCount(cri));
		
		model.addAttribute("snsList", snsService.listSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(snsService.getSearchCount(cri));
		
		logger.info("pageMaker: " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	@PostMapping("/graph")
	@ResponseBody
	public void graphPOST(String startDate, String endDate) throws Exception{
		logger.info("grpahPOST called....");
		
		startDate = startDate + " 00:00:00";
		endDate = endDate + " 23:59:59";
		
		SearchCriteria cri = new SearchCriteria();
		List<GraphVO> list = new ArrayList<GraphVO>();
		
		SimpleDateFormat standFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date transStart = standFormat.parse(startDate);
		Date transEnd = standFormat.parse(endDate);
		

		while((transEnd.getTime() - transStart.getTime()) / (24 * 60 * 60 * 1000) == 0) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(transStart);
			
			standFormat.format(cal.getTime());
			
			snsService.facebookTotalCount(cri);
			snsService.instaTotalCount(cri);
			snsService.twitterTotalCount(cri);
		}
		
		
		


		
		
	
		
	}
	
}
