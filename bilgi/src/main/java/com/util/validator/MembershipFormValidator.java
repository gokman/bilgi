package com.util.validator;



import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.bean.ViewScoped;
import javax.servlet.jsp.tagext.ValidationMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.util.login.service.LoginService;
import com.util.membership.model.User;

public class MembershipFormValidator  implements Validator {
 
	
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }
    
    
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "surname", "surname");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name");
        ValidationUtils.rejectIfEmpty(errors, "username", "membership","isim alani bos birakilamaz");
        
        ValidationUtils.rejectIfEmpty(errors, "dateOfBirth","birthdate", "country isim gerekli");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adress", "adress");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.must.be.entered");
        User user = (User) target;

//        try{
//        	int test = Integer.parseInt(user.getPhoneNumber());
//        }catch(NumberFormatException ex){
//        	errors.rejectValue("phoneNumber","phoneNumber.format.error");
//        }
//        List <User> userList = loginService.getByUsername(user.getNickName());
        
        
        Pattern datePattern = null;
        String dateRegEx =  "^[0-1][1-9][- / ]?(0[1-9]|[12][0-9]|3[01])[- /]?(18|19|20|21)\\d{2}$";
        String  birthDate = user.getDateOfBirth();
        boolean isValidDate = false;
        if(user.getDateOfBirth().length() != 10){
        	errors.rejectValue("dateOfBirth", "birthdate");
        }else{

            Pattern pattern = Pattern.compile(dateRegEx,Pattern.CASE_INSENSITIVE);  
            Matcher matcher = pattern.matcher(birthDate);  
            if(!matcher.matches()){  
            	errors.rejectValue("dateOfBirth", "birthdate");
            }         	
        	
        }
    }
 
}