package com.appointment.service; 
 
import java.util.List; 
 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service; 
import org.springframework.transaction.annotation.Propagation; 
import org.springframework.transaction.annotation.Transactional; 
 
import com.appointment.dao.AppointmentDao;
import com.appointment.model.Appointment;
import com.util.search.SearchCriteria;
 
@Service("appointmentService") 
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true) 
public class AppointmentServiceImpl implements AppointmentService{ 
 
    @Autowired 
    private AppointmentDao appointmentDao; 
 
    public AppointmentServiceImpl() { 
    } 
 
 
 
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
    public void addAppointment(Appointment appointment) { 
    	appointmentDao.saveAppointment(appointment); 
    } 
 
    public List<Appointment> listAppointments() { 
        return appointmentDao.listAppointments(); 
    } 
 
    
    @Override 
    public Appointment getById(long id) { 
        // TODO Auto-generated method stub 
        return appointmentDao.getAppointmentById(id); 
    } 

	@Override
	public List<Appointment> listAppointmentsByCustomer(Long customerID) {
		return appointmentDao.listAppointmentsByCustomerID(customerID);
	}    
    
    public List<Appointment> listAppointments(SearchCriteria searchCriterias){
    	return appointmentDao.listAppointments(searchCriterias);
    }
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
    public void updateAppointment(Appointment appointment) {
    	appointmentDao.updateAppointment(appointment);
        
    }
    
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
    public void deleteAppointment(Appointment appointment) {
    	appointmentDao.deleteAppointment(appointment);
        
    }
}