package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.customer.model.Customer;
import com.product.dao.ProductDao;
import com.product.model.Product;
import com.util.search.SearchCriteria;

@Service("productService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ProductServiceImpl implements ProductService{

	@Autowired
	public ProductDao productDao;
	
	public ProductServiceImpl(){
		
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addProduct(Product prod) {
		productDao.saveProduct(prod);
	}

	public List<Product> listProduct() {
		return productDao.listProducts();
	}

    @Override 
    public List<Product> getById(long id) { 
        return productDao.getProductById(id); 
    } 
    
    public List<Product> listProducts(SearchCriteria searchCriterias){
    	return productDao.listProducts(searchCriterias);
    }	
}
