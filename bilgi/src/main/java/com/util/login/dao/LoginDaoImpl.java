package com.util.login.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.util.constants.ApplicationConstants;
import com.util.membership.model.User;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SessionFactory sessionFactory;

	// To Save the article detail
	public void saveUser(User user) {
		user.setDateOfBirth(null);
		user.setUserId(new Long(1));
		sessionFactory.getCurrentSession().save(user);
	}
	
	// To get list of all articles
	@SuppressWarnings("unchecked")
	public List<User> listUsers() {		
		return (List<User>) sessionFactory.getCurrentSession().createCriteria(User.class).list();
	}

	public List<User> listByNickname(String nickname) {
		User user = new User();
		user.setNickName(nickname);
		user.setMembershipStatus(ApplicationConstants.MEMBERSHIP_STATUS_CODES.ACTIVE);
		List<User> userList = sessionFactory.getCurrentSession().createCriteria(User.class).add(Example.create(user)).list();
		
		return  userList;

	}	
	
	
	
}
