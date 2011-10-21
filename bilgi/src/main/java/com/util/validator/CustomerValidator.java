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

import com.customer.model.Customer;
import com.util.login.service.LoginService;

public class CustomerValidator  implements Validator {
 
	
    @Override
    public boolean supports(Class<?> clazz) {
        return Customer.class.isAssignableFrom(clazz);
    }
    
    
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "surname", "surname");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.must.be.entered");
        Customer customer = (Customer) target;

//        try{
//        	int test = Integer.parseInt(user.getPhoneNumber());
//        }catch(NumberFormatException ex){
//        	errors.rejectValue("phoneNumber","phoneNumber.format.error");
//        }
//        List <User> userList = loginService.getByUsername(user.getNickName());
        
        
    }
 
}