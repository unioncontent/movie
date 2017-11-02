package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashBoard/*")
public class DashBaordController {

	private static Logger logger = LoggerFactory.getLogger(DashBaordController.class);
	
	
	@GetMapping("/dashBoard")
	public void dashBoardGET() {
		logger.info("dashBaordGET called....");
	}
}
