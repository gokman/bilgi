package com.appointment.service; 
 
import java.util.List; 
 
import com.appointment.model.Appointment; 

import com.util.search.SearchCriteria;
 
public interface AppointmentService { 
 
        public void addAppointment(Appointment appointment); 
         
        public List<Appointment> listAppointments(); 
        
        public List<Appointment> listAppointments(SearchCriteria searchCriterias);
        
        public List<Appointment> listAppointmentsByCustomer(Long customerID); 
         
        public Appointment getById(long id); 
     
        public void updateAppointment (Appointment appointment);
        
        public void deleteAppointment (Appointment appointment);
        
    }