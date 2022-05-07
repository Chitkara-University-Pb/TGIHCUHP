package com.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class AccountInfo {
	@Id
	private long accountNumber;
	private String name;
	private String dateOfBirth;
	private long phoneNumber;
	private int age;
	private String gender;
	private String accountType;
	private String ifscCode;
	private long zipCode;
	private String branch;
	private long pin;
	private long amount;
	@ManyToOne
	private SignUpInfo signUpInfo;
	
	public AccountInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AccountInfo(long accountNumber, String name, String dateOfBirth, long phoneNumber, int age, String gender,
			String accountType, String ifscCode, long zipCode, String branch, long pin,Long amount, SignUpInfo signUpInfo) {
		super();
		this.accountNumber = accountNumber;
		this.name = name;
		this.dateOfBirth = dateOfBirth;
		this.phoneNumber = phoneNumber;
		this.age = age;
		this.gender = gender;
		this.accountType = accountType;
		this.ifscCode = ifscCode;
		this.zipCode = zipCode;
		this.branch = branch;
		this.pin = pin;
		this.amount = amount;
		this.signUpInfo = signUpInfo;
	}

	public long getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public long getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getIfscCode() {
		return ifscCode;
	}
	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	public long getZipCode() {
		return zipCode;
	}
	public void setZipCode(long zipCode) {
		this.zipCode = zipCode;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public long getPin() {
		return pin;
	}
	public void setPin(long pin) {
		this.pin = pin;
	}
	
	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public SignUpInfo getSignUpInfo() {
		return signUpInfo;
	}

	public void setSignUpInfo(SignUpInfo signUpInfo) {
		this.signUpInfo = signUpInfo;
	}

	@Override
	public String toString() {
		return "AccountInfo [accountNumber=" + accountNumber + ", name=" + name + ", dateOfBirth=" + dateOfBirth
				+ ", phoneNumber=" + phoneNumber + ", age=" + age + ", gender=" + gender + ", accountType="
				+ accountType + ", ifscCode=" + ifscCode + ", zipCode=" + zipCode + ", branch=" + branch + ", pin="
				+ pin + "]";
	}
	
	
}
