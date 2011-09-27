package com.util.membership.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "USER")
public class User {

	//Kimlik bilgileri
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Long userId;

	@Column(name = "name", nullable = false, length=20)
	private String name;

	@Column(name = "surname", nullable = false, length=20)
	private String surname;
	
	@Column( name = "password",nullable = false)
	private String password ;
	
	@Column(name = "username", nullable = false,length = 20)
	private String username;
	
	@Column(name = "date_of_birth")
	private String dateOfBirth;
	
	@Column(name = "birth_place")
	private String birthPlace;
	
	@Column(name = "membership_status")	//aktif,pasif,beklemede vs
	private String membershipStatus;	
	
	@Column( name = "adress")
	private String adress;
	
	@Column ( name = "phone_number")
	private String phoneNumber;
	
	@Column ( name = "email")
	private String email;
	
	@Column ( name = "activation_string")
	private String activationString;
	
	@Column ( name = "profile_image")
    private String profileImage;
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public User() {		
	}


	public Long getUserId() {
		return userId;
	}


	public void setUserId(Long userId) {
		this.userId = userId;
	}


	public String getDateOfBirth() {
		return dateOfBirth;
	}


	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}


	public String getBirthPlace() {
		return birthPlace;
	}


	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}


	public String getMembershipStatus() {
		return membershipStatus;
	}


	public void setMembershipStatus(String membershipStatus) {
		this.membershipStatus = membershipStatus;
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


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPassword() {
		return password;
	}
	public String getActivationString() {
		return activationString;
	}


	public void setActivationString(String activationString) {
		this.activationString = activationString;
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


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}


	public String getProfileImage() {
		return profileImage;
	}	
	
}