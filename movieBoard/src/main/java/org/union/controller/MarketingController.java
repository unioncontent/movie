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
import org.union.domain.FvVO;
import org.union.domain.GraphVO;
import org.union.domain.PageMaker;
import org.union.domain.PageMakerFv;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.TextTypeVO;
import org.union.domain.UserVO;
import org.union.service.CalendarService;
import org.union.service.CommunityService;
import org.union.service.EtService;
import org.union.service.KeywordService;
import org.union.service.MediaService;
import org.union.service.MobileEntService;
import org.union.service.NaverMovieService;
import org.union.service.PortalService;
import org.union.service.RelationService;
import org.union.service.SNSService;
import org.union.service.UserService;
import org.union.service.ViralService;

@Controller
@RequestMapping("/marketing/*")
public class MarketingController {
	
	@Autowired
    private PortalService portalService;
	
	@Autowired
	private MediaService mediaService;

    @Autowired
    private NaverMovieService naverMovieService;

    @Autowired
    private MobileEntService mobileEntService;

    @Autowired
    private EtService etService;
    
    @Autowired
	private SNSService snsService;
    
    @Autowired
	private CommunityService communityService;

    @Autowired
	private UserService userService;
    
    @Autowired
	private RelationService relationService;

    @Autowired
    private KeywordService keywordService;
    
    @Autowired
	private CalendarService calendarService;

    @Autowired
    private ViralService viralService;
    
    @Autowired
    private NaverMovieService movieService;
   
    private static Logger logger = LoggerFactory.getLogger(PortalController.class);
	
	@GetMapping("/f_channel")
    public void f_channelGET(@ModelAttribute("cri") SearchCriteria cri, Model model, String sns_content) throws ParseException {
    	logger.info("f_channelGET called....");
    	
    	if(cri.getKeyword() == "" || "undefined".equals(cri.getKeyword()))  {
			logger.info("keyword is null");
			cri.setKeyword(null);
			
		}
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
		
		model.addAttribute("fV", snsService.facebookCGV(cri));
		model.addAttribute("fVList", snsService.facebookCGVList(cri));
		//model.addAttribute("fVListsearch", snsService.fvlistSearch(sns_content));
		
		Integer totalCount = snsService.facebookCGVListTotalCnt(cri);
		
		logger.info("totalCount: " + totalCount);
		
		PageMakerFv pageMakerFv = new PageMakerFv();
		
		pageMakerFv.setCri(cri);
		pageMakerFv.setTotalCount(snsService.facebookCGVListTotalCnt(cri));
		
		logger.info("pageMaker: " + pageMakerFv);
		
		model.addAttribute("pageMaker", pageMakerFv);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
    }
	
	/*@ResponseBody
	@PostMapping("/fvsearchList")
	public List<FvVO> fvsearchList(String url, String sns_content){
		logger.info("fvsearchList called....");
		logger.info("sns_content");
		List<FvVO> list = snsService.fvlistSearch(sns_content);
		
		
		
		return list;
	}*/
	
	@GetMapping("/f_list")
    public void f_listGET(@ModelAttribute("cri") SearchCriteria cri, Model model, String url, String content) throws ParseException {
    	logger.info("f_list called....");
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
		/*if(cri.getStartDate() != null && cri.getEndDate() != null) {
			if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
				cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
				cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
			}
		}*/
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
		/*if (cri.getCompany() != null) {	
			if (cri.getCompany().isEmpty() == false) {

				UserVO userVO = userService.viewByName(cri.getCompany());
				logger.info("userVO: " + userVO);
				logger.info("keywordList: " + keywordService.listByUser(userVO.getUser_idx()));
				model.addAttribute("modelKeywordList",
						keywordService.listByUser(userService.viewByName(cri.getCompany()).getUser_idx()));
			}
		}*/
		cri.setUrl(url);
		cri.setPortal_name(content);
		logger.info("crifvList: " + cri);
		
		model.addAttribute("fVListsearch", snsService.fvlistSearch(cri));
		
		
		logger.info("url: " + url);
		model.addAttribute("content", content);
		
		Integer totalCount = snsService.fvlistSearchTotalCnt(cri);
		
		logger.info("totalCount: " + totalCount);
		
		PageMakerFv pageMakerFv = new PageMakerFv();
		
		pageMakerFv.setCri(cri);
		pageMakerFv.setTotalCount(snsService.fvlistSearchTotalCnt(cri));
		
		logger.info("pageMaker: " + pageMakerFv);
		
		model.addAttribute("pageMaker", pageMakerFv);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		
    }
	
	@GetMapping("/n_channel")
    public void n_channelGET(@ModelAttribute("cri") SearchCriteria cri, Model model, String sns_content) throws ParseException {
    	logger.info("f_channelGET called....");
    	
    	if(cri.getKeyword() == "" || "undefined".equals(cri.getKeyword()))  {
			logger.info("keyword is null");
			cri.setKeyword(null);
			
		} 
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
		
		model.addAttribute("nVList", portalService.naverVideosList(cri));
		//model.addAttribute("fVListsearch", snsService.fvlistSearch(sns_content));
		
		Integer totalCount = portalService.naverVideosListTotalCnt(cri);
		
		logger.info("totalCount: " + totalCount);
		
		PageMakerFv pageMakerFv = new PageMakerFv();
		
		pageMakerFv.setCri(cri);
		pageMakerFv.setTotalCount(portalService.naverVideosListTotalCnt(cri));
		
		logger.info("pageMaker: " + pageMakerFv);
		
		model.addAttribute("pageMaker", pageMakerFv);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
    }
	
	@GetMapping("/n_list")
    public void n_listGET(@ModelAttribute("cri") SearchCriteria cri, Model model, String url, String content) throws ParseException {
    	logger.info("f_list called....");
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
		/*if(cri.getStartDate() != null && cri.getEndDate() != null) {
			if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
				cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
				cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
			}
		}*/
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
		/*if (cri.getCompany() != null) {	
			if (cri.getCompany().isEmpty() == false) {

				UserVO userVO = userService.viewByName(cri.getCompany());
				logger.info("userVO: " + userVO);
				logger.info("keywordList: " + keywordService.listByUser(userVO.getUser_idx()));
				model.addAttribute("modelKeywordList",
						keywordService.listByUser(userService.viewByName(cri.getCompany()).getUser_idx()));
			}
		}*/
		cri.setUrl(url);
		cri.setPortal_name(content);
		logger.info("crifvList: " + cri);
		
		model.addAttribute("nVListsearch", portalService.nvlistSearch(cri));
		
		
		logger.info("url: " + url);
		model.addAttribute("content", content);
		
		Integer totalCount = portalService.nvlistSearchTotalCnt(cri);
		
		logger.info("totalCount: " + totalCount);
		
		PageMakerFv pageMakerFv = new PageMakerFv();
		
		pageMakerFv.setCri(cri);
		pageMakerFv.setTotalCount(portalService.nvlistSearchTotalCnt(cri));
		
		logger.info("pageMaker: " + pageMakerFv);
		
		model.addAttribute("pageMaker", pageMakerFv);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		
    }
	
	@ResponseBody
	@PostMapping("/graph")
	public List<GraphVO> graphPOST(Model model, String success, String url, SearchFv fv) {
		logger.info("graphPOST called....");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
		
		String current = sdf.format(new Date());
		logger.info("current: " + current);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		List<GraphVO> graphList = new ArrayList<GraphVO>();
		
		
		logger.info("cal.getTime: " + cal.getTime());
		logger.info("graphUrl: " + url);

		for(int i = 0; i < 48; i++) {
			GraphVO graphVO = new GraphVO();
			
			fv.setDate(cal.getTime());
			fv.setUrl(url);
			
			graphVO.setWriteDate(sdf.format(cal.getTime()) + ":00:00");
			graphVO.setType1(snsService.fvlistViewCnt(fv));
			
			graphList.add(graphVO);
			
			cal.add(Calendar.HOUR, -1);
			
		}
		

		logger.info("graphList: " + graphList);
		return graphList;
	}
	
	@ResponseBody
	@PostMapping("/ngraph")
	public List<GraphVO> NgraphPOST(Model model, String success, String url, SearchFv fv) {
		logger.info("graphPOST called....");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
		
		String current = sdf.format(new Date());
		logger.info("current: " + current);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		List<GraphVO> graphList = new ArrayList<GraphVO>();
		
		
		logger.info("cal.getTime: " + cal.getTime());
		logger.info("graphUrl: " + url);

		for(int i = 0; i < 48; i++) {
			GraphVO graphVO = new GraphVO();
			
			fv.setDate(cal.getTime());
			fv.setUrl(url);
			
			graphVO.setWriteDate(sdf.format(cal.getTime()) + ":00:00");
			graphVO.setType1(portalService.nvlistViewCnt(fv));
			
			graphList.add(graphVO);
			
			cal.add(Calendar.HOUR, -1);
			
		}
		

		logger.info("graphList: " + graphList);
		return graphList;
	}
}
