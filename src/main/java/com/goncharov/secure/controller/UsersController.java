package com.goncharov.secure.controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goncharov.secure.entity.User;
import com.goncharov.secure.entity.service.UserService;


@Controller

public class UsersController {
	@Autowired
	private UserService userServise;
	private static final Logger log = Logger.getLogger(UsersController.class.getName());

	
	@RequestMapping(value = "/user/", method = RequestMethod.GET)
	public String addUserPage(Model model) {
		return "addUser";
	}
	
	@RequestMapping(value = "/user/all", method = RequestMethod.GET)
	public String allUsersPage(Model model) {
		return "allusers";
	}

}