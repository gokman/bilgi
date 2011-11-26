package com.util.loginlogout.controller;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.util.constants.ApplicationConstants;
import com.util.login.service.LoginService;
import com.util.mailing.MailSender;
import com.util.membership.model.User;
import com.util.validator.MembershipFormValidator;


@Controller
@RequestMapping("/login")
public class LoginLogoutController{

	@Autowired
	private LoginService loginService;
	
    private static final String destinationDir = "C:/temp/";
	
	
	@Autowired 
	private ApplicationContext context;
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public ModelAndView login(
			BindingResult result) {

		return new ModelAndView("login");
	}
	@RequestMapping(value = "/accessDenied.htm")
	public ModelAndView accessDenied() {

		return new ModelAndView("accessDenied");
	}	
	
	@RequestMapping(value = "/membershipForm.htm",method = RequestMethod.GET) 
	public ModelAndView getMemberForm(@ModelAttribute("user") User user,BindingResult result) {

		return new ModelAndView("/membership/membershipForm");
	}	

	@RequestMapping(value = "/membershipFormSave.htm",method = RequestMethod.POST)
	public ModelAndView saveMemberForm(HttpServletRequest req,@ModelAttribute("user")User user ,BindingResult result,@RequestParam("file") MultipartFile file){
		String profileImagePath = "/resources/kariyer/"+file.getOriginalFilename();
		File newFiles= new File(req.getSession().getServletContext().getRealPath(profileImagePath));
	
		
        File destination = new File(destinationDir + file.getOriginalFilename());
        try {
			file.transferTo(newFiles);
		} catch (Exception e1) {

			e1.printStackTrace();
		}
		MembershipFormValidator validator = new MembershipFormValidator();
//		applicationContext.getAutowireCapableBeanFactory().autowireBean(object);
		user.setMembershipStatus(ApplicationConstants.MEMBERSHIP_STATUS_CODES.WAITING);
		user.setProfileImage(profileImagePath);
		validator.validate(user, result);
		//TODO user validasyonu ve sifresi gonderilecek sekilde bir  servis yazilmali.
		

		List <User> usersInDB = loginService.getByUsername(user.getUsername());
		if(usersInDB.size() > 0){
			result.rejectValue("username", "dublicateUsername");
		}
		usersInDB = loginService.getByEmail(user.getEmail());
		if(usersInDB.size() > 0){
			result.rejectValue("email", "dublicateEmail");
		}		
		
		
		if(result.hasErrors()){
			ModelAndView returnView = new ModelAndView("/membership/membershipForm");
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
			

		ModelAndView mv = new ModelAndView("/membership/membershipSuccessPage");
		mv.addObject("email", user.getEmail());
		return mv;
	}	
	
	@RequestMapping(value = "/activateUserAccount/{username}/{activationString}.htm")
	public ModelAndView activateUserAccount(@PathVariable("username")String username,@PathVariable("activationString") String activationString,@ModelAttribute("user")User user ,BindingResult result){
//		User kaydinin membership statusu aktife cekilicek.
		
		User exmpUser = new User();
		exmpUser.setActivationString(activationString);
		exmpUser.setUsername(username);
		User waitingUser = loginService.getWaitingMember(exmpUser);
		
		if(waitingUser != null){
			loginService.updateMembershipStatus(waitingUser.getUserId());
			return new ModelAndView("/index.htm");
		}else{
			//TODO aktivasyon hata sayfasý
			
			return new ModelAndView("/index.htm");
		}
	}	

	
	
	@RequestMapping(value = "/requestPassword.htm",method = RequestMethod.GET) 
	public ModelAndView getRequestPassowrdForm() {

		return new ModelAndView("/membership/requestPassword");
	}	
	
	
	
	@RequestMapping(value = "/sendForgottenPassword.htm")
	public ModelAndView sendForgottenPassword(@RequestParam("email") String email) throws Exception{
		
		
		User exmpUser = new User();
		exmpUser.setEmail(email);
		exmpUser.setMembershipStatus(ApplicationConstants.MEMBERSHIP_STATUS_CODES.ACTIVE);
		User existingUser = loginService.getUser(exmpUser);
		
		if(existingUser != null){
			MailSender.sendForgottenPassword(existingUser);
			ModelAndView mv = new ModelAndView("membership/requestPasswordSuccessPage");
			mv.addObject("email", existingUser.getEmail());
			return mv;
		}else{
			//TODO bu mail adresiyle kayitli kullanici bulunmamaktadir
			
			return new ModelAndView("/index.htm");
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/accessDenied.do")
	public void accessDenied(ModelMap model,HttpServletRequest request) {
	}
}
