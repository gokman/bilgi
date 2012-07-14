package com.product.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.product.model.Product;
import com.util.search.SearchCriteria;

@Repository("productDao")
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveProduct(Product prod) {
		// TODO Auto-generated method stub
		try {
			sessionFactory.getCurrentSession().save(prod);	
		} catch (Exception e) {
		}
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

	
	public List<Product> listProducts(SearchCriteria searchCriteria){
		Product product= new Product();
		if(!searchCriteria.getSearchCriterias().get(0) .equals(null) && !searchCriteria.getSearchCriterias().get(0) .equals("")){
			product.setSemt(searchCriteria.getSearchCriterias().get(0));
		}
		if(!searchCriteria.getSearchCriterias().get(1).equals(null)  && !searchCriteria.getSearchCriterias().get(1).equals("")){
			product.setEbat(Long.parseLong((searchCriteria.getSearchCriterias().get(1))));
		}
		return (List<Product>)sessionFactory.getCurrentSession().createCriteria(Product.class).add(Example.create(product)).list();

	}
	@Override
	public List<Product> getProductById(long id) {
		List<Product> list=(List<Product>)sessionFactory.getCurrentSession().createCriteria(Product.class).
		add(Restrictions.eq("id", id)).list();
		return list;
	}	
}
