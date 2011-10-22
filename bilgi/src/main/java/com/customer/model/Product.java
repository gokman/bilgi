package com.customer.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="urun")
public class Product {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="id")
	private long urun_id;
	
	@Column(name="tip", length=45)
	private String tip;
	
	@Column(name="sehir", length=45)
	private String sehir;
	
	@Column(name="semt",length=45)
	private String semt;
	
	@Column(name="adres_detay", length=255)
	private String adres_detay;

	@Column(name="ebat")
	private long ebat;
	
	@Column(name="ozellik_detay", length=255)
	private String ozellik_detay;
}
