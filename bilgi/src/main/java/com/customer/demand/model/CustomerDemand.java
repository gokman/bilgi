package com.customer.demand.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "musteri_talep")
public class CustomerDemand {

	//Kimlik bilgileri
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "musteri_id")
	private Long musteriId;
	
	@Column(name = "tip")
	private String tip;
	
	@Column(name = "semt")
	private String semt;
	
	@Column(name = "sehir")
	private String sehir;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getMusteriId() {
		return musteriId;
	}

	public void setMusteriId(Long musteriId) {
		this.musteriId = musteriId;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getSemt() {
		return semt;
	}

	public void setSemt(String semt) {
		this.semt = semt;
	}

	public String getSehir() {
		return sehir;
	}

	public void setSehir(String sehir) {
		this.sehir = sehir;
	}

	public Long getAltdeger() {
		return altdeger;
	}

	public void setAltdeger(Long altdeger) {
		this.altdeger = altdeger;
	}

	public Long getUstdeger() {
		return ustdeger;
	}

	public void setUstdeger(Long ustdeger) {
		this.ustdeger = ustdeger;
	}

	public Long getEbat() {
		return ebat;
	}

	public void setEbat(Long ebat) {
		this.ebat = ebat;
	}

	@Column(name = "alt_deger")
	private Long altdeger;
	
	@Column(name = "ust_deger")
	private Long ustdeger;
	
	@Column(name = "ebat")
	private Long ebat;
}
