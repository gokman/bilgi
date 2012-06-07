package com.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.customer.model.Customer;
import com.product.model.Product;
import com.product.service.ProductService;
import com.util.search.SearchCriteria;
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

		ModelAndView productForm = new ModelAndView("product/productForm");
		boolean isAuthenticated = false;
		String principalResult ="";
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    if (principal == null)
	    	principalResult = null;
	    if (principal instanceof String)
	    	principalResult = (String) principal;
	    if (principal instanceof User)
	    	principalResult = ((User) principal).getUsername();
		
	    if(!principalResult.equals("anonymousUser")){
	    	isAuthenticated = true ;
	    }
		System.out.println("stdout - Returning hello view");
		productForm.addObject("isAuthenticated", isAuthenticated);
		productForm.addObject("username", principalResult);		
		
		return productForm;
	}	

	@RequestMapping(value = "/saveProductForm.htm")
	public ModelAndView saveProductForm(HttpServletRequest req,@ModelAttribute("product")Product product,@ModelAttribute("searchCriterias") SearchCriteria searchCriterias,BindingResult result){

		ProductValidator validator = new ProductValidator();
		validator.validate(product, result);

		if(result.hasErrors()){
			ModelAndView returnView = new ModelAndView("customerForm");
			returnView.addObject("customer", product);
			return returnView;
		}
		productService.addProduct(product);

		ModelAndView productListPage = new ModelAndView("product/productList");
		List activeProducts = productService.listProduct();
		productListPage.addObject("activeProducts", activeProducts );		
		
		boolean isAuthenticated = false;
		String principalResult ="";
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    if (principal == null)
	    	principalResult = null;
	    if (principal instanceof String)
	    	principalResult = (String) principal;
	    if (principal instanceof User)
	    	principalResult = ((User) principal).getUsername();
		
	    if(!principalResult.equals("anonymousUser")){
	    	isAuthenticated = true ;
	    }
		System.out.println("stdout - Returning hello view");
		productListPage.addObject("isAuthenticated", isAuthenticated);
		productListPage.addObject("username", principalResult);		
		
		return productListPage;
	}	

	@RequestMapping(value = "/listProducts.htm",method = RequestMethod.GET) 
	public ModelAndView getProductList(@ModelAttribute("searchCriterias") SearchCriteria searchCriterias,BindingResult result) {
		ModelAndView productListPage = new ModelAndView("product/productList");
		List activeProducts = productService.listProduct();
		productListPage.addObject("activeProducts", activeProducts);

		boolean isAuthenticated = false;
		String principalResult ="";
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    if (principal == null)
	    	principalResult = null;
	    if (principal instanceof String)
	    	principalResult = (String) principal;
	    if (principal instanceof User)
	    	principalResult = ((User) principal).getUsername();
		
	    if(!principalResult.equals("anonymousUser")){
	    	isAuthenticated = true ;
	    }
		System.out.println("stdout - Returning hello view");
		productListPage.addObject("isAuthenticated", isAuthenticated);
		productListPage.addObject("username", principalResult);
		
		
		
		
		return productListPage;
	}	
	
	@RequestMapping(value = "/productDetail/{id}.htm",method=RequestMethod.GET) 
	public ModelAndView detailLookupForm(HttpServletRequest req,@PathVariable("id")String id ,@ModelAttribute("productDetail")Product productDetail,BindingResult result) {
                ModelAndView modell=new ModelAndView("product/productDetail");
               
                List<Product> detay=productService.getById(Long.parseLong(id));
                modell.addObject("product",detay.get(0));
		
                
                
        		boolean isAuthenticated = false;
        		String principalResult ="";
        	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        	    if (principal == null)
        	    	principalResult = null;
        	    if (principal instanceof String)
        	    	principalResult = (String) principal;
        	    if (principal instanceof User)
        	    	principalResult = ((User) principal).getUsername();
        		
        	    if(!principalResult.equals("anonymousUser")){
        	    	isAuthenticated = true ;
        	    }
        		System.out.println("stdout - Returning hello view");
        		modell.addObject("isAuthenticated", isAuthenticated);
        		modell.addObject("username", principalResult);                
		
        		return modell;
	}
	@RequestMapping(value = "/listProductsWithCriteria.htm") 
	public ModelAndView listProductsWithCriteria(HttpServletRequest req,@ModelAttribute("searchCriterias")SearchCriteria searchCriterias,BindingResult result) {
		
		ModelAndView productListPage = new ModelAndView("product/productList");
		List activeProducts = productService.listProducts(searchCriterias);
		productListPage.addObject("activeProducts", activeProducts);

		boolean isAuthenticated = false;
		String principalResult ="";
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    if (principal == null)
	    	principalResult = null;
	    if (principal instanceof String)
	    	principalResult = (String) principal;
	    if (principal instanceof User)
	    	principalResult = ((User) principal).getUsername();
		
	    if(!principalResult.equals("anonymousUser")){
	    	isAuthenticated = true ;
	    }
		System.out.println("stdout - Returning hello view");
		productListPage.addObject("isAuthenticated", isAuthenticated);
		productListPage.addObject("username", principalResult);		
		
		
		return productListPage;		
	}	
	
	
	
}
