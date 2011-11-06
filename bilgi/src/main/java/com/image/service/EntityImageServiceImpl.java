package com.image.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.image.dao.EntityImageDao;
import com.image.model.EntityImage;

@Service("entityImageService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class EntityImageServiceImpl implements EntityImageService{

	@Autowired
	private EntityImageDao imageDao;

	public EntityImageServiceImpl() {
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addImage(EntityImage image) {
		imageDao.saveEntityImage(image);
	}

	public List<EntityImage> listImages() {
		return imageDao.listImages();
	}

}
