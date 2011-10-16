package com.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.customer.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
    
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ApplicationContext appContext;
}
