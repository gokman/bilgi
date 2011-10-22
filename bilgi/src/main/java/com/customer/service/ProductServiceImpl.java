package com.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.customer.dao.ProductDao;
import com.customer.model.Customer;
import com.customer.model.Product;

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
}
