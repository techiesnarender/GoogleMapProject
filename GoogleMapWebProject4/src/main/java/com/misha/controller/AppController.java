package com.misha.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.misha.model.SitterRegistration;
import com.misha.service.MyUserDetails;
import com.misha.service.SitterService;


@Controller
public class AppController {
	
	@Autowired
	private SitterService service;
	
	public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/webapp/images";
	
	@GetMapping(value = {"/","/home"})
	public String homePage() {
		return "welcome";
	}
	
	@GetMapping("/register")
	public String dogSitterRegistration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		 return "registrationPage";
	}
	
	@GetMapping("/search")
	public String searchSitter(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		 return "searchSitter";
	}
	
	@PostMapping("/saveDogSitter")
	public String saveDogSitterReg(@ModelAttribute("dogsitter") SitterRegistration registration, BindingResult bindingResult, @RequestParam("logo") MultipartFile file) {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		LocalDateTime now = LocalDateTime.now();
		String datetime = dtf.format(now);
		
		StringBuilder fileNames = new StringBuilder();
		String filename=registration.getContactname() + datetime + file.getOriginalFilename().substring(file.getOriginalFilename().length()-4);
		Path fileNameAndPath =Paths.get(uploadDirectory,filename);
		try{
		Files.write(fileNameAndPath, file.getBytes());
		}catch (IOException e) {
		e.printStackTrace();
		}
		registration.setLogo(filename);
		
		service.saveSitter(registration);
		//request.setAttribute("mode", "MODE_HOME");
		return "welcome";
	}
	
	/*
	 * @GetMapping("/profileupdate") public String
	 * profileDetailsUpdate(SitterRegistration user, @AuthenticationPrincipal
	 * MyUserDetails loogedUser,
	 * 
	 * @RequestParam("logo") MultipartFile file) throws IOException {
	 * if(!file.isEmpty()) { String fileName =
	 * StringUtils.cleanPath(file.getOriginalFilename()); user.setLogo(fileName);
	 * SitterRegistration savedSitter; }
	 * 
	 * return ""; }
	 */
	
	@GetMapping("/searchsitter")
	public String showSearch(HttpServletRequest request, @Param("address") String address, @Param("latitude") String latitude, @Param("longitude") String longitude) {
		request.setAttribute("sitter", service.showAllSitterNearByMe(address, latitude, longitude));
		request.setAttribute("address", address);
		request.setAttribute("latitude", latitude);
		request.setAttribute("longitude", longitude);
		return "searchSitter";
	}
	
	@GetMapping("/admin/sitterlist")
	public String sitterRecords(HttpServletRequest request) {
		request.setAttribute("sitters", service.showAllSitter());
		request.setAttribute("mode", "ALL_SITTERS");
		return "sitterRecords";
	}
	
	@GetMapping("/profile")
	public String sitterProfile(HttpServletRequest request, @AuthenticationPrincipal MyUserDetails user ) {
		request.setAttribute("user",user);
		 return "sitterProfile";
	}
	
	
	/*
	 * @GetMapping("/login") public String sitterLogin(HttpServletRequest request) {
	 * request.setAttribute("mode", "MODE_LOGIN"); return "loginPage"; }
	 */
	
	@GetMapping("/403")
	public String error403() {
		return "403";
	}

}
