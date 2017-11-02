package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/listAll/*")
public class ListAllController {

	
	private static Logger logger = LoggerFactory.getLogger(ListAllController.class);
	
	
	@GetMapping("/listAll")
	public void listAllGET() {
		logger.info("listAllGET called....");
	}
}
