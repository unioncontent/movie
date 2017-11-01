package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/portal/*")
public class PortalController {

	
	private static Logger logger = LoggerFactory.getLogger(PortalController.class);
	
	
	@GetMapping("/naver")
	public void naverGET() {
		logger.info("naverGET called....");
		
	}
	
	@GetMapping("/viral")
	public void viralGET() {
		logger.info("viralGET called....");
	}
}
