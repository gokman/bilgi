package com.customer.service;

import java.util.List;

import com.customer.model.Customer;

public interface CustomerService {

		public void addCustomer(Customer customer);
		
		public List<Customer> listCustomers();
		
		public List<Customer> getByEmail (String email);
		
	}