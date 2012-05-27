package com.customer.controller;
import java.io.File;

import java.io.IOException;
import java.security.Security;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.text.ParseException;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Hibernate;
import com.customer.model.Customer;
import com.customer.service.CustomerService;
import com.image.model.EntityImage;
import com.lookup.model.LookupMst;
import com.util.constants.ApplicationConstants;
import com.util.validator.CustomerValidator;

@Controller
@RequestMapping("/customer")
public class CustomerController{

	@Autowired
	private CustomerService customerService;

	@Autowired 
	private ApplicationContext context;
	
	@RequestMapping(value = "/addCustomer.htm",method = RequestMethod.GET) 
	public ModelAndView getCustomerForm(@ModelAttribute("customer") Customer customer,BindingResult result) {

		return new ModelAndView("customer/customerForm");
	}	

	@RequestMapping(value = "/saveCustomerForm.htm")
	public ModelAndView saveCustomerForm(HttpServletRequest req,@ModelAttribute("customer")Customer customer,BindingResult result,@RequestParam("customerProfileImage") MultipartFile customerProfileImage){

		String profileImagePath = "/resources/image/customer/"+customerProfileImage.getOriginalFilename();
		File newFiles= new File(req.getSession().getServletContext().getRealPath(profileImagePath));
	
		
        try {
			customerProfileImage.transferTo(newFiles);
		} catch (Exception e1) {

			e1.printStackTrace();
		}
		customer.setProfileImage(profileImagePath);
		
		
		CustomerValidator validator = new CustomerValidator();
		validator.validate(customer, result);

		if(result.hasErrors()){
			ModelAndView returnView = new ModelAndView("customer/customerForm");
			returnView.addObject("customer", customer);
			return returnView;
		}
		customerService.addCustomer(customer);
		ModelAndView imageForm = new ModelAndView("image/imageForm");

		EntityImage image = new EntityImage();
		image.setEntityType(ApplicationConstants.EntityImageTypes.CUSTOMER);
		image.setObjectID(customer.getCustomerId());
		
		imageForm.addObject("image", image);
		imageForm.addObject("imageCount",ApplicationConstants.imageCountPerObject);

		return imageForm;
	}	

	@RequestMapping(value = "/listCustomers.htm",method = RequestMethod.GET) 
	public ModelAndView getCustomerList() {
		ModelAndView custListPage = new ModelAndView("customer/customerList");
		List activeCustomers = customerService.listCustomers();
		custListPage.addObject("activeCustomers", activeCustomers);

		return custListPage;
	}	
	
	@RequestMapping(value = "/customerDetail.htm") 
	public ModelAndView detailLookupForm(HttpServletRequest req,@RequestParam("id") long aydi ,@ModelAttribute("customerDetail")Customer customerDetail,BindingResult result) {
                ModelAndView modell=new ModelAndView("customer/customerDetail");
                String a=Long.toString(aydi);
               
                List<Customer> detay=customerService.getById(aydi);
                modell.addObject("musterim",detay.get(0));
		
		return modell;
	}

}
