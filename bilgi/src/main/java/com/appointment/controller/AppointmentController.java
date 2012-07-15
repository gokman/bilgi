package com.appointment.controller;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Hibernate;

import com.appointment.dao.AppointmentDao;
import com.appointment.model.Appointment;
import com.appointment.service.AppointmentService;
import com.customer.model.Customer;
import com.customer.service.CustomerService;
import com.image.model.EntityImage;
import com.util.search.SearchCriteria;
import com.util.validator.AppointmentValidator;
import com.util.validator.CustomerValidator;
import com.util.constants.ApplicationConstants;
import com.util.constants.ApplicationUtil;
import com.util.login.check.LoginCheck;


@Controller
@RequestMapping("/appointment")
public class AppointmentController{

	@Autowired
	private CustomerService customerService;

	@Autowired
	private AppointmentService appointmentService;
	
	private LoginCheck loginInfo = new LoginCheck();

	@RequestMapping(value = "/getCustomerForm4Appointment.htm",method = RequestMethod.GET) 
	public ModelAndView getCustomerForm4Appoinment(@ModelAttribute("searchCriterias") SearchCriteria searchCriteria,BindingResult result) {
		
	    ModelAndView mv = new ModelAndView("appointment/customerForm4Appointment");
	    loginInfo.getUserInfo(mv);
		return mv;
	}
	
	@RequestMapping(value = "/listAppointments/{customerID}.htm") 
	public ModelAndView listAppointmentsWithCriteria(@PathVariable("customerID")Long customerID,HttpServletRequest req,@ModelAttribute("searchCriterias")SearchCriteria searchCriterias,BindingResult result) {
		
		ModelAndView appointmentsListPage = new ModelAndView("appointment/appointmentList");
		List <Appointment> activeAppointments = appointmentService.listAppointmentsByCustomer(customerID);
		appointmentsListPage.addObject("activeAppointments",activeAppointments);

		loginInfo.getUserInfo(appointmentsListPage);
		return appointmentsListPage;		
	}	
	
	@RequestMapping(value = "/listAppointmentCustomers.htm") 
	public ModelAndView listCustomersForm4Appointment(@ModelAttribute("searchCriterias") SearchCriteria searchCriteria,@ModelAttribute("appointment") Appointment appointment,BindingResult result) {
		
		List selectedCustomers = customerService.listCustomers(searchCriteria);
 
	    ModelAndView mv = new ModelAndView("appointment/listAppointmentCustomers");
	    mv.addObject("selectedCustomers", selectedCustomers);		
	    loginInfo.getUserInfo(mv);
		return mv;
	}	
	    
 
	@RequestMapping(value="/getAppointmentForm/{customerID}.htm",method=RequestMethod.GET)
	public ModelAndView getAppointmentForm(@PathVariable("customerID")Long customerID,@ModelAttribute("appointment")Appointment appointment,BindingResult result){
		
		Customer customer = customerService.getById(customerID);
		
		ModelAndView mv =new ModelAndView("appointment/appointmentForm");
		mv.addObject("customer", customer);
		mv.addObject("hoursOfDay", ApplicationUtil.getHoursOfADay());
		loginInfo.getUserInfo(mv);
		return mv;
	}

	@RequestMapping(value="/appointmentDetail/{appointmentID}/{customerID}.htm",method=RequestMethod.GET)
	public ModelAndView getAppointmentDetailForm(@PathVariable("customerID")Long customerID,@PathVariable("appointmentID")Long appointmentID,@ModelAttribute("appointmentUpdate")Appointment appointment,BindingResult result){
		
		Customer customer = customerService.getById(customerID);
		Appointment appointmentEx = appointmentService.getById(appointmentID);
		
		ModelAndView mv =new ModelAndView("appointment/appointmentForm");
		mv.addObject("customer", customer);
		mv.addObject("appointment", appointmentEx);
		mv.addObject("hoursOfDay", ApplicationUtil.getHoursOfADay());
		loginInfo.getUserInfo(mv);
		return mv;
	}	
	

	@RequestMapping(value = "/saveAppointmentForm.htm")
	public ModelAndView saveAppointmentForm(HttpServletRequest request,@ModelAttribute("appointment")Appointment appointment,BindingResult result){

		AppointmentValidator validator = new AppointmentValidator();
		validator.validate(appointment, result);

		if(result.hasErrors()){
			ModelAndView returnView = new ModelAndView("customer/customerForm");
			loginInfo.getUserInfo(returnView);
			return returnView;
		}
		appointmentService.addAppointment(appointment);

		ModelAndView mv = new ModelAndView("redirect:/index.htm");
		loginInfo.getUserInfo(mv);
		return mv;
	}	

	@RequestMapping(value = "/updateAppointmentForm.htm")
	public ModelAndView appointmentUpdateForm(HttpServletRequest req,@ModelAttribute("appointment")Appointment appointment,BindingResult result) {
			appointmentService.updateAppointment(appointment);
			
			ModelAndView mv = new ModelAndView("redirect:/appointment/listAppointments/"+appointment.getCustomerId()+".htm");
			return mv;
	} 		
		
	
	@RequestMapping(value = "/deleteAppointmentForm.htm")
	public ModelAndView appointmentDeleteForm(HttpServletRequest req,@ModelAttribute("appointment")Appointment appointment,BindingResult result) {
		
		appointmentService.deleteAppointment(appointment);

		ModelAndView mv = new ModelAndView("redirect:/appointment/listAppointments/"+appointment.getCustomerId()+".htm");
		return mv;
	}	
	
}
