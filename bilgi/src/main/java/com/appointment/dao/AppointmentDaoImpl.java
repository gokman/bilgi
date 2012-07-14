package com.appointment.dao;

import java.util.Date;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.appointment.model.Appointment;
import com.lookup.model.LookupMst;
import com.util.constants.ApplicationConstants;
import com.util.search.SearchCriteria;

@Repository("appointmentDao")
public class AppointmentDaoImpl implements AppointmentDao{

	@Autowired
	private SessionFactory sessionFactory;

	
	public List<Appointment> listAppointments(SearchCriteria searchCriteria){
		Appointment appointment= new Appointment();
		if(!searchCriteria.getSearchCriterias().get(0) .equals(null) && !searchCriteria.getSearchCriterias().get(0) .equals("")){
//			appointment.setName(searchCriteria.getSearchCriterias().get(0));
		}
		if(!searchCriteria.getSearchCriterias().get(1).equals(null)  && !searchCriteria.getSearchCriterias().get(1).equals("")){
//			appointment.setSurname(searchCriteria.getSearchCriterias().get(1));
		}
		return (List<Appointment>)sessionFactory.getCurrentSession().createCriteria(Appointment.class).add(Example.create(appointment)).list();

	}
	
	
	// To Save the article detail
	public void saveAppointment(Appointment appointment) {
		sessionFactory.getCurrentSession().save(appointment);
	}
	
	// To get list of all articles
	@SuppressWarnings("unchecked")
	public List<Appointment> listAppointments() {		
		return (List<Appointment>) sessionFactory.getCurrentSession().createCriteria(Appointment.class).list();
	}
	
	public List<Appointment> listAppointments(Appointment appointment){
		
		return (List<Appointment>) sessionFactory.getCurrentSession().createCriteria(Appointment.class).add(Example.create(appointment)).list();
	}

	@Override
	public Appointment getAppointmentById(long id) {
		List<Appointment> list=(List<Appointment>)sessionFactory.getCurrentSession().createCriteria(Appointment.class).
		add(Restrictions.eq("id", id)).list();
		return list.get(0);
	}


	@Override
	public void updateAppointment(Appointment appointment) {
		
		sessionFactory.getCurrentSession().update(appointment);
		
	}
	
	
}