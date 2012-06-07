package com.customer.dao;

import java.util.List;

import com.customer.model.Customer;
import com.lookup.model.LookupMst;
import com.util.search.SearchCriteria;


public interface CustomerDao {
	// To Save the article detail
	public void saveCustomer ( Customer cust);
	
	public List<Customer> listCustomers();
	
	public List<Customer> listCustomers(Customer cust);
	
	public List<Customer> listByEmail (String email);

	public List<Customer> listCustomers(SearchCriteria searchCriterias);
	
	public List<Customer> getCustomerById(long id);
	
	public void updateCustomer(Customer cust);
}
