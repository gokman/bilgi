package com.product.model;

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

	public long getUrun_id() {
		return urun_id;
	}

	public void setUrun_id(long urun_id) {
		this.urun_id = urun_id;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getSehir() {
		return sehir;
	}

	public void setSehir(String sehir) {
		this.sehir = sehir;
	}

	public String getSemt() {
		return semt;
	}

	public void setSemt(String semt) {
		this.semt = semt;
	}

	public String getAdres_detay() {
		return adres_detay;
	}

	public void setAdres_detay(String adres_detay) {
		this.adres_detay = adres_detay;
	}

	public long getEbat() {
		return ebat;
	}

	public void setEbat(long ebat) {
		this.ebat = ebat;
	}

	public String getOzellik_detay() {
		return ozellik_detay;
	}

	public void setOzellik_detay(String ozellik_detay) {
		this.ozellik_detay = ozellik_detay;
	}

}
