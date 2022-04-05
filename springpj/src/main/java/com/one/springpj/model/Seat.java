package com.one.springpj.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity
public class Seat {
	@Id
	@GeneratedValue
	@Column(name="seat_id")
	private Long id;
	
	private String name;
	
	@ManyToOne
	@JoinColumn(name="branch_id")
	private Branch branch;
	
	@ManyToOne
	@JoinColumn(name="book_id")
	private Book book;
	
	private int x;
	private int y;
	
	private Date startDate;
	private Date endDate;
}
