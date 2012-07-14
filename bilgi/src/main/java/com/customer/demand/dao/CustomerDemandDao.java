package com.customer.demand.dao;

import java.util.List;

import com.customer.demand.model.CustomerDemand;
import com.customer.model.Customer;
import com.lookup.model.LookupMst;
import com.util.search.SearchCriteria;


public interface CustomerDemandDao {
	// To Save the article detail
	public void saveCustomerDemand ( CustomerDemand cust);
	
}
