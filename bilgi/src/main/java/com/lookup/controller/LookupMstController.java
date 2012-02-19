package com.lookup.controller;

import java.util.List;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView getLookupForm(@ModelAttribute("lookupMst") LookupMst lookupMst,BindingResult result) {

		return new ModelAndView("lookup/lookupForm");
	}	
	@RequestMapping(value = "/lookupMstSave.htm") 
	public ModelAndView saveLookupForm(HttpServletRequest req,@ModelAttribute("lookupMst")LookupMst lookupMst,BindingResult result) {

		lookupMstService.saveLookupMst(lookupMst);
		
		return new ModelAndView("lookup/lookupForm");
	}
	
	@RequestMapping(value = "/lookupMstSearch.htm") 
	public ModelAndView searchLookupForm(HttpServletRequest req,@ModelAttribute("lookupSearch")LookupMst lookupSearch,BindingResult result) {
                ModelAndView modell=new ModelAndView("lookup/lookupSearchList");
                List<LookupMst> lookup=lookupMstService.searchLookupMst(lookupSearch.getBaslik());
		        modell.addObject("lookup",lookup);
		
		return modell;
	}
	
	@RequestMapping(value = "/lookupMstDetail.htm") 
	public ModelAndView detailLookupForm(HttpServletRequest req,@ModelAttribute("lookupDetail")LookupMst lookupDetail,BindingResult result) {
                ModelAndView modell=new ModelAndView("lookup/lookupDetailPage");
                List<LookupMst> detay=lookupMstService.searchLookupMst(lookupDetail.getBaslik());
                modell.addObject("detay",detay);
		
		return modell;
	}
	

}
