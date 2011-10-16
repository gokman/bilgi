package com.customer.service;

import java.util.List;

import com.customer.model.Product;

public interface ProductService {

	public void addProduct(Product prod);
	
	public List<Product> listProduct();
}
