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
	
	@Column(name = "alt_deger")
	private Long altdeger;
	
	@Column(name = "ust_deger")
	private Long ustdeger;
	
	@Column(name = "ebat")
	private Long ebat;

	public Long getid() {
		return id;
	}

	public void setid(Long id) {
		this.id = id;
	}

	public Long getmusteriId() {
		return musteriId;
	}

	public void setmusteriId(Long musteriId) {
		this.musteriId = musteriId;
	}

	public String gettip() {
		return tip;
	}

	public void settip(String tip) {
		this.tip = tip;
	}

	public String getsemt() {
		return semt;
	}

	public void setsemt(String semt) {
		this.semt = semt;
	}

	public String getsehir() {
		return sehir;
	}

	public void setsehir(String sehir) {
		this.sehir = sehir;
	}

	public Long getaltdeger() {
		return altdeger;
	}

	public void setaltdeger(Long altdeger) {
		this.altdeger = altdeger;
	}

	public Long getustdeger() {
		return ustdeger;
	}

	public void setustdeger(Long ustdeger) {
		this.ustdeger = ustdeger;
	}

	public Long getebat() {
		return ebat;
	}

	public void setebat(Long ebat) {
		this.ebat = ebat;
	}

	
}
