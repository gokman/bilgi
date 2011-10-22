package com.product.service;

import java.util.List;

import com.product.model.Product;

public interface ProductService {

	public void addProduct(Product prod);
	
	public List<Product> listProduct();
}
