package com.util.loginlogout.controller;
import java.security.Security;
import java.text.SimpleDateFormat;
import java.text.ParseException;

import java.util.Date;
import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.mvc.basic.model.Article;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.util.login.service.LoginService;
import com.util.mailing.MailSender;
import com.util.membership.model.User;
import com.util.validator.MembershipFormValidator;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


@Controller
@RequestMapping("/login")
public class LoginLogoutController{

	@Autowired
	private LoginService loginService;
	
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public ModelAndView login(@ModelAttribute("article") Article  article,
			BindingResult result) {

		return new ModelAndView("login");
	}
	@RequestMapping(value = "/accessDenied.htm")
	public ModelAndView accessDenied() {

		return new ModelAndView("accessDenied");
	}	
	
	@RequestMapping(value = "/membershipForm.htm",method = RequestMethod.GET) 
	public ModelAndView getMemberForm(@ModelAttribute("user") User user,BindingResult result) {

		return new ModelAndView("membershipForm");
	}	

	@RequestMapping(value = "/membershipFormSave.htm",method = RequestMethod.POST)
	public ModelAndView saveMemberForm(@ModelAttribute("user")User user ,BindingResult result){
		MembershipFormValidator validator = new MembershipFormValidator();
//		applicationContext.getAutowireCapableBeanFactory().autowireBean(object);

		validator.validate(user, result);
		//TODO user validasyonu ve �ifresi g�nderilecek �ekilde bir  servis yaz�lmal�.
		
		if(result.hasErrors()){
			ModelAndView returnView = new ModelAndView("membershipForm");
			returnView.addObject("user", user);
			return returnView;
		}
		List <User> usersInDB = loginService.getByUsername(user.getNickName());
		if(usersInDB.size()!= 0){
			
		}
		
		String to = user.getEmail();	
		try {
			String activationURL = MailSender.sendActivationEmail(to);
		} catch (Exception e) {
			e.printStackTrace();
		}
		loginService.addUser(user);
			

		
		return new ModelAndView("login");
	}	
	
}