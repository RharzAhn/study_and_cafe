package com.one.springpj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class Seat {
	@Id
	@GeneratedValue
	@Column(name="seat_id")
	private Long id;
	
	private String name;
	
	@ManyToOne
	@JoinColumn(name="cafe_id")
	private Branch cafe;
	
	@ManyToOne
	@JoinColumn(name="book_id")
	private Book book;
	
	private int x;
	private int y;
}
