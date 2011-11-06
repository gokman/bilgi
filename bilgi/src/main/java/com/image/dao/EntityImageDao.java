package com.image.dao;

import java.util.List;

import com.image.model.EntityImage;

public interface EntityImageDao {
	// To Save the article detail
	public void saveEntityImage ( EntityImage image);
	
	public List<EntityImage> listImages();
	
	public List<EntityImage> listImages(EntityImage cust);
	
}
