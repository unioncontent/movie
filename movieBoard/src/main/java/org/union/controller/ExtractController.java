package org.union.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.MediaVO;
import org.union.domain.PageMaker;
import org.union.domain.PortalVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.service.CommunityService;
import org.union.service.MediaService;
import org.union.service.PortalService;
import org.union.service.SNSService;
import org.union.util.ExtractComparator;
import org.union.util.ListUtil;

@Controller
@RequestMapping("/extract/*")
public class ExtractController {

	
	private static Logger logger = LoggerFactory.getLogger(ExtractController.class);
	
	
	
	@Autowired
	private SNSService snsService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private PortalService portalService;
	
	@Autowired
	private MediaService mediaService;
	
	
	
	@GetMapping("/extract")
	public void extractGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("extractGET called....");
		
		if(cri.getSelectKey() != null) {
			if(cri.getSelectKey().equals("�궎�썙�뱶")) {
				cri.setSelectKey(null);
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		// 4踰� 由ъ뒪�듃湲� �븣臾몄뿉  perPageNum / 4
		if(cri.getPerPageNum() != 10) {
			cri.setPerPageNum(cri.getPerPageNum()/4);
		}
		
		logger.info("cri: " + cri);
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(snsService.getExtractCount(cri) 
								+ communityService.getExtractCount(cri)
								+ portalService.getExtractCount(cri)
								+ mediaService.getExtractCount(cri));
		logger.info("pageMaker: " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ExtractVO> extractList = new ArrayList<ExtractVO>();
		ListUtil listUtil = new ListUtil();
		
		listUtil.listAddList(extractList, snsService.listExtract(cri));
		listUtil.listAddList(extractList, communityService.listExtract(cri));
		listUtil.listAddList(extractList, portalService.listExtract(cri));
		listUtil.listAddList(extractList, mediaService.listExtract(cri));

		ExtractComparator comparator = new ExtractComparator();
		Collections.sort(extractList, comparator);
		model.addAttribute("extractList", extractList);
	}
	
	
	@ResponseBody
	@PostMapping("insert")
	public String insertPOST(Integer idx, String table, String textType) {
		logger.info("insertPOST called....");
		
		logger.info("idx: " + idx);
		logger.info("table: " + table);
		logger.info("textType: " + textType );
		
		if("sns".equals(table)) {
			logger.info("sns");
			SNSVO vo = new SNSVO();
			vo.setSns_idx(idx);
			vo.setTextType(textType);
			
			snsService.modifyTextType(vo);
			
		}else if("media".equals(table) ){
			logger.info("media");
			MediaVO vo = new MediaVO();
			vo.setMedia_idx(idx);
			vo.setTextType(textType);
			
			mediaService.modifyType(vo);
			
		}else if ("portal".equals(table)) {
			logger.info("portal");
			PortalVO vo = new PortalVO();
			vo.setPortal_idx(idx);
			vo.setTextType(textType);
			
			portalService.modifyType(vo);
			
		}else if ("community".equals(table)) {
			logger.info("community");
			CommunityVO vo = new CommunityVO();
			vo.setCommunity_idx(idx);
			vo.setTextType(textType);

			communityService.modifyType(vo);
		
		}
		
		return "success";
	}
	
	
	@ResponseBody
	@PostMapping("/remove")
	public String removePOST(Integer idx, String table) {
		logger.info("removePOST called....");
		
		logger.info("idx: " + idx);
		logger.info("table: " + table);
		
		if("sns".equals(table)) {
			logger.info("sns");
			snsService.remove(idx);
			
		}else if("media".equals(table) ){
			logger.info("media");
			mediaService.remove(idx);
			
		}else if ("portal".equals(table)) {
			logger.info("portal");
			portalService.remove(idx);
			
		}else if ("community".equals(table)) {
			logger.info("community");
			communityService.remove(idx);
		}
		
		return "success";
	}
}
