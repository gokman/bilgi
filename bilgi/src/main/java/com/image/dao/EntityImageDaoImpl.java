package com.image.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.image.model.EntityImage;
import com.util.constants.ApplicationConstants;

@Repository("imageDao")
public class EntityImageDaoImpl implements EntityImageDao{

	@Autowired
	private SessionFactory sessionFactory;

	// To Save the article detail
	public void saveEntityImage(EntityImage entityImage) {
		sessionFactory.getCurrentSession().save(entityImage);
	}
	
	// To get list of all articles
	@SuppressWarnings("unchecked")
	public List<EntityImage> listImages() {		
		return (List<EntityImage>) sessionFactory.getCurrentSession().createCriteria(EntityImage.class).list();
	}
	
	public List<EntityImage> listImages(EntityImage entityImage){
		
		return (List<EntityImage>) sessionFactory.getCurrentSession().createCriteria(EntityImage.class).add(Example.create(entityImage)).list();
	}

}
