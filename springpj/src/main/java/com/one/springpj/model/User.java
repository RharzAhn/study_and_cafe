package com.one.springpj.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import com.one.springpj.constant.JoinStatus;
import com.one.springpj.constant.Role;
import com.one.springpj.constant.StudyRole;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data
@Entity
@Getter @Setter
public class User {
	public User() {}
	public User(Long id) {
		this.id = id;
	}
	
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
	
	@OneToMany(mappedBy ="user",
			fetch=FetchType.LAZY,
			cascade = CascadeType.ALL)
	private List<Joiner> joiners;
}
