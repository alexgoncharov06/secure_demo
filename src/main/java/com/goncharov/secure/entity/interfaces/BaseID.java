package com.goncharov.secure.entity.interfaces;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "base_id_demo")
public class BaseID implements Comparable<BaseID>{
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	@Column(name = "BASE_ID")
	String BaseID;
	@Column(name = "name")
	String name;
	@Column(name = "location")
	String location;
	@Column(name = "Address")
	String address;
	@Column(name = "id_district")
	int district;
	@Column (name = "phone_number")
	String phoneNumber;
	@Column(name = "status_on")
	boolean status;



	public int getID() {	
		return ID;
	}

	

	public String getBaseID() {
		return BaseID;
	}

	public void setBaseID(String baseID) {
		BaseID = baseID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getDistrict() {
		return district;
	}

	public void setDistrict(int district) {
		this.district = district;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "BaseID [ID=" + ID + ", BaseID=" + BaseID + ", name=" + name
				+ ", location=" + location + ", address=" + address
				+ ", district=" + district + ", status=" + status
				 + "]";
	}

	public void setID(int iD) {
		ID = iD;
	}



	@Override
	public int compareTo(BaseID o) {
		
		
		return this.ID - o.ID;
	}



	


}
