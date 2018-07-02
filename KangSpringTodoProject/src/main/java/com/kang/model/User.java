package com.kang.model;

import java.util.Collection;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails{ //시큐리티를 위해 UserDetails 인터페이스를 상속받아 구현  
	
	@NotNull @Size(min=2) @Pattern(regexp="[^0-9].*")
	private String id;
	
	@NotNull(message = "빈칸은 안된다구!!") @Size(min=2, max=20, message="2글자 이상 넣으라구!!!")
    private String name;
	
	@NotEmpty(message ="입력좀--;;")
    private String password;
    
    @Email
    private String email;
    
    private String addr;
    private String gender;
    private Collection<SimpleGrantedAuthority> rol; //계정이 가지고 있는 권한의 목록을 가지고 있는 컬럼입니다 
    public User() { //기본생성자 없으면 뭔가 안되서 추가함
    	
    }
    public User(String id, String password, Collection<SimpleGrantedAuthority> roles) { //로그인 성공시 권한부여를 위해 넣어줌 귀찮아서 이렇게함
    	this.id = id;
    	this.password = password;
    	this.rol = roles;
    }

	public String getId() {
		return id;
	}
	public void setRol(Collection<SimpleGrantedAuthority> rol) {
		this.rol = rol;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override //사실상 rol 변수로 지정한 것의 게터와 같은 역할
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return rol;
	}
	
}
