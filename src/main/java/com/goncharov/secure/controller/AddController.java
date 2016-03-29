package com.goncharov.secure.controller;


import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goncharov.secure.entity.User;
import com.goncharov.secure.entity.service.UserService;

@Controller

public class AddController {
	@Autowired
	private UserService userServise;
	private static final Logger log = Logger.getLogger(AddController.class.getName());

	@RequestMapping(value = "/user/add", method = RequestMethod.POST)

	public String addContact(@ModelAttribute("user") User user,
			BindingResult result) {
		log.fine(user.toString());
		Timestamp tm = new Timestamp(new Date().getTime());
		user.setTime(tm);
		user.setLocked(true);
		userServise.addUser(user);

		return "redirect:/user/all";
	}

}
