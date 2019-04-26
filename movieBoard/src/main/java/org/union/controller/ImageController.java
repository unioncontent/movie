package org.union.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/image/*")
public class ImageController {
	@GetMapping("/imageView") public void imageViewGET() throws SQLException {
		
	}
}
