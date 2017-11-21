package com.java.tutorial.controller;

import java.security.Principal;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/")
	public String index(){
		return "index";
	}
	
	@GetMapping("/user")
	public String user(Principal principal){
		System.out.println(principal.getName());
		return "user";
	}
	
	@GetMapping("/admin")
	public String admin(){
		SecurityContext context = SecurityContextHolder.getContext();
		System.out.println(context.getAuthentication().getName());
		
		return "admin";
	}
	
	@GetMapping("/login")
	public String login(){
		return "login";
	}
}
