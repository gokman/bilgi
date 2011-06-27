package com.util.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.util.login.dao.LoginDao;
import com.util.membership.model.User;

@Service("loginService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao loginDao;

	public LoginServiceImpl() {
	}



	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addUser(User user) {
		loginDao.saveUser(user);
	}

	public List<User> listUsers() {
		return loginDao.listUsers();
	}



	public List<User> getByUsername(String nickname) {
		return loginDao.listByNickname(nickname);
	}

}
