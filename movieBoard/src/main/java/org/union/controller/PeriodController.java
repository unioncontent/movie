package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/period/*")
public class PeriodController {

	
	private static Logger logger= LoggerFactory.getLogger(PeriodController.class);
	
	
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
	public void mediaGET() {
		logger.info("mediaGET called....");
	}
	
	
	@GetMapping("/sns")
	public void snsGET() {
		logger.info("snsGET called....");
	}
}
