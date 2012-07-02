package com.util.validator;



import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.bean.ViewScoped;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.servlet.jsp.tagext.ValidationMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.product.model.Product;
import com.util.login.service.LoginService;

public class ProductValidator  implements Validator {
 
	
    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.isAssignableFrom(clazz);
    }
    
    
    public void validate(Object target, Errors errors) {
    //	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tip", "required");
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sehir", "required");
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "semt", "required");
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adres_detay", "required");
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ebat", "required");
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ozellik_detay", "required");

    	
    }
 
}