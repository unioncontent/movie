package org.union.controller;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.union.domain.PeriodMediaVO;
import org.union.domain.SearchCriteria;
import org.union.service.MediaService;
import org.union.util.PeriodComparator;

@Controller
@RequestMapping("/period/*")
public class PeriodController {

	private static Logger logger = LoggerFactory.getLogger(PeriodController.class);

	@Autowired
	private MediaService mediaService;

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
		logger.info("mediaGET called....");
		List<PeriodMediaVO> mediaList = mediaService.periodMedia(cri);
		List<PeriodMediaVO> reporterList = mediaService.periodReporter(cri);

		// 정렬
		PeriodComparator comparator = new PeriodComparator();
		Collections.sort(mediaList, comparator);
		Collections.sort(reporterList, comparator);
		
		model.addAttribute("mediaCount", mediaList.size());
		model.addAttribute("pressCount", reporterList.size());
		model.addAttribute("totalCount", mediaService.getTotalCount());
		
		mediaList = mediaList.subList(0, 20);
		reporterList = reporterList.subList(0, 20);
		
		model.addAttribute("pressList", reporterList);
		model.addAttribute("mediaList", mediaList);
		
	}

	@GetMapping("/sns")
	public void snsGET() {
		logger.info("snsGET called....");
	}
}
