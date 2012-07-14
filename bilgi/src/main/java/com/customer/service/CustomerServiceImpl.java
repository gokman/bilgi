package com.customer.service; 
 
import java.util.List; 
 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service; 
import org.springframework.transaction.annotation.Propagation; 
import org.springframework.transaction.annotation.Transactional; 
 
import com.customer.dao.CustomerDao; 
import com.customer.model.Customer; 
import com.util.search.SearchCriteria;
 
@Service("customerService") 
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true) 
public class CustomerServiceImpl implements CustomerService{ 
 
    @Autowired 
    private CustomerDao customerDao; 
 
    public CustomerServiceImpl() { 
    } 
 
 
 
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
    public void addCustomer(Customer customer) { 
        customerDao.saveCustomer(customer); 
    } 
 
    public List<Customer> listCustomers() { 
        return customerDao.listCustomers(); 
    } 
 
    
    public List<Customer> getByEmail(String email) { 
        return customerDao.listByEmail(email); 
    } 
 
 
 
    @Override 
    public Customer getById(long id) { 
        // TODO Auto-generated method stub 
        return customerDao.getCustomerById(id); 
    } 
    
    public List<Customer> listCustomers(SearchCriteria searchCriterias){
    	return customerDao.listCustomers(searchCriterias);
    }
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
    public void updateCustomer(Customer cust) {
        customerDao.updateCustomer(cust);
        
    }    
}