package com.one.springpj.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Board {
	@Id
	@GeneratedValue
	@Column(name="board_id")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="study_id")
	@JsonIgnore
	private Study study;
	
//	@ManyToOne
//	@JoinColumn(name="writer_id")
//	@JsonIgnore
	private String writer;
	
	@CreationTimestamp
	@DateTimeFormat( pattern = "yy-MM-dd")
	private Date regdate;
	
	@Lob
	private String content;
	
	@ColumnDefault("0")
	private boolean pinned;

}
