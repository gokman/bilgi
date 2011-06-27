package com.util.login.service;

import java.util.List;

import com.util.membership.model.User;

public interface LoginService {

		public void addUser(User user);

		public List<User> listUsers();
		
		public List<User> getByUsername(String nickname);
	}