package com.blogApp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Welcome {

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String logout(HttpServletRequest request,
			HttpServletResponse response) {
		return "welcome";
	}
	
	@RequestMapping(value = "/blogAppDashBoard", method = RequestMethod.GET)
	public String dashBoard(HttpServletRequest request,
			HttpServletResponse response) {
		return "blogAppDashBoard";
	}
}
