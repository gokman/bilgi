package com.welcome;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.*;

import com.util.login.service.LoginService;


import java.io.IOException ;
import java.util.List;
@Controller
@RequestMapping("index")
public class WelcomePageController extends AbstractController{

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private LoginService loginService;
	
	@RequestMapping(method = RequestMethod.GET)
	protected ModelAndView handleRequestInternal(HttpServletRequest arg0,HttpServletResponse arg1) throws Exception {
		logger.info("Returning hello view");
		
		System.out.println("stdout - Returning hello view");
		ModelAndView mv = new ModelAndView("product/addProduct");

		//aktif musterilerin listelenmesi
		List activeCustomers = loginService.listActiveCustomers();
		mv.addObject("activeCustomers",activeCustomers);
		
		return mv;
		}
}
