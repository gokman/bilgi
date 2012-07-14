package com.appointment.dao;

import java.util.List;

import com.appointment.model.Appointment;
import com.customer.model.Customer;
import com.lookup.model.LookupMst;
import com.util.search.SearchCriteria;


public interface AppointmentDao {
	// To Save the article detail
	public void saveAppointment( Appointment appointment);
	
	public List<Appointment> listAppointments();
	
	public List<Appointment> listAppointments(Appointment appointment);
	
	public List<Appointment> listAppointments(SearchCriteria searchCriterias);
	
	public Appointment getAppointmentById(long id);
	
	public void updateAppointment (Appointment appointment);
}
