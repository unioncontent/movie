package org.union.controller;

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
import org.union.domain.PageMaker;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;
import org.union.service.ReporterService;

@Controller
@RequestMapping("/media/*")
public class MediaController {

	
	@Autowired
	private ReporterService reporterService;
	
	private static Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	
	@GetMapping("/news")
	public void newsGET() {
		logger.info("newsGET called....");
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
}
