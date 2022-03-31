package com.one.springpj.domain;

import java.util.Date;
import java.util.List;

import com.one.springpj.constant.Role;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int id;
	private int mileage;
	
	private String username;
	private String password;
	private String nick;
	
	private String addr;
	private String email;
	private String profile;
	
	private Date regdate;
	
	private Role role;
	

	
}
