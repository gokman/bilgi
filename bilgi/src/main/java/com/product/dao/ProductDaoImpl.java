package com.product.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.product.model.Product;

@Repository("productDao")
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveProduct(Product prod) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(prod);
	}

	@SuppressWarnings("unchecked")
	public List<Product> listProducts() {
		// TODO Auto-generated method stub
		return (List<Product>)sessionFactory.getCurrentSession().createCriteria(Product.class).list();
	}

	@Override
	public List<Product> listProdcutss(Product prod) {
		// TODO Auto-generated method stub
		return (List<Product>)sessionFactory.getCurrentSession().createCriteria(Product.class).add(Example.create(prod)).list();
	}

	

}
