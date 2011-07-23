package com.util.loginlogout.controller;
import java.security.Security;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.samples.mvc.basic.model.Article;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.util.constants.ApplicationConstants;
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
	
	@Autowired 
	private ApplicationContext context;
	
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
		user.setMembershipStatus(ApplicationConstants.MEMBERSHIP_STATUS_CODES.WAITING);
		validator.validate(user, result);
		//TODO user validasyonu ve þifresi gönderilecek þekilde bir  servis yazýlmalý.
		

		List <User> usersInDB = loginService.getByUsername(user.getUsername());
		if(usersInDB.size() > 0){
			result.rejectValue("username", "dublicateUsername");
		}
		usersInDB = loginService.getByEmail(user.getEmail());
		if(usersInDB.size() > 0){
			result.rejectValue("email", "dublicateEmail");
		}		
		
		
		if(result.hasErrors()){
			ModelAndView returnView = new ModelAndView("membershipForm");
			returnView.addObject("user", user);
			return returnView;
		}
		
		String to = user.getEmail();	
		try {
			String activationURL = context.getMessage("activationURL", null, Locale.getDefault());
			String activationString = MailSender.sendActivationEmail(user,activationURL);
			user.setActivationString(activationString);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		loginService.addUser(user);
			

		
		return new ModelAndView("login");
	}	
	
	@RequestMapping(value = "/activateUserAccount/{username}/{activationString}.htm")
	public ModelAndView activateUserAccount(@PathVariable("username")String username,@PathVariable("activationString") String activationString,@ModelAttribute("user")User user ,BindingResult result){
//		User kaydýnýn membership statusu aktife çekilicek.
		
		User exmpUser = new User();
		exmpUser.setActivationString(activationString);
		exmpUser.setUsername(username);
		User waitingUser = loginService.getWaitingMember(exmpUser);
		
		if(waitingUser != null){
			loginService.updateMembershipStatus(waitingUser.getUserId());
			//TODO güncelleme kýsmý eksik
			return new ModelAndView("/articles.htm");
		}else{
			return new ModelAndView("/articles.htm");
		}
	}	

	
	
	
}
