package com.misha.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.ToString;

@Entity
@ToString
@Table(name = "user")
public class User {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	private String contactname;

	private String email;

	private String password;

	private String company;

	private String address;

	private String latitude;

	private String longitude;

	private String open;

	private String close;

	private float chargesperhour;

	private String logo;

	private boolean enabled;

	private String resetpassword;

	public User() {
		super();
	}

	public User(Integer id, String contactname, String email, String password, String company, String address,
			String latitude, String longitude, String open, String close, float chargesperhour, String logo,
			boolean enabled, String resetpassword) {
		super();
		this.id = id;
		this.contactname = contactname;
		this.email = email;
		this.password = password;
		this.company = company;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.open = open;
		this.close = close;
		this.chargesperhour = chargesperhour;
		this.logo = logo;
		this.enabled = enabled;
		this.resetpassword = resetpassword;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContactname() {
		return contactname;
	}

	public void setContactname(String contactname) {
		this.contactname = contactname;
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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public float getChargesperhour() {
		return chargesperhour;
	}

	public void setChargesperhour(float chargesperhour) {
		this.chargesperhour = chargesperhour;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getResetpassword() {
		return resetpassword;
	}

	public void setResetpassword(String resetpassword) {
		this.resetpassword = resetpassword;
	}
		

}