package com.lookup.dao;

import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.lookup.model.LookupMst;

@Repository("lookupMstDao")
public class LookupMstDaoImpl implements LookupMstDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveLookupMst(LookupMst lookupMst) {
		
		sessionFactory.getCurrentSession().save(lookupMst);
	}

}
