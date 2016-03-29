package com.goncharov.secure.controller;

import com.goncharov.secure.entity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.logging.Logger;



@RestController
public class UsersRestController {
	
	
	 
	 
	@Autowired
	private UserService userServise;
	private static final Logger log = Logger.getLogger(UsersRestController.class.getName());

	
    
    
	
	@RequestMapping(value = "/user/getall", method = RequestMethod.POST)
	public ResponseEntity<List<com.goncharov.secure.entity.User>> getAllUsers(Model model){
		List<com.goncharov.secure.entity.User> allUsers = userServise.getAll();
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.setContentType(MediaType.APPLICATION_JSON);
	    responseHeaders.add("Access-Control-Allow-Origin", "*"); // also added header to allow cross domain request for any domain
	    return new ResponseEntity<List<com.goncharov.secure.entity.User>>(allUsers, responseHeaders, HttpStatus.OK);
		
	
	}
	
	@RequestMapping(value = "/user/edit", method = RequestMethod.POST)
	public ResponseEntity<com.goncharov.secure.entity.User>editUsers(@RequestBody com.goncharov.secure.entity.User input){
		com.goncharov.secure.entity.User newUser =  userServise.update(input);
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.setContentType(MediaType.APPLICATION_JSON);
	    responseHeaders.add("Access-Control-Allow-Origin", "*"); // also added header to allow cross domain request for any domain
	    return new ResponseEntity<com.goncharov.secure.entity.User>(newUser, responseHeaders, HttpStatus.OK);
		
		
	}
	
	@RequestMapping(value = "/user/delete", method = RequestMethod.POST)
	public ResponseEntity<String>deleteUsers(@RequestBody com.goncharov.secure.entity.User input){
		userServise.deleteUser(input);
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.setContentType(MediaType.APPLICATION_JSON);
//	    responseHeaders.add("Access-Control-Allow-Origin", "*"); // also added header to allow cross domain request for any domain
	    return new ResponseEntity<String>("{\"status\":\"ok\"}", responseHeaders, HttpStatus.OK);
		
		
	}


	
	
}
