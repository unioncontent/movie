package org.union.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
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
import org.springframework.web.servlet.ModelAndView;
import org.union.domain.ExtractVO;
import org.union.domain.GraphVO;
import org.union.domain.PageMaker;
import org.union.domain.PeriodMediaVO;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;
import org.union.domain.UserVO;
import org.union.service.CommunityService;
import org.union.service.KeywordService;
import org.union.service.MediaService;
import org.union.service.PortalService;
import org.union.service.ReporterService;
import org.union.service.SNSService;
import org.union.service.UserService;
import org.union.util.ExcelView;
import org.union.util.ListUtil;
import org.union.util.PeriodComparator;

@Controller
@RequestMapping("/period/*")
public class PeriodController {

	private static Logger logger = LoggerFactory.getLogger(PeriodController.class);

	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private CommunityService communityService;

	@Autowired
	private PortalService portalService;
	
	@Autowired
	private SNSService snsService;

	@Autowired
	private KeywordService keywordService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private ReporterService reporterService;	

	@GetMapping("/main")
	public void mainGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("mainGET called....");
		
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
		
		model.addAttribute("portalCount", portalService.wgetSearchCount(cri));
		model.addAttribute("communityCount", communityService.wgetSearchCount(cri));
		model.addAttribute("snsCount", snsService.getSearchCount(cri));
		model.addAttribute("mediaCount", mediaService.wgetSearchCount(cri));
		
		model.addAttribute("portalTextType", portalService.textTypeCount(cri));
		model.addAttribute("communityTextType", communityService.textTypeCount(cri));
		
		model.addAttribute("blogTextType", portalService.blogTextType(cri));
		model.addAttribute("cafeTextType", portalService.cafeTextType(cri));
		
		model.addAttribute("facebookTT", snsService.facebookSum(cri));
		model.addAttribute("twitterTT", snsService.twitterSum(cri));
		model.addAttribute("instagramTT", snsService.instagramSum(cri));
		
		
		model.addAttribute("naverMediaCount", mediaService.naverMediaCount(cri));
		model.addAttribute("daumMediaCount", mediaService.daumMediaCount(cri));
		
	}

	@GetMapping("/community")
	public void communityGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("communityGET called....");
		
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
		
		cri.setTextType("좋은글");
		model.addAttribute("type1", communityService.wgetSearchCount(cri));
		
		cri.setTextType("나쁜글");
		model.addAttribute("type2", communityService.wgetSearchCount(cri));
		
		cri.setTextType("관심글");
		model.addAttribute("type3", communityService.wgetSearchCount(cri));
		
		cri.setTextType("기타글");
		model.addAttribute("type4", communityService.wgetSearchCount(cri));
		
		cri.setTextType(null);
		model.addAttribute("communityList", communityService.listComplete(cri));
		
		PageMaker pageMaker = new PageMaker();
		
		Integer totalCount = communityService.getCompleteCount(cri);
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		logger.info("pageMaker: " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
	}

	@GetMapping("/portal")
	public void portalGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("portalGET called....");
		
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
		
		Integer naverCount = portalService.getNaverCount(cri);
		Integer daumCount = portalService.getDaumCount(cri);
		
		model.addAttribute("naverCount", naverCount);
		model.addAttribute("daumCount", daumCount);
		
		model.addAttribute("portalList", portalService.wlistSearch(cri));
		logger.info("list: " + portalService.wlistSearch(cri));
		PageMaker pageMaker = new PageMaker();
		
		Integer totalCount = portalService.wgetSearchCount(cri);
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		logger.info("pageMaker: " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("naver1", portalService.naverTextTypeCountb(cri));
		model.addAttribute("naver2", portalService.naverTextTypeCountc(cri));
		model.addAttribute("naver3", portalService.naverTextTypeCountk(cri));
		model.addAttribute("naver4", portalService.naverTextTypeCountw(cri));
		
		model.addAttribute("daum1", portalService.daumTextTypeCountb(cri));
		model.addAttribute("daum2", portalService.daumTextTypeCountc(cri));
		model.addAttribute("daum3", portalService.daumTextTypeCountk(cri));
		model.addAttribute("daum4", portalService.daumTextTypeCountw(cri));

	}

	@GetMapping("/media")
	public void mediaGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		  logger.info("mediaGET called....");
		  
		  cri.setTextType(null);
		  cri.setKeyword(null);
		  
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
		
		  List<PeriodMediaVO> mediaList = mediaService.periodMedia(cri);
		  List<PeriodMediaVO> reporterList = mediaService.periodReporter(cri);
		  
		  PeriodComparator comparator = new PeriodComparator();
		  Collections.sort(mediaList, comparator);
		  Collections.sort(reporterList, comparator);
		  
		  model.addAttribute("mediaCount", mediaList.size());
		  model.addAttribute("pressCount", reporterList.size());
		  model.addAttribute("totalCount", mediaService.getTotalCount(cri));
		  
		  if(cri.getSelectKey() == null && cri.getCompany() == null) {
			  model.addAttribute("matchCount", 0);
		  
		  }else {
			  model.addAttribute("matchCount", mediaService.getMatchCount(cri));
		  }
		  
		  
		  mediaList = mediaList.subList(0, 20);
		  reporterList = reporterList.subList(0, 20);
		  
		  model.addAttribute("pressList", reporterList);
		  model.addAttribute("mediaList", mediaList);
		  
		  
		  // 리스트
		  String keyword=  cri.getKeyword();
		  cri.setKeyword(null);
		  model.addAttribute("searchList", mediaService.wlistSearch(cri));
		  PageMaker pageMaker = new PageMaker();
		  
		  Integer totalCount = mediaService.wgetSearchCount(cri);
		  
		  pageMaker.setCri(cri);
		  pageMaker.setTotalCount(totalCount);
		  
		  model.addAttribute("pageMaker", pageMaker);
		  model.addAttribute("totalCountPage", totalCount);
		  model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		  
		  //cri.setKeyword(keyword);

		  model.addAttribute("mediaTypeCount", mediaService.periodTextTypeCount(cri));
		  logger.info(mediaService.periodTextTypeCount(cri) + "");
		  
		  cri.setTextType("press");
		  model.addAttribute("pressTypeCount", mediaService.periodTextTypeCount(cri));
		  //cri.setTextType(null);
		  
	}

	@ResponseBody
	@PostMapping("/getTextType")
	public List<TextTypeVO> getTextType(String url, String part, String keyword){
		logger.info("getTextType called....");

		SearchCriteria cri  = new SearchCriteria();
		
		if(!url.equals("undefined")) {
			String company = url.split("company")[1].split("&")[0];
			String selectKey = url.split("selectKey")[1].split("&")[0];
			String startDate = url.split("startDate")[1].split("&")[0] + " 00:00:00";
			String endDate = url.split("endDate")[1].split("&")[0] + " 23:59:50";
			
			cri.setCompany(company);
			cri.setSelectKey(selectKey);
			cri.setStartDate(startDate);
			cri.setEndDate(endDate);
		}
		
		cri.setKeyword(keyword);
		
		logger.info("cri: " + cri);
		
		List<TextTypeVO> list = new ArrayList<TextTypeVO>();
		
		if(part.equals("media")) {
			list.add(mediaService.getMediaPortalCount(cri));
			list.add(mediaService.getMediaTextTypeTotalCount(cri));
			list.add(mediaService.getMediaTextTypeSearchCount(cri));
			
		}else if(part.equals("press")) {
			list.add(mediaService.getPressPortalCount(cri));
			list.add(mediaService.getPressTextTypeTotalCount(cri));
			list.add(mediaService.getPressTextTypeSearchCount(cri));
			
			TextTypeVO textTypeVO = new TextTypeVO();
			ReporterVO reporterVO = reporterService.readByName(keyword);
			
			try {
				textTypeVO.setName1(reporterVO.getReporter_name());
				textTypeVO.setName2(reporterVO.getReporter_media_name());
				if(reporterVO.getReporter_email() != null) {
					textTypeVO.setEmail(reporterVO.getReporter_email());
				}
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				list.add(textTypeVO);
			}
			
		}
		
		return list;
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
		
		Integer totalCount = snsService.getSearchCount(cri);
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		logger.info("pageMaker: " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	@PostMapping("/graph")
	@ResponseBody
	public List<GraphVO> graphPOST(String startDate, String endDate, String company, String selectKey, String part) throws Exception{
		logger.info("grpahPOST called....");
		
		logger.info("company: " + company);
		logger.info("selectKey: " + selectKey);
		
		if(company == null || company.equals("회사")) {
			logger.info(SecurityContextHolder.getContext().getAuthentication().getName().toString());
			UserVO vo = userService.viewById(SecurityContextHolder.getContext().getAuthentication().getName());
			
			if(!vo.getUser_name().equals("union")) {
				company = vo.getUser_name();
			
			}else {
				company = null;
			}
		}
		if(selectKey != null) {
			if(selectKey.isEmpty() || selectKey.equals("키워드")) {
				selectKey = null;
			}
		}
		
		startDate = startDate + " 00:00:00";
		endDate = endDate + " 23:59:59";
		logger.info("startDate: " + startDate);
		logger.info("endDate: " + endDate);
		
		SearchCriteria cri = new SearchCriteria();
		cri.setSelectKey(selectKey);
		cri.setCompany(company);
		logger.info("cri: " + cri);
		logger.info("part: " + part);
		
		SimpleDateFormat standFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date transStart = standFormat.parse(startDate);
		Date transEnd = standFormat.parse(endDate);
		
		Long gap = (transEnd.getTime() - transStart.getTime()) / (24 * 60 * 60 * 1000);
		logger.info("gap: " + gap);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(transStart);

		List<GraphVO> graphList = new ArrayList<GraphVO>();
		
		if(part.equals("sns")) {
			for(int i = 0; i < gap +1; i++) {
				
				cri.setStartDate(standFormat.format(cal.getTime()));
				cal.add(Calendar.SECOND, ((24 * 60 * 60) -1));
				cri.setEndDate(standFormat.format(cal.getTime()));
				
				GraphVO graphVO = new GraphVO();
				graphVO.setWriteDate(standFormat.format(cal.getTime()).toString().split(" ")[0]);
				graphVO.setFacebookCount(snsService.facebookTotalCount(cri));
				graphVO.setInstagramCount(snsService.instaTotalCount(cri));
				graphVO.setTwitterCount(snsService.twitterTotalCount(cri));
				
				graphList.add(graphVO);
				
				cal.add(Calendar.SECOND, 1);
			}
		
		}else if(part.equals("community")) {
			for(int i = 0; i < gap +1; i++) {
				
				cri.setStartDate(standFormat.format(cal.getTime()));
				cal.add(Calendar.SECOND, (24 * 60 * 60) -1);
				cri.setEndDate(standFormat.format(cal.getTime()));
				
				GraphVO graphVO = new GraphVO();
				graphVO.setWriteDate(standFormat.format(cal.getTime()).toString().split(" ")[0]);
				cri.setTextType("좋은글");
				graphVO.setType1(communityService.getSearchCount(cri));
				
				cri.setTextType("나쁜글");
				graphVO.setType2(communityService.getSearchCount(cri));
				
				cri.setTextType("관심글");
				graphVO.setType3(communityService.getSearchCount(cri));
				
				cri.setTextType("기타글");
				graphVO.setType4(communityService.getSearchCount(cri));
				
				cri.setTextType(null);
				
				graphList.add(graphVO);
				
				cal.add(Calendar.SECOND, 1);
			}
		}else if(part.equals("portal")) {
			for(int i = 0; i < gap +1; i++) {
				
			cri.setStartDate(standFormat.format(cal.getTime()));
			cal.add(Calendar.SECOND, (24 * 60 * 60) -1);
			cri.setEndDate(standFormat.format(cal.getTime()));
				
			GraphVO graphVO = new GraphVO();
			graphVO.setWriteDate(standFormat.format(cal.getTime()).toString().split(" ")[0]);
			graphVO.setType1(portalService.getNaverCount(cri));
			graphVO.setType2(portalService.getDaumCount(cri));
				
			graphList.add(graphVO);
				
			cal.add(Calendar.SECOND, 1);
			}
			
			
		}else if(part.equals("main")) {
			for(int i = 0; i < gap +1; i++) {
				
				cri.setStartDate(standFormat.format(cal.getTime()));
				cal.add(Calendar.SECOND, (24 * 60 * 60) -1);
				cri.setEndDate(standFormat.format(cal.getTime()));
					
				GraphVO graphVO = new GraphVO();
				graphVO.setWriteDate(standFormat.format(cal.getTime()).toString().split(" ")[0]);
				graphVO.setType1(portalService.getSearchCount(cri));
				graphVO.setType2(communityService.getSearchCount(cri));
				graphVO.setType3(snsService.getSearchCount(cri));
				graphVO.setType4(mediaService.getSearchCount(cri));
					
				graphList.add(graphVO);
					
				cal.add(Calendar.SECOND, 1);
				}
		}
			
		
		return graphList;
		
	}
	
	@ResponseBody
	@GetMapping("/excel")
	public ModelAndView excelGET(ModelAndView model, ExcelView excelView, SearchCriteria cri, String part) {
		
		if(cri.getCompany() == null || cri.getCompany().equals("회사")) {
			logger.info(SecurityContextHolder.getContext().getAuthentication().getName().toString());
			UserVO vo = userService.viewById(SecurityContextHolder.getContext().getAuthentication().getName());
			
			if(!vo.getUser_name().equals("union")) {
				cri.setCompany(vo.getUser_name());
			
			}else {
				cri.setCompany(null);
			}
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
		
		if(cri.getSelectKey() != null) {
			if(cri.getSelectKey().isEmpty() || cri.getSelectKey().equals("키워드")) {
				cri.setSelectKey(null);
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
		
		logger.info("cri: " + cri);
		logger.info("part: " + part);
		
		List<ExtractVO> classiList = new ArrayList<ExtractVO>();
		ListUtil listUtil = new ListUtil();
		
		if(part.equals("sns")) {
			model.addObject("snsList", snsService.listExcel(cri));
			model.addObject("part", "sns");
		
		}else if(part.equals("community")) {
			listUtil.listAddCommunityList(classiList, communityService.wPageSearch(cri));
		
		}else if(part.equals("portal")){
			listUtil.listAddPortalList(classiList, portalService.wPageSearch(cri));
		
		}else if(part.equals("media")) {
			listUtil.listAddMediaList(classiList, mediaService.wPageSearch(cri));
		}
		
		
		model.addObject("list", classiList);
		model.setView(excelView);
		
		return model;
	}

	
}
