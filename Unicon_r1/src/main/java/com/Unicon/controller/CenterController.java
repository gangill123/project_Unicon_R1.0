package com.Unicon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/center/main")
public class CenterController {

	@GetMapping("")
	public String main(Model model, HttpSession session) {
		
		return "/center/main";
	}
}
