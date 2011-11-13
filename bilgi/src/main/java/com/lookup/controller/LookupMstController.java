package com.lookup.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.customer.model.Customer;
import com.lookup.model.LookupMst;
import com.lookup.service.LookupMstService;

@Controller
@RequestMapping("/lookup")
public class LookupMstController {
	
	@Autowired
	private LookupMstService lookupMstService;
	
	@Autowired
	private ApplicationContext appContext;

	@RequestMapping(value = "/addLookup.htm",method = RequestMethod.GET) 
	public ModelAndView getCustomerForm(@ModelAttribute("lookupMst") LookupMst lookupMst,BindingResult result) {

		return new ModelAndView("lookup/lookupForm");
	}	
	@RequestMapping(value = "/lookupMstSave.htm") 
	public ModelAndView saveCustomerForm(HttpServletRequest req,@ModelAttribute("lookupMst")LookupMst lookupMst,BindingResult result) {

		lookupMstService.saveLookupMst(lookupMst);
		
		return new ModelAndView("lookup/lookupForm");
	}	
}
