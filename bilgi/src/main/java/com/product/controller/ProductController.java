package com.product.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.product.model.Product;
import com.product.service.ProductService;
import com.util.validator.ProductValidator;

@Controller
@RequestMapping("/product")
public class ProductController {
    
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ApplicationContext appContext;
	
	@RequestMapping(value = "/addProduct.htm",method = RequestMethod.GET) 
	public ModelAndView getProductForm(@ModelAttribute("product") Product product,BindingResult result) {

		return new ModelAndView("product/productForm");
	}	

	@RequestMapping(value = "/saveProductForm.htm")
	public ModelAndView saveProductForm(HttpServletRequest req,@ModelAttribute("product")Product product,BindingResult result){

		ProductValidator validator = new ProductValidator();
		validator.validate(product, result);

		if(result.hasErrors()){
			ModelAndView returnView = new ModelAndView("customerForm");
			returnView.addObject("customer", product);
			return returnView;
		}
		productService.addProduct(product);
		ModelAndView successPage = new ModelAndView("emlakSitem");

		return successPage;
	}	
	
	
	
}
