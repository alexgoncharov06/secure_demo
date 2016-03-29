package com.goncharov.secure.entity;

import org.springframework.security.core.GrantedAuthority;

public enum UserRoleEnum implements GrantedAuthority{

	ADMIN("ADMIN"), DISPATCHER("DISPATCHER"), USER("USER"), ANONYMOUS("ANONYMOUS");
	
	String userProfileType;

	UserRoleEnum() {
	}
	UserRoleEnum(String userProfileType) {
		this.userProfileType = userProfileType;
	}
	
	public String getUserProfileType(){
		return userProfileType;
	}
	
	 @Override
	    public String getAuthority() {
	        return "ROLE_" + getUserProfileType();
//	        return name();
	    }
	 
}