package com.customer.demand.service; 
 
import java.util.List; 
 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service; 
import org.springframework.transaction.annotation.Propagation; 
import org.springframework.transaction.annotation.Transactional; 
 
import com.customer.dao.CustomerDao; 
import com.customer.demand.dao.CustomerDemandDao;
import com.customer.demand.model.CustomerDemand;
import com.customer.model.Customer; 
import com.util.search.SearchCriteria;
 
@Service("customerDemandService") 
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true) 
public class CustomerDemandServiceImpl implements CustomerDemandService{ 
 
    @Autowired 
    private CustomerDemandDao customerDemandDao; 
 
    public CustomerDemandServiceImpl() { 
    } 
 
 
 
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
    public void addCustomer(CustomerDemand customer) { 
        customerDemandDao.saveCustomerDemand(customer); 
    } 
 
    
}