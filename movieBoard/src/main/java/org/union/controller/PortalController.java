package org.union.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.number.money.CurrencyUnitFormatter;
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
import org.union.domain.NaverMovieVO;
import org.union.domain.MobileEntVO;
import org.union.domain.PageMaker;
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.service.EtService;
import org.union.service.KeywordService;
import org.union.service.NaverMovieService;
import org.union.service.MobileEntService;
import org.union.service.PortalService;
import org.union.service.UserService;
import org.union.service.ViralService;
import org.union.util.ExcelView;
import org.union.util.ListUtil;

@Controller
@RequestMapping("/portal/*")
public class PortalController {

    @Autowired
    private PortalService portalService;

    @Autowired
    private NaverMovieService naverMovieService;

    @Autowired
    private MobileEntService mobileEntService;

    @Autowired
    private EtService etService;

    @Autowired
    private UserService userService;

    @Autowired
    private KeywordService keywordService;

    @Autowired
    private ViralService viralService;

    @Autowired
    private NaverMovieService movieService;

    private static Logger logger = LoggerFactory.getLogger(PortalController.class);

    @GetMapping("/naver_mobile")
    public void naverMobileGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws ParseException {
	logger.info("naverGET called....");
		
	if (cri.getKeyword() == "" || "undefined".equals(cri.getKeyword())) {
	    logger.info("keyword is null");
	    cri.setKeyword(null);

	}
	if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
	    logger.info("selectKey is null");
	    cri.setSelectKey(null);
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

	logger.info("main cri: " + cri);

	// 영화/배우 
	Integer movieCount = mobileEntService.getTypeOfMovieCount(cri);
	Integer actorCount = mobileEntService.getTypeOfActorCount(cri);

	model.addAttribute("movieCount", movieCount);
	model.addAttribute("actorCount", actorCount);

	PageMaker pageMaker = new PageMaker();
	cri.setPerPageNum(24);

	// 네이버모바일리스트
	List<MobileEntVO> mobileList = mobileEntService.searchList(cri);
	Integer totalCount = mobileEntService.getSearchCount(cri);

	model.addAttribute("mobileList", mobileList);
	model.addAttribute("totalCount", totalCount);

	pageMaker.setCri(cri);
	pageMaker.setTotalCount(totalCount);

	model.addAttribute("pageMaker", pageMaker);
	model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
    }

    @GetMapping("/naver_movie")
    public void naverMovieGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws ParseException {
	logger.info("naverGET called....");

	Date curDate = new Date(); 
	SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd"); //요청시간을 Date로 parsing 후 time가져오기
	String strDate = dateFormat.format(curDate);

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
	    cri.setStartDate(strDate + " 00:00:00");
	    cri.setEndDate(strDate + " 23:59:59");
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
	PageMaker pageMaker = new PageMaker();
	if (cri.getPerPageNum() != null) {
	    if (cri.getPerPageNum() == 10) {
		cri.setPerPageNum(30);
	    }
	}

	// 네이버영화리스트
	List<NaverMovieVO> movieList = naverMovieService.searchList(cri);
	Integer totalCount = naverMovieService.getSearchCount(cri);

	model.addAttribute("movieList", movieList);
	model.addAttribute("totalCount", totalCount);

	pageMaker.setCri(cri);
	pageMaker.setTotalCount(totalCount);

	model.addAttribute("pageMaker", pageMaker);
	model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));

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
	String oDate = startDate;
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

	Calendar cal = Calendar.getInstance();
	cal.setTime(transStart);

	List<GraphVO> graphList = new ArrayList<GraphVO>();

	long gap = (transEnd.getTime() - transStart.getTime()) / (24 * 60 * 60 * 1000);
	logger.info("gap: " + gap);

	if(gap != 0) {
	    while ((transEnd.getTime() - cal.getTimeInMillis()) / (24 * 60 * 60 * 1000) > -1) {
		cri.setStartDate(standFormat.format(cal.getTime()));
		cal.add(Calendar.SECOND, (24 * 60 * 60) - 1);
		cri.setEndDate(standFormat.format(cal.getTime()));
		
		GraphVO graphVO = new GraphVO();
		graphVO.setWriteDate(standFormat.format(cal.getTime()).toString().split(" ")[0]);

		Integer m = mobileEntService.getTypeOfMovieCount(cri);
		Integer a = mobileEntService.getTypeOfActorCount(cri);

		graphVO.setType1(m);
		graphVO.setType2(a);

		graphList.add(graphVO);

		cal.add(Calendar.SECOND, 1);
	    }
	}
	else {
	    cri.setStartDate(startDate);
	    cri.setEndDate(endDate);
	    
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date currentTime = new Date();
	    String oNow = sdf.format(currentTime);

	    int compare = oNow.compareTo(oDate);
	    int hourSize = 24;
	    if(compare==0) {
		hourSize = currentTime.getHours()+1; 
	    }
	    for(int i = 0; i < hourSize; i++) {
		Date dh = standFormat.parse(oDate+" "+String.valueOf(i)+":00:00");
		cri.setHour(String.valueOf(i));
		Integer m = mobileEntService.getTypeOfMovieCount(cri);
		Integer a = mobileEntService.getTypeOfActorCount(cri);

		GraphVO graphVO = new GraphVO();
		graphVO.setWriteDate(standFormat.format(dh));
		graphVO.setType1(m);
		graphVO.setType2(a);

		graphList.add(graphVO);
	    }
	}

	return graphList;
    }

    @GetMapping("/viral")
    public void viralGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
	logger.info("viralGET called....");

	cri.setKeyword(null);
	cri.setTextType(null);

	if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
	    logger.info("selectKey is null");
	    cri.setSelectKey(null);
	}

	/*// startDate format
		if ("undefined".equals(cri.getStartDate())  || cri.getStartDate() == "") {
			cri.setStartDate(null);
		}
		if(cri.getEndDate() == "" || "undefined".equals(cri.getEndDate())) {
			cri.setEndDate(null);
		}

		if(cri.getStartDate() == null && cri.getEndDate() == null) {
			String currentDate = sdf.format(new Date());
			currentDate = currentDate.split(":")[0];
			currentDate = currentDate + ":00:00";

			cri.setStartDate(currentDate);
		}

		// startDate, endDate 모두 값 O
		if (cri.getStartDate() != null && cri.getEndDate() != null) {
			if (cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0) {
				cri.setStartDate(cri.getStartDate() + " 00:00:00");
				cri.setEndDate(cri.getEndDate() + " 23:59:59");
			}
		}*/
	if (cri.getCompany() != null) {
	    if (cri.getCompany().isEmpty()) {
		cri.setCompany(null);
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

	// start naver
	cri.setPortal_name("naver");

	cri.setPortal_type("blog");
	model.addAttribute("nb1", viralService.getSearchInCount(cri));
	model.addAttribute("nb2", viralService.getSearchOutCount(cri));

	cri.setPortal_type("cafe");
	model.addAttribute("nc1", viralService.getSearchInCount(cri));
	model.addAttribute("nc2", viralService.getSearchOutCount(cri));

	cri.setPortal_type("kintip");
	model.addAttribute("nk1", viralService.getSearchInCount(cri));
	model.addAttribute("nk2", viralService.getSearchOutCount(cri));

	cri.setPortal_type("webdoc");
	model.addAttribute("nw1", viralService.getSearchInCount(cri));
	model.addAttribute("nw2", viralService.getSearchOutCount(cri));
	// end naver

	// start daum
	cri.setPortal_name("daum");

	cri.setPortal_type("blog");
	model.addAttribute("db1", viralService.getSearchInCount(cri));
	model.addAttribute("db2", viralService.getSearchOutCount(cri));

	cri.setPortal_type("cafe");
	model.addAttribute("dc1", viralService.getSearchInCount(cri));
	model.addAttribute("dc2", viralService.getSearchOutCount(cri));

	cri.setPortal_type("kintip");
	model.addAttribute("dk1", viralService.getSearchInCount(cri));
	model.addAttribute("dk2", viralService.getSearchOutCount(cri));

	cri.setPortal_type("webdoc");
	model.addAttribute("dw1", viralService.getSearchInCount(cri));
	model.addAttribute("dw2", viralService.getSearchOutCount(cri));

    }

    @GetMapping("/v_blog")
    public void v_blogGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
	logger.info("v_blogGET called....");

	if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
		|| cri.getStartDate() == "" || cri.getEndDate() == ""){
	    cri.setStartDate(null);
	    cri.setEndDate(null);

	} 
	if(cri.getStartDate() != null && cri.getEndDate() != null) {
	    logger.info("not null");
	    logger.info(cri.getStartDate());
	    logger.info(cri.getEndDate());
	    if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
		cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
		cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
	    }
	}

	if (cri.getCompany() != null) {
	    if (cri.getCompany().isEmpty()) {
		cri.setCompany(null);
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

	if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
	    logger.info("selectKey is null");
	    cri.setSelectKey(null);
	}

	// 사이트 미설정시
	if(cri.getPortal_name() != null) {
	    if(cri.getPortal_name().equals("네이버")) {
		cri.setPortal_name("naver");
	    }
	    if(cri.getPortal_name().equals("다음")) {
		cri.setPortal_name("daum");
	    }
	    if(cri.getPortal_name().equals("사이트")) {
		cri.setPortal_name("all");
	    }
	}


	// 키워드 설정 
	// 

	cri.setPortal_type("blog");

	logger.info("cri: " + cri);

	PageMaker pageMaker = new PageMaker();
	Integer totalCount = 0;

	if(cri.getCompany() != null && cri.getSelectKey() != null) {

	    totalCount = viralService.getHistoryCount(cri);

	    model.addAttribute("blog0", totalCount);
	    model.addAttribute("historyList", viralService.historyPage(cri));

	    cri.setStartDate(cri.getStartDate().split(" ")[0]);
	    cri.setEndDate(cri.getEndDate().split(" ")[0]);
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(totalCount);


	    model.addAttribute("pageMaker", pageMaker);

	    String tempEndDate = cri.getEndDate();

	    cri.setEndDate(null);
	    model.addAttribute("blog1", viralService.getSearchInCount(cri));
	    model.addAttribute("blog2", viralService.getSearchOutCount(cri));
	    model.addAttribute("blogList", viralService.searchAllList(cri));

	    cri.setEndDate(tempEndDate);

	    // endDate null로 셋팅한 것 복원.
	}else {

	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(totalCount);

	    model.addAttribute("pageMaker", pageMaker);

	}

    }

    @GetMapping("/v_cafe")
    public void v_cafeGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
	logger.info("v_cafeGET called....");

	if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
		|| cri.getStartDate() == "" || cri.getEndDate() == ""){
	    cri.setStartDate(null);
	    cri.setEndDate(null);

	} 
	if(cri.getStartDate() != null && cri.getEndDate() != null) {
	    logger.info("not null");
	    logger.info(cri.getStartDate());
	    logger.info(cri.getEndDate());
	    if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
		cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
		cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
	    }
	}

	if (cri.getCompany() != null) {
	    if (cri.getCompany().isEmpty()) {
		cri.setCompany(null);
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

	if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
	    logger.info("selectKey is null");
	    cri.setSelectKey(null);
	}

	// 사이트 미설정시
	if(cri.getPortal_name() != null) {
	    if(cri.getPortal_name().equals("네이버")) {
		cri.setPortal_name("naver");
	    }
	    if(cri.getPortal_name().equals("다음")) {
		cri.setPortal_name("daum");
	    }
	    if(cri.getPortal_name().equals("사이트")) {
		cri.setPortal_name("all");
	    }
	}

	cri.setPortal_type("cafe");

	logger.info("cri: " + cri);
	PageMaker pageMaker = new PageMaker();
	Integer totalCount = 0;

	if(cri.getCompany() != null && cri.getSelectKey() != null) {

	    totalCount = viralService.getHistoryCount(cri);

	    model.addAttribute("blog0", totalCount);
	    model.addAttribute("historyList", viralService.historyPage(cri));

	    model.addAttribute("pageMaker", pageMaker);

	    cri.setStartDate(cri.getStartDate().split(" ")[0]);
	    cri.setEndDate(cri.getEndDate().split(" ")[0]);
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(totalCount);

	    String tempEndDate = cri.getEndDate();

	    cri.setEndDate(null);
	    model.addAttribute("blog1", viralService.getSearchInCount(cri));
	    model.addAttribute("blog2", viralService.getSearchOutCount(cri));
	    model.addAttribute("blogList", viralService.searchAllList(cri));

	    cri.setEndDate(tempEndDate);

	    // endDate null로 셋팅한 것 복원.
	}else {

	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(totalCount);

	    model.addAttribute("pageMaker", pageMaker);

	}

	pageMaker.setCri(cri);
    }

    @GetMapping("/v_kin")
    public void v_kinGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
	logger.info("v_kinGET called....");

	if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
		|| cri.getStartDate() == "" || cri.getEndDate() == ""){
	    cri.setStartDate(null);
	    cri.setEndDate(null);

	} 
	if(cri.getStartDate() != null && cri.getEndDate() != null) {
	    logger.info("not null");
	    logger.info(cri.getStartDate());
	    logger.info(cri.getEndDate());
	    if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
		cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
		cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
	    }
	}

	if (cri.getCompany() != null) {
	    if (cri.getCompany().isEmpty()) {
		cri.setCompany(null);
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

	if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
	    logger.info("selectKey is null");
	    cri.setSelectKey(null);
	}

	// 사이트 미설정시
	if(cri.getPortal_name() != null) {
	    if(cri.getPortal_name().equals("네이버")) {
		cri.setPortal_name("naver");
	    }
	    if(cri.getPortal_name().equals("다음")) {
		cri.setPortal_name("daum");
	    }
	    if(cri.getPortal_name().equals("사이트")) {
		cri.setPortal_name("all");
	    }
	}

	cri.setPortal_type("kintip");

	logger.info("cri: " + cri);
	PageMaker pageMaker = new PageMaker();
	Integer totalCount = 0;

	if(cri.getCompany() != null && cri.getSelectKey() != null) {

	    totalCount = viralService.getHistoryCount(cri);

	    model.addAttribute("blog0", totalCount);
	    model.addAttribute("historyList", viralService.historyPage(cri));

	    model.addAttribute("pageMaker", pageMaker);

	    cri.setStartDate(cri.getStartDate().split(" ")[0]);
	    cri.setEndDate(cri.getEndDate().split(" ")[0]);
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(totalCount);

	    String tempEndDate = cri.getEndDate();

	    cri.setEndDate(null);
	    model.addAttribute("blog1", viralService.getSearchInCount(cri));
	    model.addAttribute("blog2", viralService.getSearchOutCount(cri));
	    model.addAttribute("blogList", viralService.searchAllList(cri));

	    cri.setEndDate(tempEndDate);

	    // endDate null로 셋팅한 것 복원.
	}else {

	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(totalCount);

	    model.addAttribute("pageMaker", pageMaker);

	}

	pageMaker.setCri(cri);
    }

    @GetMapping("/v_web")
    public void v_webGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
	logger.info("v_webGET called....");

	if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
		|| cri.getStartDate() == "" || cri.getEndDate() == ""){
	    cri.setStartDate(null);
	    cri.setEndDate(null);

	} 
	if(cri.getStartDate() != null && cri.getEndDate() != null) {
	    logger.info("not null");
	    logger.info(cri.getStartDate());
	    logger.info(cri.getEndDate());
	    if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
		cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
		cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
	    }
	}

	if (cri.getCompany() != null) {
	    if (cri.getCompany().isEmpty()) {
		cri.setCompany(null);
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

	if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
	    logger.info("selectKey is null");
	    cri.setSelectKey(null);
	}

	// 사이트 미설정시
	if(cri.getPortal_name() != null) {
	    if(cri.getPortal_name().equals("네이버")) {
		cri.setPortal_name("naver");
	    }
	    if(cri.getPortal_name().equals("다음")) {
		cri.setPortal_name("daum");
	    }
	    if(cri.getPortal_name().equals("사이트")) {
		cri.setPortal_name("all");
	    }
	}

	cri.setPortal_type("webdoc");

	logger.info("cri: " + cri);
	PageMaker pageMaker = new PageMaker();
	Integer totalCount = 0;

	if(cri.getCompany() != null && cri.getSelectKey() != null) {

	    totalCount = viralService.getHistoryCount(cri);

	    model.addAttribute("blog0", totalCount);
	    model.addAttribute("historyList", viralService.historyPage(cri));

	    model.addAttribute("pageMaker", pageMaker);

	    cri.setStartDate(cri.getStartDate().split(" ")[0]);
	    cri.setEndDate(cri.getEndDate().split(" ")[0]);
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(totalCount);

	    String tempEndDate = cri.getEndDate();

	    cri.setEndDate(null);
	    model.addAttribute("blog1", viralService.getSearchInCount(cri));
	    model.addAttribute("blog2", viralService.getSearchOutCount(cri));
	    model.addAttribute("blogList", viralService.searchAllList(cri));

	    cri.setEndDate(tempEndDate);

	    // endDate null로 셋팅한 것 복원.
	}else {

	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(totalCount);

	    model.addAttribute("pageMaker", pageMaker);

	}

	pageMaker.setCri(cri);
    }

    @GetMapping("/v_score")
    public void v_scoreGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
	logger.info("v_scoreGET called....");

	cri.setKeyword(null);
	cri.setTextType(null);

	if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
		|| cri.getStartDate() == "" || cri.getEndDate() == ""){
	    cri.setStartDate(null);
	    cri.setEndDate(null);

	} 
	if(cri.getStartDate() != null && cri.getEndDate() != null) {
	    logger.info("not null");
	    logger.info(cri.getStartDate());
	    logger.info(cri.getEndDate());
	    if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
		cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
		cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
	    }
	}

	if (cri.getCompany() != null) {
	    if (cri.getCompany().isEmpty()) {
		cri.setCompany(null);
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

	if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
	    logger.info("selectKey is null");
	    cri.setSelectKey(null);
	}

	// 사이트 미설정시
	if(cri.getPortal_name() != null) {
	    if(cri.getPortal_name().equals("네이버")) {
		cri.setPortal_name("naver");
	    }
	    if(cri.getPortal_name().equals("다음")) {
		cri.setPortal_name("daum");
	    }
	    if(cri.getPortal_name().equals("사이트")) {
		cri.setPortal_name("all");
	    }
	}


	logger.info("cri: " + cri);

	PageMaker pageMaker = new PageMaker();

	Integer totalCount = portalService.getScoreCount(cri);

	pageMaker.setCri(cri);
	pageMaker.setTotalCount(totalCount);

	model.addAttribute("pageMaker", pageMaker);
	model.addAttribute("totalCount", totalCount);
	model.addAttribute("minusCount", cri.getPerPageNum()*(cri.getPage()-1));

	model.addAttribute("scoreList", portalService.getScoreList(cri));

	model.addAttribute("textType", portalService.getScoreTextType(cri));

	model.addAttribute("scoreCount", portalService.getOnlyScore(cri));
    }

    @ResponseBody
    @PostMapping("/historyGraph")
    public List<GraphVO> historyGraphPOST(String url){
	logger.info("historyGraphPOST called....");

	List<GraphVO> list=  viralService.getHistoryRank(url);

	return list;
    }

    @ResponseBody
    @GetMapping("/excel")
    public ModelAndView excelGET(@ModelAttribute("cri") ModelAndView model, ExcelView excelView, SearchCriteria cri) {
	logger.info("excelGET called....");

	if (cri.getCompany() != null) {
	    if (cri.getCompany().isEmpty()) {
		cri.setCompany(null);
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

	if (cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey())) {
	    logger.info("selectKey is null");
	    cri.setSelectKey(null);
	}

	// 사이트 미설정시
	if(cri.getPortal_name() != null) {
	    if(cri.getPortal_name().equals("네이버")) {
		cri.setPortal_name("naver");
	    }
	    if(cri.getPortal_name().equals("다음")) {
		cri.setPortal_name("daum");
	    }
	    if(cri.getPortal_name().equals("사이트")) {
		cri.setPortal_name("all");
	    }
	}

	// startDate format
	if ("undefined".equals(cri.getStartDate())  || cri.getStartDate() == "") {
	    cri.setStartDate(null);
	}
	if(cri.getEndDate() == "" || "undefined".equals(cri.getEndDate())) {
	    cri.setEndDate(null);
	}

	if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())
		|| cri.getStartDate() == "" || cri.getEndDate() == ""){
	    cri.setStartDate(null);
	    cri.setEndDate(null);

	} 
	if(cri.getStartDate() != null && cri.getEndDate() != null) {
	    logger.info("not null");
	    logger.info(cri.getStartDate());
	    logger.info(cri.getEndDate());
	    if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
		cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
		cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
	    }
	}

	logger.info("cri: " + cri);

	List<ExtractVO> classiList = new ArrayList<ExtractVO>();
	ListUtil listUtil = new ListUtil();

	if (cri.getPortal_type().equals("movie")) {
	    model.addObject("list", listUtil.listAddMovieList(classiList, movieService.searchAllList(cri)));
	}
	else if (cri.getPortal_type().equals("mobile")) {
	    model.addObject("list", listUtil.listAddMobileList(classiList, mobileEntService.searchAllList(cri)));
	}
	else {
	    model.addObject("list", listUtil.listAddViralList(classiList, viralService.searchAllList(cri)));
	}

	model.addObject("type", cri.getPortal_type());
	model.setView(excelView);

	return model;
    }
}
