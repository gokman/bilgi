package com.product.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.product.model.Product;
import com.product.service.ProductService;
import com.util.search.SearchCriteria;
import com.util.validator.ProductValidator;
import com.util.login.check.LoginCheck;
@Controller
@RequestMapping("/product")
public class ProductController {
    
	@Autowired
	private ProductService productService;
	
	@Autowired
	private LoginCheck loginInfo;
	
	@RequestMapping(value = "/addProduct.htm",method = RequestMethod.GET) 
	public ModelAndView getProductForm(@ModelAttribute("product") Product product,BindingResult result) {

		ModelAndView productForm = new ModelAndView("product/productForm");
		loginInfo.getUserInfo(productForm);
		return productForm;
	}	

	@RequestMapping(value = "/saveProductForm.htm")
	public ModelAndView saveProductForm(HttpServletRequest req,@ModelAttribute("product")Product product,@ModelAttribute("searchCriterias") SearchCriteria searchCriterias,BindingResult result,@RequestParam("productProfileImage") MultipartFile productProfileImage){

		String profileImagePath = "/resources/image/product/"+productProfileImage.getOriginalFilename();
		File newFiles= new File(req.getSession().getServletContext().getRealPath(profileImagePath));
	
		
        try {
			productProfileImage.transferTo(newFiles);
		} catch (Exception e1) {

			e1.printStackTrace();
		}
		product.setProfileImage(profileImagePath);
		
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
		productListPage.addObject("isSaveOperation",true);
		loginInfo.getUserInfo(productListPage);
		return productListPage;
	}	

	@RequestMapping(value = "/listProducts.htm",method = RequestMethod.GET) 
	public ModelAndView getProductList(@ModelAttribute("searchCriterias") SearchCriteria searchCriterias,BindingResult result) {
		ModelAndView productListPage = new ModelAndView("product/productList");
		List activeProducts = productService.listProduct();
		productListPage.addObject("activeProducts", activeProducts);

		loginInfo.getUserInfo(productListPage);
		return productListPage;
	}	
	
	@RequestMapping(value = "/productDetail/{id}.htm",method=RequestMethod.GET) 
	public ModelAndView detailLookupForm(HttpServletRequest req,@PathVariable("id")String id ,@ModelAttribute("productDetail")Product productDetail,BindingResult result) {
                ModelAndView productDetailPage=new ModelAndView("product/productDetail");
               
                List<Product> detay=productService.getById(Long.parseLong(id));
                productDetailPage.addObject("product",detay.get(0));
		
                loginInfo.getUserInfo(productDetailPage);
        		return productDetailPage;
	}
	@RequestMapping(value = "/listProductsWithCriteria.htm") 
	public ModelAndView listProductsWithCriteria(HttpServletRequest req,@ModelAttribute("searchCriterias")SearchCriteria searchCriterias,BindingResult result) {
		
		ModelAndView productListPage = new ModelAndView("product/productList");
		List activeProducts = productService.listProducts(searchCriterias);
		productListPage.addObject("activeProducts", activeProducts);

		loginInfo.getUserInfo(productListPage);
		return productListPage;		
	}	
	
	
	
}
