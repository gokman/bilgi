package com.util.login.service;

import java.util.List;

import com.util.membership.model.User;

public interface LoginService {

		public void addUser(User user);
		
		public void updateMembershipStatus(Long userID); 
		
		public List<User> listUsers();
		
		public List<User> getByUsername(String username);
		
		public List<User> getByEmail (String email);
		
		public User getWaitingMember(User user);
		
		public User getUser(User user) ;

		public List<User> listActiveCustomers();
	}