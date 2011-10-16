package com.customer.dao;

import java.util.List;
import com.customer.model.Product;

public interface ProductDao {
	
	public void saveProduct (Product prod);
	
	public List<Product> listProducts();
	
	public List<Product> listProdcutss(Product prod);
	
}
