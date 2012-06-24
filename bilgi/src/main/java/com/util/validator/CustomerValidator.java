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
        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "surname", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name");
        /*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "maritalStatus", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "educationLevel", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "salary", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currencyType", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "occupation", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "placeOfWork", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "settlementStatus", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "country", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adress", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNumber", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "required");*/
        Customer customer = (Customer) target;     

//        try{
//        	int test = Integer.parseInt(user.getPhoneNumber());
//        }catch(NumberFormatException ex){
//      	errors.rejectValue("phoneNumber","phoneNumber.format.error");
//        }
//        List <User> userList = loginService.getByUsername(user.getNickName());
        
        
    }
 
}