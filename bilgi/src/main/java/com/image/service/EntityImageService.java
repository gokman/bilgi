package com.image.service;

import java.util.List;
import com.image.model.EntityImage;

public interface EntityImageService {

		public void addImage(EntityImage image);
		
		public List<EntityImage> listImages();
		
	}