package com.goncharov.secure.entity;

import com.goncharov.secure.entity.interfaces.BaseID;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "auth_demo")
public class User implements UserDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ID")
	private int id;
	@Column(name = "LOGIN")
	private String login;
	@Column(name = "PASS")
	private String password;
	@Column(name = "time")
	Timestamp time;
	@Column(name = "role")
	@Enumerated(EnumType.STRING)
	private UserRoleEnum role;
	@Column(name = "company")
	String company;
	@Column(name = "access")
	private boolean locked;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "login_baseid_demo", joinColumns = { @JoinColumn(name = "login_id", referencedColumnName = "ID") }, inverseJoinColumns = { @JoinColumn(name = "base_id", referencedColumnName = "ID") })
	private List<BaseID> baseIdSet;

	public User(String login, String password) {
		this.login = login;
		this.password = password;
	}

	public User() {

	}

	public User(String login2, String password2, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		// TODO Auto-generated constructor stub
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public int compareTo(User o) {
		int result;
		result = login.compareTo(o.login);
		if (result != 0)
			return result;
		result = password.compareTo(o.password);

		return result;
	}

	public UserRoleEnum getRole() {
		return role;
	}

	public void setRole(UserRoleEnum role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", login=" + login + ", password=" + password
				+ ", time=" + time + ", role=" + role + ", locked=" + locked
				+ ", baseIdSet=" + baseIdSet + "]";
	}

	@ModelAttribute("allBaseId")
	public List<BaseID> getBaseIdSet() {
		return baseIdSet;
	}

	public void setBaseIdSet(List<BaseID> baseIdSet) {
		this.baseIdSet = baseIdSet;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		Set<UserRoleEnum> roles = new HashSet();
		roles.add(role);

		return roles;
	}

	@Override
	public String getUsername() {
		return login;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return locked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean isLocked() {
		return locked;
	}

	public void setLocked(boolean locked) {
		this.locked = locked;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

}
