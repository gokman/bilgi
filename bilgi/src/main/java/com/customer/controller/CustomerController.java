package com.customer.controller;
import java.io.File;


import java.io.IOException;
import java.security.Security;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.text.ParseException;

import java.util.ArrayList;
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

import com.customer.demand.model.CustomerDemand;
import com.customer.demand.service.CustomerDemandService;
import com.customer.model.Customer;
import com.customer.service.CustomerService;
import com.image.model.EntityImage;
import com.util.constants.ApplicationConstants;
import com.util.search.SearchCriteria;
import com.util.validator.CustomerValidator;
import com.util.login.check.LoginCheck;
@Controller
@RequestMapping("/customer")
public class CustomerController{

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CustomerDemandService customerDemandService;

	private LoginCheck loginInfo = new LoginCheck();

	@RequestMapping(value = "/addCustomer.htm",method = RequestMethod.GET) 
	public ModelAndView getCustomerForm(@ModelAttribute("customer") Customer customer,BindingResult result) {
		
		List<String> currencyList = new ArrayList<String>();
		currencyList.add(ApplicationConstants.CurrencyType.TL);
		currencyList.add(ApplicationConstants.CurrencyType.DOLAR);
		currencyList.add(ApplicationConstants.CurrencyType.EURO);
		
	    ModelAndView mv = new ModelAndView("customer/customerForm");
	    mv.addObject("currencyList",currencyList);
	    loginInfo.getUserInfo(mv);
		return mv;
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
			loginInfo.getUserInfo(returnView);
			List<String> currencyList = new ArrayList<String>();
			currencyList.add(ApplicationConstants.CurrencyType.TL);
			currencyList.add(ApplicationConstants.CurrencyType.DOLAR);
			currencyList.add(ApplicationConstants.CurrencyType.EURO);
			returnView.addObject("currencyList",currencyList);
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

		loginInfo.getUserInfo(imageForm);
		return imageForm;
	}	

	@RequestMapping(value = "/listCustomers.htm",method = RequestMethod.GET) 
	public ModelAndView getCustomerList(@ModelAttribute("searchCriterias") SearchCriteria searchCriterias,BindingResult result) {
		ModelAndView custListPage = new ModelAndView("customer/customerList");
		List activeCustomers = customerService.listCustomers();
		custListPage.addObject("activeCustomers", activeCustomers);

		loginInfo.getUserInfo(custListPage);
		return custListPage;
	}	
	
	@RequestMapping(value = "/customerDetail/{id}.htm",method=RequestMethod.GET) 
	public ModelAndView detailLookupForm(HttpServletRequest req,@PathVariable("id")String id ,@ModelAttribute("customerDetail")Customer customerDetail,BindingResult result) {
                ModelAndView detailPage=new ModelAndView("customer/customerDetail");
               
                Customer detay=customerService.getById(Long.parseLong(id));
                detailPage.addObject("musterim",detay);
                	
                loginInfo.getUserInfo(detailPage);
                return detailPage;
	}
	@RequestMapping(value = "/listCustomersWithCriteria.htm") 
	public ModelAndView listCustomersWithCriteria(HttpServletRequest req,@ModelAttribute("searchCriterias")SearchCriteria searchCriterias,BindingResult result) {
		
		ModelAndView custListPage = new ModelAndView("customer/customerList");
		List activeCustomers = customerService.listCustomers(searchCriterias);
		custListPage.addObject("activeCustomers", activeCustomers);
		
		loginInfo.getUserInfo(custListPage);
		return custListPage;		
	}	
	
	@RequestMapping(value = "/customerUpdatePage/{id}.htm") 
	public ModelAndView customerUpdateForm(HttpServletRequest req,@PathVariable("id")String id,@ModelAttribute("customerUpdate")Customer customer,BindingResult result) {
		
		ModelAndView custUpdatePage = new ModelAndView("customer/customerUpdateForm");
		 Customer detay=customerService.getById(Long.parseLong(id));
		 custUpdatePage.addObject("customer",detay);

		 loginInfo.getUserInfo(custUpdatePage);
		 
		return custUpdatePage;		
	}	
	
	@RequestMapping(value = "/customerUpdate.htm") 
	public ModelAndView customerUpdate(HttpServletRequest req,@ModelAttribute("customer")Customer customer,BindingResult result) {
	
		customerService.updateCustomer(customer);
		
		ModelAndView custListPage = new ModelAndView("customer/dene");
		custListPage.addObject("customer",customer);
		return custListPage;		
	} 
	
	@RequestMapping(value = "/customerDemand.htm") 
	public ModelAndView customerDemand(HttpServletRequest req,@RequestParam("id") Long id,@ModelAttribute("customer")CustomerDemand customer,BindingResult result) {
		
		ModelAndView custDemandPage = new ModelAndView("customer/customerDemand");
		custDemandPage.addObject("musteriId", id);
		loginInfo.getUserInfo(custDemandPage);
		return custDemandPage;		
	} 
	
	@RequestMapping(value = "/saveCustomerDemand.htm") 
	public ModelAndView savecustomerDemand(HttpServletRequest req,@ModelAttribute("customer")CustomerDemand customer,BindingResult result) {
		
		ModelAndView custDemandPage = new ModelAndView("/");
		loginInfo.getUserInfo(custDemandPage);
		customerDemandService.addCustomer(customer);
		return custDemandPage;		
	} 

}
