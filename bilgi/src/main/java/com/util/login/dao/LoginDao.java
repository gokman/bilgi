package com.util.login.dao;

import java.util.List;

import com.util.membership.model.User;


public interface LoginDao {
	// To Save the article detail
	public void saveUser ( User user);
	
	// To get list of all articles
	public List<User> listUsers();
	
	public List<User> listByNickname(String nickname);
}
