package com.customer.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "musteri")
public class Customer {

	//Kimlik bilgileri
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "id")
	private Long customerId;

	@Column(name = "ad", nullable = false, length=20)
	private String name;

	@Column(name = "soyad", nullable = false, length=20)
	private String surname;
	
	//Meslek ve Mali Durum Bilgileri
	
	@Column ( name="salary")
	private Long salary;
		@Column(name="occupation")
	private String occupation;
	
	@Column(name="education_level")
	private String educationLevel;
	
	@Column(name="place_of_work")
	private String placeOfWork;
	
	@Column(name="settlement_status")
	private String settlementStatus;
	
	//Ýletisim Bilgileri
	@Column( name = "adres_detay")
	private String adress;
	
	@Column ( name = "tel")
	private String phoneNumber;
	
	@Column ( name = "email")
	private String email;

	@Column ( name = "sehir")
	private String city;
	
	@Column ( name = "ulke")
	private String country;

	@Column ( name = "profile_image")
    private String profileImage;	
 	
	//2nd part
	@Column (name="gender")
	private String gender;
	
	@Column (name="marital_status")
	private String maritalStatus;
	
	public String getCity() {
		return city;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getEducationLevel() {
		return educationLevel;
	}

	public void setEducationLevel(String educationLevel) {
		this.educationLevel = educationLevel;
	}

	public String getPlaceOfWork() {
		return placeOfWork;
	}

	public void setPlaceOfWork(String placeOfWork) {
		this.placeOfWork = placeOfWork;
	}

	public String getSettlementStatus() {
		return settlementStatus;
	}

	public void setSettlementStatus(String settlementStatus) {
		this.settlementStatus = settlementStatus;
	}


	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGender() {
		return gender;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setSalary(Long salary) {
		this.salary = salary;
	}

	public Long getSalary() {
		return salary;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getProfileImage() {
		return profileImage;
	}
	
	
}