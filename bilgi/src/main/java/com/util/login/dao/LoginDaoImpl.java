package com.util.login.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
	
	public void updateMembershipStatus(Long userID){
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction = null;
		try {
		transaction = session.beginTransaction();
		User user = (User) session.get(User.class, userID);
		user.setMembershipStatus(ApplicationConstants.MEMBERSHIP_STATUS_CODES.ACTIVE);
		session.update(user);
		session.flush();
		transaction.commit();
		} catch (HibernateException e) {
		transaction.rollback();
		e.printStackTrace();
		} finally {
			
		}
	}
	
	// To get list of all articles
	@SuppressWarnings("unchecked")
	public List<User> listUsers() {		
		return (List<User>) sessionFactory.getCurrentSession().createCriteria(User.class).list();
	}
	
	public List<User> listUsers(User user){
		
		return (List<User>) sessionFactory.getCurrentSession().createCriteria(User.class).add(Example.create(user)).list();
	}

	public List<User> listByUsername(String username) {
		User user = new User();
		user.setUsername(username);
		user.setMembershipStatus(ApplicationConstants.MEMBERSHIP_STATUS_CODES.ACTIVE);
		List<User> userList = sessionFactory.getCurrentSession().createCriteria(User.class).add(Example.create(user)).list();
		
		return  userList;

	}	
	public List<User> listByEmail(String email){
		User user = new User();
		user.setEmail(email);
		user.setMembershipStatus(ApplicationConstants.MEMBERSHIP_STATUS_CODES.ACTIVE);
		List<User> userList = sessionFactory.getCurrentSession().createCriteria(User.class).add(Example.create(user)).list();
		
		return  userList;
		
	}
	
	
	
}
