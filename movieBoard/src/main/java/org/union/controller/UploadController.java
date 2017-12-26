package org.union.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.union.util.UploadFileUtils;

@Controller
@RequestMapping
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@PostMapping("/uploadFile")
	@ResponseBody
	public void uploadFile(MultipartFile file, Model model) throws Exception {

		logger.info("uploadFile called....");
		UUID uid = UUID.randomUUID();
		
		String fileName = file.getOriginalFilename();
		String uploadName = uid + "_" + fileName;

		FileOutputStream fos = new FileOutputStream("C:\\img\\" + uploadName);
		
		IOUtils.copy(file.getInputStream(), fos);
		model.addAttribute("uploadName", uploadName);
		fos.close();
		
		logger.info("uploadName :"+uploadName);

	}

	@GetMapping(value = "classification/show", produces = {"image/jpg", "image/jpeg" })
	public @ResponseBody byte[] show(String name) throws Exception {

		InputStream in = new FileInputStream("C:\\img\\" + name);
		// OutputStream out = new ByteArrayOutputStream();

		return IOUtils.toByteArray(in);

	}

	@Resource(name = "uploadPath")
	private String uploadPath;


	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		logger.info(uploadPath);
		
//		return new ResponseEntity<String>(file.getOriginalFilename(),HttpStatus.CREATED);

		logger.info(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
		
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}
	
}
