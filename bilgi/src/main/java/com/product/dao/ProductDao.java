package com.product.dao;

import java.util.List;

import com.product.model.Product;
import com.util.search.SearchCriteria;

public interface ProductDao {
	
	public void saveProduct (Product prod);
	
	public List<Product> listProducts();
	
	public List<Product> listProdcutss(Product prod);

	public List<Product> listProducts(SearchCriteria searchCriterias);
	
	public List<Product> getProductById(long id);
	
}
