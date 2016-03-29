package com.goncharov.secure.entity.service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.goncharov.secure.dao.Factory;
import com.goncharov.secure.entity.User;

@Service
public class UserServiceImpl implements UserService {
	private static final Logger log = Logger.getLogger(UserServiceImpl.class
			.getName());
	
	
	 @Transactional
    public User getUser(String login) {
        User user = null;
        Factory.getInstance();
		try {
			user = (User) Factory.getLoginDAO().getByLogin(login);
		} catch (SQLException e) {
			log.severe(e.toString());
		}
		
        return user;
    }

	 @Transactional
	public void addUser(User user) {
		 Factory.getInstance();
		log.info(user.toString());
		 String pass = "";
		 try {
			 pass = encryptPassword(user.getPassword());
			 user.setPassword(pass);
			 Factory.getLoginDAO().add(user);
		} catch (SQLException e) {
			log.severe(e.getMessage());
		} catch (NoSuchAlgorithmException e) {
			log.severe(e.getMessage());
		} catch (UnsupportedEncodingException e) {
			log.severe(e.getMessage());
		} 
	}
	 
	 private static String encryptPassword(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {

		    MessageDigest crypt = MessageDigest.getInstance("SHA-1");
		    crypt.reset();
		    crypt.update(password.getBytes("UTF-8"));

		    return new BigInteger(1, crypt.digest()).toString(16);
		}
	 
	 
	 public List<User> getAll(){
		 List<User> allUsers = null;
		 try{
			 Factory.getInstance();
			allUsers = Factory.getLoginDAO().getAll();
		 } catch (SQLException e) {
				log.severe(e.getMessage());
			} 
		return allUsers;
		 
		 
		 
	 }

	@Override
	public User update(User user) {
		User newUser = new User();
		 Factory.getInstance();
			log.info(user.toString());
			 String pass = "";
			 try {
				 
				 Factory.getLoginDAO().update(user);
				 newUser = Factory.getLoginDAO().getById(user.getId());
			} catch (SQLException e) {
				log.severe(e.getMessage());
			}  
			 
		return newUser;
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		Factory.getInstance();
		log.info("delete" + user.toString());
		try {
			 
			 Factory.getLoginDAO().delete(user);
		} catch (SQLException e) {
			log.severe(e.getMessage());
		}  
		 
		
		
	}
}