package org.union.controller;

import java.util.ArrayList;
import java.util.Collections;
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
import org.union.domain.PageMaker;
import org.union.domain.PortalVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.domain.UserVO;
import org.union.service.CommunityService;
import org.union.service.KeywordService;
import org.union.service.MediaService;
import org.union.service.PortalService;
import org.union.service.SNSService;
import org.union.service.UserService;
import org.union.util.ExcelView;
import org.union.util.ExtractComparator;
import org.union.util.ListUtil;

@Controller
@RequestMapping("/classification/*")
public class ClassificationController {

	
	@Autowired
	private SNSService snsService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private PortalService portalService;
	
	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private KeywordService keywordService;
	
	@Autowired
	private UserService userService;
	
	private static Logger logger = LoggerFactory.getLogger(ClassificationController.class);
	
	
	//List<ExtractVO> excelList;
	
	@GetMapping("/classification")
	public void classificationGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("classificationGET called....");
		
		
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
		
		logger.info("cri: " + cri);
		
		PageMaker pageMaker = new PageMaker();
		
		// 4번 리스트기 때문에  perPageNum / 4
		if(cri.getPerPageNum() != 10) {
			cri.setPerPageNum(cri.getPerPageNum()/4);
		
		}
		
		logger.info("community: " + communityService.getSearchCount(cri));
		logger.info("sns: " + snsService.getSearchCount(cri));
		logger.info("portalService: " + portalService.getSearchCount(cri));
		logger.info("media: " + mediaService.getSearchCount(cri));
		
		Integer totalCount = communityService.getSearchCount(cri)
							+ snsService.getSearchCount(cri)
							+ portalService.getSearchCount(cri)
							+ mediaService.getSearchCount(cri);
		
		model.addAttribute("totalCount", totalCount);
		
		List<ExtractVO> classiList = new ArrayList<ExtractVO>();
		ListUtil listUtil = new ListUtil();
		
		if(cri.getCompany() == null) {
			logger.info(SecurityContextHolder.getContext().getAuthentication().getName().toString());
			UserVO vo = userService.viewById(SecurityContextHolder.getContext().getAuthentication().getName());
			
			if(!vo.getUser_name().equals("union")) {
			cri.setCompany(vo.getUser_name());
			}
		}
		
		listUtil.listAddSNSList(classiList, snsService.listSearch(cri));
		listUtil.listAddCommunityList(classiList, communityService.listSearch(cri));
		listUtil.listAddPortalList(classiList, portalService.listSearch(cri));
		listUtil.listAddMediaList(classiList, mediaService.listSearch(cri));
		
		cri.setPerPageNum(cri.getPerPageNum()*4);
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("minusCount", cri.getPerPageNum() * (cri.getPage()-1));
		
		logger.info("pageMaker: " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		// 회사 선택에 따른 키워드 재추출
		if(cri.getCompany() != null) {
			model.addAttribute("modelKeywordList", keywordService.listByUser(
					userService.viewByName(cri.getCompany()).getUser_idx()));
		}
		
		
		// 리스트 정렬
		ExtractComparator comparator = new ExtractComparator();
		Collections.sort(classiList, comparator);
		
		// 리스트 회사 추가
		keywordService.viewByKeyword(classiList);
		
		model.addAttribute("classiList", classiList);

		//excelList = classiList;
	}
	
	
	SearchCriteria localCri;
	
	@ResponseBody
	@GetMapping("/excel")
	public ModelAndView excelGET(ModelAndView model, ExcelView excelView, SearchCriteria cri) {
		
		logger.info("cri: " + cri);

		List<ExtractVO> classiList = new ArrayList<ExtractVO>();
		ListUtil listUtil = new ListUtil();

		if(cri.getKeyword() == "" || "undefined".equals(cri.getKeyword()))  {
			logger.info("keyword is null");
			cri.setKeyword(null);
			
		} 
		if(cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey()) ) {
			logger.info("selectKey is null");
			cri.setSelectKey(null);
		}
		
		if("undefined".equals(cri.getStartDate()) || "undefined".equals(cri.getEndDate())) {
			cri.setStartDate(null);
			cri.setEndDate(null);
		
		}else if(cri.getStartDate() != null || cri.getEndDate() != null){ 
			cri.setStartDate(cri.getStartDate() + " 00:00:00"); 
			cri.setEndDate(cri.getEndDate() + " 23:59:59"); 
		}
		
		
		logger.info("cri: " + cri);
		
		localCri = cri;
		
		listUtil.listAddSNSList(classiList, snsService.listAll(cri));
		listUtil.listAddCommunityList(classiList, communityService.listAll(cri));
		listUtil.listAddPortalList(classiList, portalService.listAll(cri));
		listUtil.listAddMediaList(classiList, mediaService.listAll(cri));
		
		ExtractComparator comparator = new ExtractComparator();
		Collections.sort(classiList, comparator);
		
		
		model.addObject("list", classiList);
		model.setView(excelView);
		
		return model;
	}
	
	
	@ResponseBody
	@PostMapping("/insert")
		public void insertPOST(String keyword, String textType, String domain,
				String domainType, String board_number, String title,
				String content, String writer, String writerIP,
				String writeDate, String url) {
		
		logger.info("insert called....");
		
		logger.info(keyword + textType + domain + domainType + board_number + title + content + writer + writerIP + writeDate
				+ url);
		try {
			
			if(domain.equals("sns")) {
				SNSVO vo = new SNSVO();
				vo.setSns_name(domainType);
				vo.setSns_title(title);
				vo.setSns_content(content);
				vo.setWriteDate(writeDate);
				vo.setSns_writer(writer);
				vo.setKeyword(keyword);
				vo.setTextType(textType);
				vo.setUrl(url);
				
				snsService.regist(vo);
				
			}else if(domain.equals("portal")) {
				PortalVO vo = new PortalVO();
				vo.setPortal_name(domainType);
				vo.setPortal_title(title);
				vo.setWriteDate(writeDate);
				vo.setKeyword(keyword);
				vo.setTextType(textType);
				vo.setUrl(url);
				
				portalService.regist(vo);
				
			}else if(domain.equals("media")) {
				MediaVO vo = new MediaVO();
				vo.setMedia_name(domainType);
				vo.setMedia_title(title);
				vo.setMedia_content(content);
				vo.setWriteDate(writeDate);
				vo.setReporter_name(writer);
				vo.setKeyword(keyword);
				vo.setTextType(textType);
				vo.setUrl(url);
				
				mediaService.regist(vo);
				
			}else if(domain.equals("community")) {
				CommunityVO vo = new CommunityVO();
				vo.setCommunity_name(domainType);
				vo.setCommunity_title(title);
				vo.setCommunity_content(content);
				vo.setCommunity_writer(writer);
				vo.setCommunity_writer_IP(writerIP);
				vo.setWriteDate(writeDate);
				vo.setKeyword(keyword);
				vo.setTextType(textType);
				vo.setUrl(url);
				
				communityService.regist(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
		
		
		
	}
	
	/*@GetMapping("/excel")
	public ModelAndView excelGET(ModelAndView model, ExcelView excelView, String url) {
		
		logger.info("excelList: " + excelList);
		logger.info(success);
		model.addObject("list", excelList);
		model.setView(excelView);

		return model;
	}*/
}
