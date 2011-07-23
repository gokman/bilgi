package com.util.login.dao;

import java.util.List;

import com.util.membership.model.User;


public interface LoginDao {
	// To Save the article detail
	public void saveUser ( User user);
	
	public void updateMembershipStatus (Long userId);
	// To get list of all articles
	public List<User> listUsers();
	
	public List<User> listUsers(User user);
	
	public List<User> listByUsername(String username);
	
	public List<User> listByEmail (String email);
}
