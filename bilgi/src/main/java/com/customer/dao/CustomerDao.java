package com.customer.dao;

import java.util.List;

import com.customer.model.Customer;


public interface CustomerDao {
	// To Save the article detail
	public void saveCustomer ( Customer cust);
	
	public List<Customer> listCustomers();
	
	public List<Customer> listCustomers(Customer cust);
	
	public List<Customer> listByEmail (String email);
}
