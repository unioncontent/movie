package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/*")
public class ManageController {

	
	private static Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	
	@GetMapping("/company")
	public void companyGET() {
		logger.info("companyGET called....");
	}
	
	@GetMapping("/monitor")
	public void monitorGET() {
		logger.info("monitorGET called....");
	}
	
}
