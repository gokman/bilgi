package com.customer.demand.dao;

import java.util.Date;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.customer.demand.model.CustomerDemand;
import com.customer.model.Customer;
import com.lookup.model.LookupMst;
import com.util.constants.ApplicationConstants;
import com.util.search.SearchCriteria;

@Repository("customerDemandDao")
public class CustomerDemandDaoImpl implements CustomerDemandDao{

	@Autowired
	private SessionFactory sessionFactory;

	
	// To Save the article detail
	public void saveCustomerDemand(CustomerDemand cust) {
		sessionFactory.getCurrentSession().save(cust);
	}


	
}