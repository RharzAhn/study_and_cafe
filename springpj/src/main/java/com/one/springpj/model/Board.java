package com.one.springpj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ColumnDefault;

import lombok.Data;

@Data
@Entity
public class Board {
	@Id
	@GeneratedValue
	@Column(name="board_id")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="study_id")
	private Study study;
	
	@Lob
	private String content;
	
	@ColumnDefault("false")
	private boolean pinned;

	public String getusername() {
		// TODO Auto-generated method stub
		return null;
	}

}
