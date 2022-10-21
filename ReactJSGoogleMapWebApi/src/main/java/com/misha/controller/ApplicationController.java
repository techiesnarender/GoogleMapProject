package com.misha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api")
public class ApplicationController {
	
	@GetMapping(value = {"/","/home"})
	public void HomoPage() {
		System.out.print("App Controller");
	}
		
}
