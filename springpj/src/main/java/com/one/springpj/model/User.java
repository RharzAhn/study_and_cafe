package com.one.springpj.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.format.annotation.DateTimeFormat;

import com.one.springpj.constant.Role;

import lombok.Data;

@Data
@Entity
public class User {
	@Id
	@GeneratedValue
	@Column(name="user_id")
	private Long id;
	
	@Column(nullable=false,unique=true)
	private String username;
	
	@Column(nullable=false)
	private String password;
	
	@Column(nullable=false)
	private String nick;
	
	private String email;
	private String addr;
	
	@Column(nullable=false)
	@Enumerated(EnumType.STRING)
	private Role role;
	
	private String profile;
	
	@CreationTimestamp
	@DateTimeFormat(pattern = "yyMMdd")
	private Date regdate;
	
	@ColumnDefault("0")
	private Integer mileage;
}
