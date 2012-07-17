package com.appointment.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "appointment")
public class Appointment {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	
	@Column(name="customerID")
	private Long customerId;
	
	@Column(name = "app_date")
	private String app_date;
	
	@Column(name = "app_time")
	private String app_time;

	@Column(name = "app_state")
	private String app_state;
	
	@Column(name = "app_place")
	private String app_place;

	@Column(name = "description")
	private String description;


	
	
	//TODO aciklama alani eklenicek. description
	
	public String getApp_place() {
		return app_place;
	}

	public void setApp_place(String app_place) {
		this.app_place = app_place;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getApp_date() {
		return app_date;
	}

	public void setApp_date(String app_date) {
		this.app_date = app_date;
	}

	public String getApp_time() {
		return app_time;
	}

	public void setApp_time(String app_time) {
		this.app_time = app_time;
	}

	public String getApp_state() {
		return app_state;
	}

	public void setApp_state(String app_state) {
		this.app_state = app_state;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public Long getCustomerId() {
		return customerId;
	}

	
	
}