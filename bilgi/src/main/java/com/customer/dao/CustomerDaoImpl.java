package com.customer.dao;

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

import com.customer.model.Customer;
import com.lookup.model.LookupMst;
import com.util.constants.ApplicationConstants;
import com.util.search.SearchCriteria;

@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao{

	@Autowired
	private SessionFactory sessionFactory;

	
	public List<Customer> listCustomers(SearchCriteria searchCriteria){
		Customer customer = new Customer();
		if(!searchCriteria.getSearchCriterias().get(0) .equals(null) && !searchCriteria.getSearchCriterias().get(0) .equals("")){
			customer.setName(searchCriteria.getSearchCriterias().get(0));
		}
		if(!searchCriteria.getSearchCriterias().get(1).equals(null)  && !searchCriteria.getSearchCriterias().get(1).equals("")){
			customer.setSurname(searchCriteria.getSearchCriterias().get(1));
		}
		return (List<Customer>)sessionFactory.getCurrentSession().createCriteria(Customer.class).add(Example.create(customer)).list();

	}
	
	
	// To Save the article detail
	public void saveCustomer(Customer cust) {
		sessionFactory.getCurrentSession().save(cust);
	}
	
	// To get list of all articles
	@SuppressWarnings("unchecked")
	public List<Customer> listCustomers() {		
		return (List<Customer>) sessionFactory.getCurrentSession().createCriteria(Customer.class).list();
	}
	
	public List<Customer> listCustomers(Customer cust){
		
		return (List<Customer>) sessionFactory.getCurrentSession().createCriteria(Customer.class).add(Example.create(cust)).list();
	}

	public List<Customer> listByEmail(String email){
		Customer customer = new Customer();
		customer.setEmail(email);
		List<Customer> customerList = sessionFactory.getCurrentSession().createCriteria(Customer.class).add(Example.create(customer)).list();
		
		return  customerList;
		
	}

	@Override
	public Customer getCustomerById(long id) {
		List<Customer> list=(List<Customer>)sessionFactory.getCurrentSession().createCriteria(Customer.class).
		add(Restrictions.eq("id", id)).list();
		return list.get(0);
	}


	@Override
	public void updateCustomer(Customer cust) {
		
		sessionFactory.getCurrentSession().update(cust);
		
	}
	
	
}