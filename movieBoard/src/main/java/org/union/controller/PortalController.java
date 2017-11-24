package org.union.controller;

import java.text.ParseException;
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
import org.union.domain.NaverMovieVO;
import org.union.domain.PageMaker;
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.service.EtService;
import org.union.service.KeywordService;
import org.union.service.NaverMovieService;
import org.union.service.PortalService;
import org.union.service.UserService;

@Controller
@RequestMapping("/portal/*")
public class PortalController {

	@Autowired
	private PortalService portalService;

	@Autowired
	private NaverMovieService naverMovieService;

	@Autowired
	private EtService etService;

	@Autowired
	private UserService userService;

	@Autowired
	private KeywordService keywordService;

	private static Logger logger = LoggerFactory.getLogger(PortalController.class);

	@GetMapping("/naver")
	public void naverGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws ParseException {
		logger.info("naverGET called....");

		if (cri.getKeyword() == "" || "undefined".equals(cri.getKeyword())) {
			logger.info("keyword is null");
			cri.setKeyword(null);

		}
		if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
			logger.info("selectKey is null");
			cri.setSelectKey(null);
		}

		if ("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate()) || cri.getStartDate() == ""
				|| cri.getEndDate() == "") {
			cri.setStartDate(null);
			cri.setEndDate(null);

		}
		if (cri.getStartDate() != null && cri.getEndDate() != null) {
			if (cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0) {
				cri.setStartDate(cri.getStartDate() + " 00:00:00");
				cri.setEndDate(cri.getEndDate() + " 23:59:59");
			}
		}
		if (cri.getCompany() != null) {
			if (cri.getCompany().isEmpty()) {
				cri.setCompany(null);
			}
		}
		if (cri.getTextType() != null) {
			if (cri.getTextType().equals("undefined") || cri.getTextType().equals("분류")
					|| cri.getTextType().isEmpty()) {
				cri.setTextType(null);
			}
		}

		if (cri.getCompany() == null || cri.getCompany().equals("회사")) {
			logger.info(SecurityContextHolder.getContext().getAuthentication().getName().toString());
			UserVO vo = userService.viewById(SecurityContextHolder.getContext().getAuthentication().getName());

			if (!vo.getUser_name().equals("union")) {
				cri.setCompany(vo.getUser_name());

			} else {
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
		
		// 영화/배우 
		Integer movieCount = portalService.getTypeOfMovieCount(cri);
		Integer actorCount = portalService.getTypeOfActorCount(cri);
		
		model.addAttribute("movieCount", movieCount);
		model.addAttribute("actorCount", actorCount);
		
		// 네이버영화 리스트
		List<NaverMovieVO> movieList = naverMovieService.searchList(cri);
		Integer totalCount = naverMovieService.getSearchCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("totalCount", totalCount);
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		// 연예홈
		Integer etSearchCount1, etSearchCount2, etSearchCount3;
		Integer etTotalCount1, etTotalCount2, etTotalCount3;
		
		if(cri.getSelectKey() == null && cri.getCompany() == null) {
			
			etSearchCount1 = 0;
			etSearchCount2 = 0;
			etSearchCount3 = 0;
			
			etTotalCount1 = etService.getSearchCount1(cri);
			etTotalCount2 = etService.getSearchCount2(cri);
			etTotalCount3 = etService.getSearchCount3(cri);
			
		}else {
			
			etSearchCount1 = etService.getSearchCount1(cri);
			etSearchCount2 = etService.getSearchCount2(cri);
			etSearchCount3 = etService.getSearchCount3(cri);
			
			cri.setCompany(null);
			cri.setSelectKey(null);
			
			etTotalCount1 = etService.getSearchCount1(cri);
			etTotalCount2 = etService.getSearchCount2(cri);
			etTotalCount3 = etService.getSearchCount3(cri);
		}
		
		model.addAttribute("etSearchCount1", etSearchCount1);
		model.addAttribute("etSearchCount2", etSearchCount2);
		model.addAttribute("etSearchCount3", etSearchCount3);
		
		model.addAttribute("etTotalCount1", etTotalCount1);
		model.addAttribute("etTotalCount2", etTotalCount2);
		model.addAttribute("etTotalCount3", etTotalCount3);

	}
	
	@ResponseBody
	@PostMapping("/graph")
	public List<GraphVO> graphPOST(String startDate, String endDate, String company, String selectKey) throws ParseException {
		logger.info("graphPOST called....");
		
		if(company.equals("회사") || company.equals("undefined") || company.equals("")) {
			company = null;
		}
		if(selectKey.equals("키워드") || selectKey.equals("undefined") || selectKey.equals("")) {
			selectKey = null;
		}
		
		startDate = startDate + " 00:00:00";
		endDate = endDate + " 23:59:59";
		logger.info("startDate: " + startDate);
		logger.info("endDate: " + endDate);
		
		SearchCriteria cri = new SearchCriteria();
		cri.setSelectKey(selectKey);
		cri.setCompany(company);
		logger.info("cri: " + cri);
		
		SimpleDateFormat standFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date transStart = standFormat.parse(startDate);
		Date transEnd = standFormat.parse(endDate);
		

		logger.info("gap: " + (transEnd.getTime() - transStart.getTime()) / (24 * 60 * 60 * 1000));

		Calendar cal = Calendar.getInstance();
		cal.setTime(transStart);

		List<GraphVO> graphList = new ArrayList<GraphVO>();

		while ((transEnd.getTime() - cal.getTimeInMillis()) / (24 * 60 * 60 * 1000) > -1) {

			cri.setStartDate(standFormat.format(cal.getTime()));
			cal.add(Calendar.SECOND, (24 * 60 * 60) - 1);
			cri.setEndDate(standFormat.format(cal.getTime()));

			GraphVO graphVO = new GraphVO();
			graphVO.setWriteDate(standFormat.format(cal.getTime()).toString().split(" ")[0]);
			
			if(cri.getCompany() == null && cri.getSelectKey() == null) {
				graphVO.setType2(0);
			}else {
				graphVO.setType2(etService.getSearchCountAll(cri));
			}

			cri.setCompany(null);
			cri.setSelectKey(null);

			graphVO.setType1(etService.getSearchCountAll(cri));

			cri.setCompany(company);
			cri.setSelectKey(selectKey);

			graphList.add(graphVO);

			cal.add(Calendar.SECOND, 1);
		}
		
		return graphList;
	}

	@GetMapping("/viral")
	public void viralGET() {
		logger.info("viralGET called....");
	}
}
