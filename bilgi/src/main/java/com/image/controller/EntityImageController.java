package com.image.controller;
import java.io.File;
import java.io.IOException;
import java.security.Security;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.text.ParseException;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Hibernate;

import com.image.model.EntityImage;
import com.image.service.EntityImageService;
import com.util.constants.ApplicationConstants;
import com.util.validator.CustomerValidator;

@Controller
@RequestMapping("/image")
public class EntityImageController{

	@Autowired
	private EntityImageService entityImageService;

	@Autowired 
	private ApplicationContext context;
	
	@RequestMapping(value = "/addImage.htm",method = RequestMethod.GET) 
	public ModelAndView getImageForm(@ModelAttribute("image") EntityImage image,BindingResult result) {

		return new ModelAndView("image/imageForm");
	}	

	@RequestMapping(value = "/saveImageForm.htm")
	public ModelAndView saveImageForm(HttpServletRequest req,@ModelAttribute("image")EntityImage image,BindingResult result){

		String imageTypePath ="";
		
		if(image.getEntityType().equals(ApplicationConstants.EntityImageTypes.CUSTOMER)){
			imageTypePath = ApplicationConstants.EntityImageTypePath.CUSTOMER;
		}else if(image.getEntityType().equals(ApplicationConstants.EntityImageTypes.PRODUCT)){
			imageTypePath = ApplicationConstants.EntityImageTypePath.PRODUCT;
		}

		List<EntityImage> persistedImages = new ArrayList<EntityImage>();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)req;

		for(int i = 1 ; i <= ApplicationConstants.imageCountPerObject; i++){
			EntityImage tempImage = new EntityImage();
			
			MultipartFile filea = multipartRequest.getFile("entityImage"+i);	
			String suffix = image.getEntityType()+"_"+image.getObjectID()+"_"+filea.getOriginalFilename();
			String imagePath = "/resources/image/"+imageTypePath+"/"+suffix;
			File newFiles= new File(req.getSession().getServletContext().getRealPath(imagePath));
		
			
	        try {
				filea.transferTo(newFiles);
			} catch (Exception e1) {

				e1.printStackTrace();
			}
			tempImage.setEntityType(image.getEntityType());
			tempImage.setObjectID(image.getObjectID());
			tempImage.setImagePath(imagePath);

			entityImageService.addImage(tempImage);
			persistedImages.add(tempImage);
		}
		
		ModelAndView successPage = new ModelAndView("prettyPhoto");
		List images = entityImageService.listImages();
		successPage.addObject("images", persistedImages);

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
		successPage.addObject("isAuthenticated", isAuthenticated);
		successPage.addObject("username", principalResult);
				
		
		
		return successPage;
	}	

	@RequestMapping(value = "/listCustomers.htm",method = RequestMethod.GET) 
	public ModelAndView getCustomerList() {
		ModelAndView custListPage = new ModelAndView("customer/customerList");
//		List activeCustomers = customerService.listCustomers();
//		custListPage.addObject("activeCustomers", activeCustomers);

		return custListPage;
	}	

	
	
}
