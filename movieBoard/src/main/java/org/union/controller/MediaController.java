package org.union.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.ModelAndView;
import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.MediaVO;
import org.union.domain.NewsVO;
import org.union.domain.PageMaker;
import org.union.domain.PortalVO;
import org.union.domain.ReplyVO;
import org.union.domain.ReporterVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.persistence.MediaDAO;
import org.union.service.KeywordService;
import org.union.service.MediaService;
import org.union.service.ReporterService;
import org.union.service.UserService;
import org.union.util.ExcelView;
import org.union.util.ListUtil;

@Controller
@RequestMapping("/media/*")
public class MediaController {

	
	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private ReporterService reporterService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private KeywordService keywordService;
	
	private static Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	
	@GetMapping("/news")
	public void newsGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws ParseException {
		logger.info("newsGET called....");
		logger.info("first cri: " + cri);
		cri.setCompany(null);
		cri.setTextType(null);
		
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
			logger.info("not null");
			logger.info(cri.getStartDate());
			logger.info(cri.getEndDate());
			if(cri.getStartDate().indexOf("00:00:00") < 0 && cri.getEndDate().indexOf("23:59:59") < 0){ 
				cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
				cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
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
		
		if(cri.getCompany() != null) {
			if(cri.getCompany().isEmpty() == false) {
			
				UserVO userVO  = userService.viewByName(cri.getCompany());
				logger.info("userVO: " + userVO);
			    logger.info("keywordList: " + keywordService.listByUser(userVO.getUser_idx()));
				model.addAttribute("modelKeywordList", keywordService.listByUser(
						userService.viewByName(cri.getCompany()).getUser_idx()));
			}
		}
		
		logger.info("cri: " + cri);
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		List<MediaVO> mediaList = mediaService.allPageList(cri);
		
		for(int i = 0; i < mediaList.size(); i++) {
			mediaList.get(i).setWriteDate(date.format(mediaList.get(i).getUpdateDate()));
		}
		
		
		model.addAttribute("mediaList", mediaList);
		
		Integer totalCount = mediaService.allPageCount(cri);
		
		logger.info("totalCount: " + totalCount);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		
	}
	
	@GetMapping("/replyAdd")
	public void replyAdd() {
		
	}
	
	
	@GetMapping("/replyAddOk")
	public String replyAddOk(NewsVO vo) {
		
		mediaService.replyAdd(vo);
		return "redirect:/media/replyAdd";
	}
	
	@GetMapping("/replyList")
	public void replyList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("replyList called....");
		
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
			logger.info("not null");
			logger.info(cri.getStartDate());
			logger.info(cri.getEndDate());
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
		
		model.addAttribute("newsList", mediaService.newsList(cri));
//		model.addAttribute("replyCount", mediaService.replyCount(news_idx));
		
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		
		Integer totalCount = mediaService.newsAllPageCount(cri);
		
		logger.info("totalCount: " + totalCount);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		
	}
	
	
	@GetMapping("/reply")
	public void reply(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("reply called....");
		
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
			logger.info("not null");
			logger.info(cri.getStartDate());
			logger.info(cri.getEndDate());
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
		
		model.addAttribute("replyList", mediaService.replyList(cri));
		
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		
		
		// 4번 리스트기 때문에  perPageNum / 3
		if(cri.getPerPageNum() != 10) {
			cri.setPerPageNum(cri.getPerPageNum()/3);
		}
				
		Integer totalCount = mediaService.replyAllPageCount(cri);
		
		logger.info("totalCount: " + totalCount);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		cri.setPerPageNum(cri.getPerPageNum()*3);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		model.addAttribute("pageMaker", pageMaker);
		
		
	}
	
	@ResponseBody
	@PostMapping("/newsInsert")
	public void newsInsertPOST(Integer idx, String textType) {
		logger.info("newsInsert called....");
		
		logger.info("idx: " + idx);
		logger.info("textType: " + textType);

		MediaVO vo = new MediaVO();
		
		vo.setMedia_idx(idx);
		vo.setTextType(textType);
		
		mediaService.modifyType(vo);
	}
	
	@ResponseBody
	@GetMapping("/excel")
	public ModelAndView excelGET(ModelAndView mav, ExcelView excelView, SearchCriteria cri, Model model) {
		
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
			logger.info("not null");
			logger.info(cri.getStartDate());
			logger.info(cri.getEndDate());
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
		if(cri.getTextType() != null) {
			if(cri.getTextType().equals("undefined") || cri.getTextType().equals("분류") || cri.getTextType().isEmpty()) {
				cri.setTextType(null);
			}
		}
		
		logger.info("cri: " + cri);
		logger.info("perPageNum: " + cri.getPerPageNum());
		logger.info("getStartPage: " + cri.getStartPage());
		ListUtil util = new ListUtil();
		List<ExtractVO> extractList = new ArrayList<ExtractVO>();
		
		mav.addObject("list", util.listAddMediaList(extractList, mediaService.allPage(cri)));
		mav.setView(excelView);
		
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/excelOk")
	public ModelAndView ReplyexcelGET(ModelAndView model, ExcelView excelView, SearchCriteria cri) {
		
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
			logger.info("not null");
			logger.info(cri.getStartDate());
			logger.info(cri.getEndDate());
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
		if(cri.getTextType() != null) {
			if(cri.getTextType().equals("undefined") || cri.getTextType().equals("분류") || cri.getTextType().isEmpty()) {
				cri.setTextType(null);
			}
		}
		
		logger.info("cri: " + cri);
		logger.info("perPageNum: " + cri.getPerPageNum());
		logger.info("getStartPage: " + cri.getStartPage());
		ListUtil util = new ListUtil();
		List<ExtractVO> extractList = new ArrayList<ExtractVO>();
		
		
		
		model.addObject("list", util.listAddReplyList(extractList, mediaService.replyAllPage(cri)));
		model.addObject("type", "news");
		model.setView(excelView);
		
		return model;
	}
	
	
	@GetMapping("/press")
	public void pressGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("pressGET called....");
		
		logger.info("cri: " + cri);
		
		List<ReporterVO> reporterList = reporterService.listSearch(cri);
		
		logger.info("reporterList: " + reporterList);
		
		model.addAttribute("reporterList", reporterList);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reporterService.getSearchCount(cri));
		
		logger.info("pageMaker: " + pageMaker);
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	@PostMapping("/pressInsert")
	public String pressInsertPOST(ReporterVO reporterVO) {
		logger.info("pressInsertPOST called....");
		
		logger.info("reporterVO: " + reporterVO);
		
		reporterService.insert(reporterVO);
		
		return "redirect:/media/press";
	}
	
	@ResponseBody
	@PostMapping("modify")
	public String modifyPOST(Integer idx, String textType) {
		logger.info("insertPOST called....");
		
		logger.info("idx: " + idx);
		logger.info("textType: " + textType );
		
		
		NewsVO nvo = new NewsVO();
		ReplyVO rvo = new ReplyVO();
		nvo.setNews_idx(idx);
		nvo.setTextType(textType);
		rvo.setReply_idx(idx);
		rvo.setTextType(textType);
			
		mediaService.newsUpdateTextType(nvo);
		mediaService.replyUpdateTextType(rvo);
		
		return "success";
	}
	
	
	@ResponseBody
	@PostMapping("/remove")
	public String removePOST(Integer idx) {
		logger.info("removePOST called....");
		logger.info("idx: " + idx);
		
		mediaService.newsRemove(idx);
		mediaService.replyRemove(idx);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("update")
	public String newsUpdate(Integer idx, Integer state) {
		logger.info("newsUpdate called....");
		
		logger.info("idx: " + idx);
		logger.info("state: " + state);
		
		NewsVO vo = new NewsVO();
		
		vo.setNews_idx(idx);
		vo.setNews_state(state);
		
		mediaService.newsUpdateState(vo);
		
		return "success";
	}
}
