package com.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class SignUpInfo {
	@Id
	private String userName;
	private long phoneNumber;
	private String email;
	private String password;
	@OneToMany(mappedBy = "signUpInfo")
	private List<AccountInfo> accountInfo;
	public SignUpInfo() {
		super();
	}
	public SignUpInfo(String userName, long phoneNumber, String email, String password, List<AccountInfo> accountInfo) {
		super();
		this.userName = userName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.password = password;
		this.accountInfo = accountInfo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public List<AccountInfo> getAccountInfo() {
		return accountInfo;
	}
	public void setAccountInfo(List<AccountInfo> accountInfo) {
		this.accountInfo = accountInfo;
	}
	@Override
	public String toString() {
		return "SignUpInfo [userName=" + userName + ", phoneNumber=" + phoneNumber + ", email=" + email + ", password="
				+ password + "]";
	}
	
	
}
