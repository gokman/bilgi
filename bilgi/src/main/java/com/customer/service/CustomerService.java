package com.customer.service; 
 
import java.util.List; 
 
import com.customer.model.Customer; 
import com.lookup.model.LookupMst; 
import com.util.search.SearchCriteria;
 
public interface CustomerService { 
 
        public void addCustomer(Customer customer); 
         
        public List<Customer> listCustomers(); 
        
        public List<Customer> listCustomers(SearchCriteria searchCriterias);
         
        public List<Customer> getByEmail (String email); 
         
        public Customer getById(long id); 
     
        public void updateCustomer(Customer cust);
        
    }