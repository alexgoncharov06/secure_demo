package com.goncharov.secure.controller;

import com.goncharov.secure.entity.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class MainController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String start(Model model) {

		return "index";
	}

//	@RequestMapping(value = "/map", method = RequestMethod.GET)
//	public String mapPage1(Model model) {
//
//		return "mapwithdata";
//	}
	
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView mapPage(Model model) {
		ModelAndView modelAndView = new ModelAndView();

		User activeUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

		modelAndView.addObject("user", activeUser);
		if (activeUser != null) {
		modelAndView.setViewName("mapwithdata");
		} else {
			
			modelAndView.setViewName("index");
		}
		return modelAndView;
	}
	
	

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView editPage(Model model) {
		ModelAndView modelAndView = new ModelAndView();

		User activeUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

		modelAndView.addObject("user", activeUser);
		if (activeUser != null && activeUser.getRole().toString().equals("ADMIN")) {
		modelAndView.setViewName("edit");
		} else {
			
			modelAndView.setViewName("index");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView viewPage(Model model) {
		ModelAndView modelAndView = new ModelAndView();

		User activeUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		if (activeUser != null) {
		modelAndView.addObject("user", activeUser);

		modelAndView.setViewName("view");
		} else {
			modelAndView.setViewName("index");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/archive", method = RequestMethod.GET)
	public String archivePage(Model model) {

		return "archive";
	}

	@RequestMapping(value = "/instruction", method = RequestMethod.GET)
	public ModelAndView instructionPage(Model model) {
		ModelAndView modelAndView = new ModelAndView();

		User activeUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		if (activeUser != null) {
			modelAndView.addObject("user", activeUser);

			modelAndView.setViewName("instruction");
		} else {
			modelAndView.setViewName("index");
		}

		return modelAndView;
	}


}
