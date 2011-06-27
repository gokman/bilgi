package com.util.membership.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USER")
public class User {

	//Kimlik bilgileri
	@Id
	@GeneratedValue
	@Column(name = "user_id")
	private Long userId;

	@Column(name = "username", nullable = false, length=20)
	private String userName;

	@Column(name = "user_surname", nullable = false, length=20)
	private String userSurname;
	
	@Column( name = "password",nullable = false)
	private String password ;
	
	@Column(name = "nickname", nullable = false,length = 20)
	private String nickName;
	
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
	
	//Ýletiþim Bilgileri
	
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


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserSurname() {
		return userSurname;
	}


	public void setUserSurname(String userSurname) {
		this.userSurname = userSurname;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
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
}