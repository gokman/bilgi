package com.product.service;

import java.util.List;

import com.product.model.Product;
import com.util.search.SearchCriteria;

public interface ProductService {

	public void addProduct(Product prod);

    public List<Product> listProducts(SearchCriteria searchCriterias);
	
	public List<Product> listProduct();
	
    public List<Product> getById(long id); 

}
