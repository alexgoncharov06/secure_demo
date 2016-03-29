package com.goncharov.secure.entity.service;

import java.util.List;

import com.goncharov.secure.entity.User;

public interface UserService {
	 
    User getUser(String login);
    
    void addUser(User user);
    User update(User user);
    List<User> getAll();
    void deleteUser(User user);
 
}
