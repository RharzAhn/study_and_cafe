package com.one.springpj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import lombok.Data;

@Data
@Entity
public class Cafe {
	@Id
	@Column(name= "cafe_id")
	@GeneratedValue
	private Long id;
		
	@ManyToOne
	@JoinColumn(name="local_id")
	private Local local;
	
	private String name;
	private String addr;
	private String phone;
	
	@OneToOne
	@JoinColumn(name="manager_id")
	private User manager;
	
	private String profile;
}
